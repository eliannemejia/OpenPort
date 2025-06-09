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
    "Acceptance Rate (%)": acceptance_rates.round(1)})

st.subheader(f"Religious Acceptance Rates in {chosen_country} \n(Based off of how accepting people in {chosen_country} are of different religions)")

fig = px.bar(df_religion, x="Religion", y="Acceptance Rate (%)",
             title=f"Religious Acceptance Rates in {chosen_country}",
             labels={"Acceptance Rate (%)": "Acceptance Rate (%)"},
             )

fig.update_traces(textposition='outside')

st.plotly_chart(fig, use_container_width=True)
