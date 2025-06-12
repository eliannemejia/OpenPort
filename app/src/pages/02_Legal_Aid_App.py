from datetime import date
import logging
logger = logging.getLogger(__name__)
import pandas as pd
import streamlit as st
import requests
from modules.nav import SideBarLinks

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()
API_URL = "http://web-api:4000/refugees"

def create_user(f_name, l_name, email):
    create_url = API_URL + "/new_user"     
                
    user_data = {
        "FirstName": f_name,
        "LastName": l_name,
        "UserRole": "AsylumSeeker",
        "Email": email
    }
    
    try:
            # Send POST request to API
            response = requests.post(create_url, json=user_data)

            if response.status_code == 201:
                st.success("User added successfully!")
              
            else:
                st.error(
                    f"Failed to create User: {response.json().get('error', 'Unknown error')}"
                )

    except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to the API: {str(e)}")
            st.info("Please ensure the API server is running")
    return response.json()

def create_seeker(uid, dob, sex, current_loc, origin):
    create_url = f"{API_URL}/new_user/{uid}"
    
    seeker_data = {
        "DOB": str(dob),
        "SEX": sex,
        "CurrentLocation": current_loc,
        "Citizenship": origin
    }
    
    try:
        response = requests.post(create_url, json=seeker_data)

        if response.status_code == 201:
                st.success("AsylumSeeker added successfully!")

        else:
            st.error(
                f"Failed to create AsylumSeeker: {response.json().get('error', 'Unknown error')}"
            )

    except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to the API: {str(e)}")
            st.info("Please ensure the API server is running")
    
    return response.json()

def add_family_member(fid, member):
    family_id = fid["ApplicantID"]
    add_family_url = f"{API_URL}/legal_aid_application/family/{family_id}"
    try:
        response = requests.post(add_family_url, json=member)
        if response.status_code == 201:
                st.success("FamilyMember added successfully!")
                
        else:
            st.error(
                f"Failed to create FamilyMember: {response.json().get('error', 'Unknown error')}"
            )
    except requests.exceptions.RequestException as e:
            st.write("IN ADD FAMILY MEMBER")
            st.error(f"Error connecting to the API: {str(e)}")
            st.info("Please ensure the API server is running")

def add_family(fid, family_members):
    for member in family_members:
        add_family_member(fid, member)
        return family_members
    
    
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

    
def submit_application(aid_type):
    applicant_id = get_applicant_id()["ApplicantID"]
    submit_url = f"{API_URL}/legal_aid_application/{applicant_id}"
    
    app_data = {
        "AidDescription": aid_type
    }
    
    try:
        response = requests.post(submit_url, json=app_data)
        if response.status_code == 201:
            st.success("Application Submitted Successfully!")
            return response.json()
        else:
            st.error(
                f"Failed to submit Application: {response.json().get('error', 'Unknown error')}"
            )
    
    except requests.exceptions.RequestException as e:
        st.error(f"Error connecting to the API: {str(e)}")
        st.info("Please ensure the API server is running")

    
    return

def get_country_list():
    countries_url = "http://web-api:4000/countries/countries"
    countries_get = requests.get(countries_url).json()
    countries = []
    for entry in countries_get:
        name = entry["CountryName"]
        countries.append(name)
    
    return countries

# Load countries
# df = pd.read_csv("assets/list_of_countries.csv")
# countries = sorted(df["Country"].dropna().unique())

# Initialize session state
if "family_members" not in st.session_state:
    st.session_state.family_members = []

if "show_family_form" not in st.session_state:
    st.session_state.show_family_form = False

# Page header
st.header("Legal Aid Application")

st.write("### Applicant Details")

f_name = st.text_input("First Name", "")
l_name = st.text_input("Last Name", "")
dob = st.date_input(
    "Date of Birth",
    value=None, 
    min_value=date(1900, 1, 1),   
    max_value=date.today())
email = st.text_input("Email", "")

origin = st.selectbox(
    "Country of Origin",
    get_country_list(),
    index=None,
    placeholder="Select a Country",
    key="origin"
)

current_loc = st.selectbox(
    "Current Location",
    get_country_list(),
    index=None,
    placeholder="Select a Country",
    key="current_loc"
)

sex = st.radio(
    "Sex", 
    ["Male", "Female", "Other"],
    key="applicant_sex"
    )

has_family_members = st.radio(
    "Are you travelling with family members?",
    ["Yes", "No"],
    key="has_family_members"
)

if st.session_state.has_family_members == "Yes":
    st.markdown("### Family Members")

    # Show 'Add Family Member' button
    if st.button("Add Family Member ➕"):
        st.session_state.show_family_form = True

    # Show input fields like a pop-up
    if st.session_state.show_family_form:
        with st.expander("Enter Family Member Details", expanded=True):
            fam_fname = st.text_input("First Name", key="fam_fname")
            fam_lname = st.text_input("Last Name", key="fam_lname")
            fam_country = st.selectbox(
                "Country of Origin",
                get_country_list(),
                index=None,
                placeholder="Select a Country",
                key="fam_country"
            )
            fam_loc= st.selectbox(
                "Current Location",
                get_country_list(),
                index=None,
                placeholder="Select a Country",
                key="fam_loc"
            )
            
            fam_dob = st.date_input("Date of Birth", value=None, key="fam_dob")
            fam_sex = st.radio(
                    "Sex", 
                    ["Male", "Female", "Other"],
                    key="fam_sex"
                    )

            if st.button("Save"):
                new_member = {
                    "FirstName": fam_fname,
                    "LastName": fam_lname,
                    "Citizenship": fam_country,
                    "CurrentLocation": fam_loc,
                    "DOB": str(fam_dob),
                    "SEX": fam_sex
                }
                st.session_state.family_members.append(new_member)
                st.success(f"Added {fam_fname} {fam_lname}")
                st.session_state.show_family_form = False
                
aid_type = st.radio(
    "What kind of aid are you seeking?",
    ["Asylum Application", "Citizenship Application", "Family Reunification", "Other"],
    key="aid_type")

if aid_type == "Other":
    aid_type = st.text_input("Enter desired aid topic", "")

                
submitted = st.button("Submit")

if submitted:
    if not all([f_name, l_name, email, origin, sex, dob, current_loc, has_family_members, aid_type]):
            st.error("Please fill in all required fields marked with *")
    else:
        fid = get_applicant_id()
        add_family(fid, st.session_state.family_members)
        submission = submit_application(aid_type)
        if submission:
            st.write("Application Successfully Submitted")
        
    
# --------------------- Display saved family members ------------------------
if st.session_state.family_members:
    st.write("#### Family Members Added:")
    for idx, member in enumerate(st.session_state.family_members, start=1):
        st.markdown(f"**{idx}.** {member['FirstName']} {member['LastName']} from {member['Citizenship']}")

st.markdown("""
    <style>
    div.stButton > button {
        background-color: #0C406E;
        color: white;
    }
    div.stButton > button:hover {
        background-color: #FFFFFF;
        color: #0C406E;
    }
    </style>
    """, unsafe_allow_html=True)