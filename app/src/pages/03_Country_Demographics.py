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


# Load countries from CSV
df_countries = pd.read_csv("assets/list_of_countries.csv")
countries = sorted(df_countries["Country"].dropna().unique())




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
                # Using TotalStudents to show number of students per education level
                total_students = entry.get("TotalStudents", 0)
                education_levels[level_name] = total_students
            
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
        "Total Students": list(education_data.values())
    })
    
    st.subheader(f"Total Students by Education Level in {chosen_country}")
    st.write(f"Number of students enrolled in each education level")
    
    fig = px.bar(df_edu, x="Education Level", y="Total Students",
                 labels={"Education Level": "Education Level", "Total Students": "Total Students"},
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

