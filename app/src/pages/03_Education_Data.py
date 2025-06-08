import logging
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

# Dropdown to select a country
chosen_country = st.selectbox("Select a country", countries)

# Mock data for education levels (percentages or any units)
education_levels = {
    "Primary":  random.uniform(50, 100),
    "Secondary": random.uniform(30, 90),
    "Tertiary": random.uniform(10, 70)
}

# Create dataframe for plotting
df_edu = pd.DataFrame({
    "Education Level": list(education_levels.keys()),
    "Percentage (%)": list(education_levels.values())
})

# Bar plot using Streamlit's built-in charting (matplotlib or plotly could be used, but here let's use st.bar_chart for simplicity)
st.subheader(f"Education Levels in {chosen_country}")
st.bar_chart(df_edu.set_index("Education Level"))