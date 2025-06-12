import logging

import requests
logger = logging.getLogger(__name__)
import pandas as pd
import streamlit as st
from streamlit_extras.app_logo import add_logo
import world_bank_data as wb
import matplotlib.pyplot as plt
import numpy as np
import plotly.express as px
from modules.nav import SideBarLinks
import random  # remove later

SideBarLinks()

st.header('Religious Demographics by EU Country')

def get_country_list():
    countries_url = "http://web-api:4000/countries/countries"
    countries_get = requests.get(countries_url).json()
    countries = []
    idx = 0
    for entry in countries_get:
        if idx < 27:
            name = entry["CountryName"]
            countries.append(name)
            idx += 1
    return countries

def get_religion_list():
    religion_url = "http://web-api:4000/countries/religions"
    religions = requests.get(religion_url).json()
    
    return religions

def get_country_religion_pairs(country):
    religion_url = f"http://web-api:4000/countries/country_religion/{country}"
    pairs = requests.get(religion_url).json()
    
    return pairs
    

# Dropdown to select a country
chosen_country = st.selectbox("Select a country", get_country_list())

# Mock data: Acceptance rates for different religions (percentages)
# Just random mock data for demonstration
religions = get_religion_list()

# Generate mock acceptance rates between 10 and 90
acceptance_rates = np.random.uniform(10, 90, len(religions))

country_religion_pairs = get_country_religion_pairs(chosen_country)
# Create dataframe
df_religion = pd.DataFrame(country_religion_pairs)

switch_graph = st.toggle("See Acceptance Scores")

if switch_graph:
    st.subheader(f"Religion Acceptance Scores in {chosen_country}")
    st.write("The acceptance score for a given religion")

    acceptance_scores = px.bar(df_religion, x="Religion", y="AcceptanceScore",
                labels={"Follow Rate (%)": "Acceptance Score"},
                color_discrete_sequence=['#0C406E'],
                )

    acceptance_scores.update_traces(textposition='outside')

    st.plotly_chart(acceptance_scores, use_container_width=True)
else:
    st.subheader(f"Religious Demographic Rates in {chosen_country}")
    st.write("Percentage of population practicing a given religion")

    percent_practicing = px.bar(df_religion, x="Religion", y="PercentPracticing",
                labels={"Follow Rate (%)": "Percent Practicing"},
                color_discrete_sequence=['#0C406E'],
                )

    percent_practicing.update_traces(textposition='outside')

    st.plotly_chart(percent_practicing, use_container_width=True)


