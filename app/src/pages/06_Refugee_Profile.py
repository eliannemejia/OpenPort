import logging
logger = logging.getLogger(__name__)

import requests
import streamlit as st
from modules.nav import SideBarLinks
from streamlit_extras.card import card

st.set_page_config(layout = 'wide')

API_URL = "http://web-api:4000/refugees"

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

def get_applicant_id():
    user_id = st.session_state['user_id']
    url = f"{API_URL}/{user_id}"
    try:
        aid = requests.get(url)
        if aid.status_code != 200:
            st.error(
                f"Failed to create AsylumSeeker: {aid.json().get('error', 'Unknown error')}"
            )
    except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to the API: {str(e)}")
            st.info("Please ensure the API server is running")
    
    return aid.json()


def get_applications():
    applicant_id = get_applicant_id()["ApplicantID"]
    url = f"{API_URL}/legal_aid_applications/{applicant_id}"
    try:
        applications = requests.get(url)
        if applications.status_code != 200:
            st.error(
                f"Failed to create AsylumSeeker: {applications.json().get('error', 'Unknown error')}"
            )
    except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to the API: {str(e)}")
            st.info("Please ensure the API server is running")
    
    return applications.json()

def get_family():
    applicant_id = get_applicant_id()["ApplicantID"]
    url = f"{API_URL}/family/{applicant_id}"
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


def get_lawyer_assignment():
    applicant_id = get_applicant_id()["ApplicantID"]
    url = f"{API_URL}/lawyer_assignment/{applicant_id}"
    try:
        lawyer = requests.get(url).json()
        if lawyer:
            return lawyer
    except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to the API: {str(e)}")
            st.info("Please ensure the API server is running")


st.title("View Your Profile")

st.write("### Open Applications")
applications = get_applications()
if applications:
    for idx, app in enumerate(applications, start = 1):
        st.markdown(f"""
        **Application {idx}**
        - **Description**: {app.get("AidDescription")}
        - **Submission Date**: {app.get("SubmissionDate")}
        """)
else:
    st.write("No Open Applications At This Time")

st.markdown("---")
st.write("### Family Members")
family_members = get_family()

if family_members:
    for member in family_members:
        st.markdown(f"""
        - **Name**: {member.get("FirstName")} {member.get("LastName")}
        """)
else:
    st.write("No Registered Family At This Time")

st.markdown("---")
st.write("### Lawyer Assignment")
lawyer = get_lawyer_assignment()
if "message" in lawyer:
    st.markdown("No Lawyer Assignments At This Time")
else:
    st.markdown(f"""
     - **Name**: {lawyer.get("FirstName")} {lawyer.get("LastName")}
     - **Email**: {lawyer.get("Email")}
     - **Nationality**: {lawyer.get("Nationality")}
     - **Specialization**: {lawyer.get("Sepcialization")}
     """)

