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
    
def get_probability(age, sex, citizen, geo):
    age_range = get_age_range(age)
    c_name = geo["geo"]
    prob_url = f"{API_URL}/final_prediction/{age_range}/{sex}/{citizen}/{c_name}"
    
    response = requests.get(prob_url)
    return response.json()

def show_probability(age, sex, citizen, geo):
    acceptance_prob = get_probability(age, sex, citizen, geo) * 100
    country = geo["geo"]
    st.write(f"Proability of Acceptance for {country}: {acceptance_prob}")

def get_button(country, idx, age, sex, origin):
    acceptance_prob = show_probability(age, sex, origin, country)
    return st.button(f"{idx}." + country["geo"], acceptance_prob)
    
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
    geos = {}
    for country in top_three:
        geos[country["geo"]] = get_button(country, idx, age, sex, origin)
        idx += 1
    
    for country, selected in geos.items():
        if selected:
           st.write("YOU HAVE CLICKED THIS BUTTON")
           #probability = get_probability(age, sex, origin, country)
           
