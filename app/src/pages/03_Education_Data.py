import logging

import requests
logger = logging.getLogger(__name__)
import pandas as pd
import streamlit as st
from modules.nav import SideBarLinks
import random  # remove later

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

# set the header of the page
st.header('Education Data by Country')


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

# Dropdown to select a country
chosen_country = st.selectbox("Select a country", get_country_list())

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

# Bar plot using Streamlit's built-in charting (matplotlib or plotly could be used, but here let's use st.bar_chart for simplicity)
st.subheader(f"Education Levels in {chosen_country} \n(Based off of the percentage of the population in {chosen_country} who attended each education level)")
st.bar_chart(df_edu.set_index("Education Level"), x_label="Education Level", y_label="Percentage of population")
