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
    st.write(f"**Proability of Acceptance**: {acceptance_prob}")

def get_button(country, idx, age, sex, origin):
    return st.button(f"{idx}." + country["geo"])
    
def get_country_list():
    countries_url = "http://web-api:4000/countries/countries"
    countries_get = requests.get(countries_url).json()
    countries = []
    for entry in countries_get:
        name = entry["CountryName"]
        countries.append(name)
    
    return countries
# set the header of the page
st.header('Asylum Acceptance Probability')

col1, col2 = st.columns(2)

with col1:
    st.write("### Enter Your Details")

    origin = st.selectbox(
        "Country of Origin",
        get_country_list(),
        index=None,
        placeholder="Select a Country",
        key="origin"
    )

    sex = st.radio(
        "Sex", 
        ["Males", "Females"],
        key="applicant_sex"
        )

    age = st.slider("Age", 0, 150)

    submit = st.button("Submit")
    
no_one = None

with col2:
    if submit:
        st.write("### Top Three Counrties with the Highest Average Acceptance for your age, sex, and nationality")

        top_three = get_top_three(sex, origin, age)
        
        idx = 1
        
        for country in top_three:
            st.write(f"### {idx}." + country["geo"],  key=f"button_{idx}")
            acceptance_prob = show_probability(age, sex, origin, country)
            idx += 1
            
    