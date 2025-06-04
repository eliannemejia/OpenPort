import logging
logger = logging.getLogger(__name__)
import pandas as pd
import streamlit as st
from streamlit_extras.app_logo import add_logo
import world_bank_data as wb
import matplotlib.pyplot as plt
import numpy as np
import plotly.express as px
import streamlit as st
import requests
from modules.nav import SideBarLinks

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

API_URL = "http://web-api:4000/refugees"



def get_age_range(age):
    if age >= 65:
        return f"65 years or over"
    if (35 <= age <= 64):
        return f"From 35 to 64 years"
    if (18 <= age <= 34):
        return f"From 18 to 34 years"
    if (18 > age >= 14):
        return f"Less than 18 years"
    if (age < 14):
        return f"Less than 14 years"
    
def get_top_three(sex, citizen, age):
    age_range = get_age_range(age)
    url = f"{API_URL}/application_stats?sex={sex}&citizen={citizen}&age={age_range}"
    
    response = requests.get(url)
    return response.json()
    
    
df = pd.read_csv("assets/list_of_countries.csv")
countries = sorted(df["Country"].dropna().unique())

# set the header of the page
st.header('Asylum Acceptance Probability')

st.write("### Enter Your Details")

origin = st.selectbox(
    "Country of Origin",
    countries,
    index=None,
    placeholder="Select a Country",
    key="origin"
)

sex = st.radio(
    "Sex", 
    ["Males", "Females", "Other"],
    key="applicant_sex"
    )

age = st.slider("Age", 0, 150)

submit = st.button("Submit")

if submit:
    top_three = get_top_three(sex, origin, age)
    idx = 1
    for country in top_three:
        st.button(f"{idx}." + country["geo"])
        idx += 1