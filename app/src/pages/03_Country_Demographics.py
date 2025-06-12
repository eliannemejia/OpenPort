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

def get_education_data(country_name):
    """Fetch education data for a specific country from the API"""
    try:
        education_url = "http://web-api:4000/refugees/educationlevel"
        response = requests.get(education_url)
        
        if response.status_code == 200:
            all_education_data = response.json()
            
            # Filter data for the selected country
            country_data = [entry for entry in all_education_data if entry.get("CountryName") == country_name]
            
            # Process the data to get education levels and their corresponding values
            education_levels = {}
            
            for entry in country_data:
                level_name = entry.get("LevelName")
                # You can choose which metric to display - AccessScore, Ranking, or TotalStudents
                # Using AccessScore as percentage for now
                access_score = entry.get("AccessScore", 0)
                education_levels[level_name] = access_score
            
            return education_levels
        else:
            st.error(f"Failed to fetch education data")
            return None
            
    except Exception as e:
        st.error(f"Error fetching education data: {str(e)}")
        logger.error(f"Error in get_education_data: {str(e)}")
        return None

# Get education data from API
education_data = get_education_data(chosen_country)

if education_data:
    # Create dataframe for plotting
    df_edu = pd.DataFrame({
        "Education Level": list(education_data.keys()),
        "Access Score": list(education_data.values())
    })
    
    st.subheader(f"Education Access Statistics for {chosen_country}")
    st.write(f"Education access scores by level")
    
    fig = px.bar(df_edu, x="Education Level", y="Access Score",
                 labels={"Education Level": "Education Level", "Access Score": "Access Score"},
                 color_discrete_sequence=['#0C406E'],
                 )
    fig.update_traces(
        textposition='outside',
        hoverlabel=dict(
            font_size=16 
        )
    )
    
    st.plotly_chart(fig, use_container_width=True)
    
    # Display raw data in an expandable section
    with st.expander("View Raw Education Data"):
        st.dataframe(df_edu)
        
else:
    # Fallback to mock data if API fails
    st.warning(f"Could not fetch education data for {chosen_country}. Showing mock data.")
    
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

    st.subheader(f"Education Completion Statistics for {chosen_country} (Mock Data)")
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