import logging
logger = logging.getLogger(__name__)
import pandas as pd
import streamlit as st
from streamlit_extras.app_logo import add_logo
import world_bank_data as wb
import matplotlib.pyplot as plt
import numpy as np
import plotly.express as px
from modules.nav import SideBarLinks

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

def add_family_member():
    # stub 
    return
family_members = []
df = pd.read_csv("assets/list_of_countries.csv")

country_column = "Country"
countries = sorted(df[country_column].dropna().unique())

# set the header of the page
st.header('Legal Aid Application')

with st.form("my_form"):
    st.write("Inside the form")
    f_name = st.text_input("First Name", "")
    l_name = st.text_input("Last Name", "")
    
    origin = st.selectbox(
    "Country of Origin",
    countries,
    index=None,
    placeholder="Select a Country",
    key="origin",
)
    
    current_loc = st.selectbox(
    "Current Location",
    countries,
    index=None,
    placeholder="Select a Country",
    key="current_loc",
)
    
    has_family_members = st.radio(
    "Are you travelling with family members?",
    ["Yes", "No"],
)

    submitted = st.form_submit_button("Submit")

if has_family_members:
    st.write("### Family Members")

    if st.button("Add Family Member +"):
        add_family_member()

    # Display input fields for each family member
    for idx, member in enumerate(family_members):
        st.markdown(f"**Family Member #{idx+1}**")
        member["f_name"] = st.text_input(f"First Name {idx+1}", key=f"fam_fname_{idx}")
        member["l_name"] = st.text_input(f"Last Name {idx+1}", key=f"fam_lname_{idx}")
        member["country"] = st.selectbox(
            f"Country of Origin {idx+1}",
            countries,
            index=None,
            placeholder="Select a Country",
            key=f"fam_country_{idx}"
        )

# Optional: handle submitted data
if submitted:
    st.success("Form Submitted!")
    st.write("**Primary Applicant**:", f_name, l_name, origin, current_loc)
    if has_family_members == "Yes":
        st.write("**Family Members:**")
        