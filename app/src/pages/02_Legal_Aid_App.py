import logging
logger = logging.getLogger(__name__)
import pandas as pd
import streamlit as st
from modules.nav import SideBarLinks

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

# Load countries
df = pd.read_csv("assets/list_of_countries.csv")
countries = sorted(df["Country"].dropna().unique())

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
email = st.text_input("Email", "")

origin = st.selectbox(
    "Country of Origin",
    countries,
    index=None,
    placeholder="Select a Country",
    key="origin"
)

current_loc = st.selectbox(
    "Current Location",
    countries,
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
                countries,
                index=None,
                placeholder="Select a Country",
                key="fam_country"
            )
            fam_country = st.selectbox(
                "Current Location",
                countries,
                index=None,
                placeholder="Select a Country",
                key="fam_loc"
            )

            if st.button("Save"):
                new_member = {
                    "First Name": fam_fname,
                    "Last Name": fam_lname,
                    "Country of Origin": fam_country
                }
                st.session_state.family_members.append(new_member)
                st.success(f"Added {fam_fname} {fam_lname}")
                st.session_state.show_family_form = False
                
aid_type = st.radio(
    "What kind of aid are you seeking?",
    ["Asylum Application", "Citizenship Application", "Family Reuinification", "Other"],
    key="aid_type")

if aid_type == "Other":
    aid_type = st.text_input("Enter desired aid topic", "")
    
headshot = st.file_uploader("Upload a Headshot", type=["jpg", "jpeg", "png"])
if headshot:
    st.image(headshot)
                
submitted = st.button("Submit")

# --------------------- Display saved family members ------------------------
if st.session_state.family_members:
    st.write("#### Family Members Added:")
    for idx, member in enumerate(st.session_state.family_members, start=1):
        st.markdown(f"**{idx}.** {member['First Name']} {member['Last Name']} from {member['Country of Origin']}")
