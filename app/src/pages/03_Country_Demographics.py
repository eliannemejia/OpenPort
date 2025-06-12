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

st.header('Religious Demographics by Country')

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

# Dropdown to select a country
chosen_country = st.selectbox("Select a country", get_country_list())

# Mock data: Acceptance rates for different religions (percentages)
# Just random mock data for demonstration
religions = ["Christianity", "Islam", "Hinduism", "Buddhism", "Judaism", "Other"]

# Generate mock acceptance rates between 10 and 90
acceptance_rates = np.random.uniform(10, 90, len(religions))

# Create dataframe
df_religion = pd.DataFrame({
    "Religion": religions,
    "Follow Rate (%)": acceptance_rates.round(1)})

st.subheader(f"Religious Demographics Rates in {chosen_country}")
st.write("Percentage of population practicing a given religion")

fig = px.bar(df_religion, x="Religion", y="Follow Rate (%)",
             labels={"Follow Rate (%)": "Follow Rate (%)"},
             color_discrete_sequence=['#0C406E'],
             )

fig.update_traces(
    textposition='outside',
    hoverlabel=dict(
        font_size=16 
    )
)
st.plotly_chart(fig, use_container_width=True)

# Load countries from CSV
df_countries = pd.read_csv("assets/list_of_countries.csv")
countries = sorted(df_countries["Country"].dropna().unique())

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


# Mock data for education levels (percentages or any units)
education_levels = {
    "Primary":  round(random.uniform(50, 100), 1),
    "Secondary": round(random.uniform(30, 90), 1),
    "Tertiary": round(random.uniform(10, 70),1)
}

# Create dataframe for plotting
df_edu = pd.DataFrame({
    "Education Level": list(education_levels.keys()),
    "Percentage (%)": list(education_levels.values())
})

st.subheader(f"Education Completion Statistics for {chosen_country} ")
st.write(f"Percentage of population that completed each level of education")

fig = px.bar(df_edu, x="Education Level", y="Percentage (%)",
             labels={"Education Level": "Percentage of Population"},
             color_discrete_sequence=['#0C406E'],
             )
fig.update_traces(
    textposition='outside',
    hoverlabel=dict(
        font_size=16 
    )
)


st.plotly_chart(fig, use_container_width=True)
