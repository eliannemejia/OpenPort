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

SideBarLinks()

st.header('Religious Demographics by Country')

# Load countries from CSV
df_countries = pd.read_csv("assets/list_of_countries.csv")
countries = sorted(df_countries["Country"].dropna().unique())

# Dropdown to select a country
chosen_country = st.selectbox("Select a country", countries)

# Mock data: Acceptance rates for different religions (percentages)
# Just random mock data for demonstration
religions = ["Christianity", "Islam", "Hinduism", "Buddhism", "Judaism", "Other"]

# Generate mock acceptance rates between 10 and 90
acceptance_rates = np.random.uniform(10, 90, len(religions))

# Create dataframe
df_religion = pd.DataFrame({
    "Religion": religions,
    "Acceptance Rate (%)": acceptance_rates
})

st.subheader(f"Religious Acceptance Rates in {chosen_country}")

fig = px.bar(df_religion, x="Religion", y="Acceptance Rate (%)",
             title=f"Religious Acceptance Rates in {chosen_country}",
             labels={"Acceptance Rate (%)": "Acceptance Rate (%)"},
             text=df_religion["Acceptance Rate (%)"].round(1))

fig.update_traces(textposition='outside')

st.plotly_chart(fig, use_container_width=True)
