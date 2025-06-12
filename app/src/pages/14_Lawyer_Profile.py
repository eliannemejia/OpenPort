import logging
logger = logging.getLogger(__name__)

import requests
import streamlit as st
from modules.nav import SideBarLinks
from streamlit_extras.card import card

st.set_page_config(layout = 'wide')

API_URL = "http://web-api:4000/lawyers"

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

def get_lawyer_id():
    user_id = st.session_state['user_id']
    url = f"{API_URL}/{user_id}"
    try:
        aid = requests.get(url)
        if aid.status_code != 200:
            st.error(
                f"Failed to retreive LawyerID: {aid.json().get('error', 'Unknown error')}"
            )
    except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to the API: {str(e)}")
            st.info("Please ensure the API server is running")
    
    return aid.json()

def get_family(aid):
    url = f"http://web-api:4000/refugees/family/{aid}"
    try:
        family = requests.get(url)
        if family.status_code != 200:
            st.error(
                f"Failed to create AsylumSeeker: {family.json().get('error', 'Unknown error')}"
            )
    except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to the API: {str(e)}")
            st.info("Please ensure the API server is running")
    
    return family.json()


def get_case_assignments():
    lawyer_id = get_lawyer_id()["LawyerID"]
    url = f"{API_URL}/case_assignments/{lawyer_id}"
    try:
        cases = requests.get(url).json()
        if cases:
            return cases
    except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to the API: {str(e)}")
            st.info("Please ensure the API server is running")


st.title("View Your Profile")

st.write("### Assigned Cases")
st.markdown("---")
cases = get_case_assignments()
if cases:
    for idx, case in enumerate(cases, start = 1):
        family_members = get_family(case["ApplicantID"])
        st.markdown(f"""
        **Case {idx}**
        - **Name**: {case.get("FirstName")} {case.get("LastName")}
        - **Email**: {case.get("Email")}
        - **Country of Origin**: {case.get("Country of Origin")}
        - **Current Location**: {case.get("Current Location")}
        """)
        st.markdown("**Associated Family Members**")
        if family_members:
            for member in family_members:
                st.markdown(f"""
                - **Name**: {member.get("FirstName")} {member.get("LastName")}
                """)
        else:
            st.write("No Registered Family for Applicant At This Time")
        st.markdown("---")
        
else:
    st.write("No Assigned Cases At This Time")

