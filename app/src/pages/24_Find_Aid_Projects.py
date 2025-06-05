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
import requests
import datetime


# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

# set the header of the page
st.header('Find Countries in need of Aid Projects')

# You can access the session state to make a more customized/personalized app experience
#st.write(f"### Hi, {st.session_state['first_name']}.")
st.write("not done, fix api")

  
# Load countries from CSV
df_countries = pd.read_csv("assets/list_of_countries.csv")
countries = sorted(df_countries["Country"].dropna().unique())
df_all_countries = pd.DataFrame({'CountryName': countries})

# Fetch aid recommendations
API_URL = "http://web-api:4000/diplomats/aid_recommendations"

def fetch_aid_recommendations():
    try:
        response = requests.get(API_URL)
        response.raise_for_status()
        return response.json()
    except requests.RequestException as e:
        st.error(f"Error fetching aid recommendations: {e}")
        return []

aid_data = fetch_aid_recommendations()

# Create dataframe and merge with full country list to ensure full inclusion
aid_df = pd.DataFrame(aid_data)
if not aid_df.empty:
    merged_df = df_all_countries.merge(
        aid_df[['CountryName', 'NumAidProjects']],
        on='CountryName',
        how='left'
    )
    merged_df['NumAidProjects'] = merged_df['NumAidProjects'].fillna(0).astype(int)
else:
    merged_df = df_all_countries.copy()
    merged_df['NumAidProjects'] = 0

# Sort for chart
merged_df = merged_df.sort_values(by='NumAidProjects', ascending=True)

# Plot horizontal bar chart
fig = px.bar(
    merged_df,
    x='NumAidProjects',
    y='CountryName',
    orientation='h',
    labels={'NumAidProjects': 'Number of Aid Projects', 'CountryName': 'Country'},
    title='Number of Aid Projects by Country'
)

# Ensure x-axis starts at 0
fig.update_layout(xaxis=dict(range=[0, merged_df['NumAidProjects'].max() + 5]))


st.plotly_chart(fig)

# --- Suggest a Project Section ---
st.markdown("## Suggest a Project")

project_name = st.text_input("Project Name")
project_description = st.text_area("Describe your project")
selected_country = st.selectbox("Select a Country", options=countries)

# Fix: Use correct Streamlit function for date
project_date = st.date_input("Project Date", value=datetime.date.today())

if 'posted_projects' not in st.session_state:
    st.session_state['posted_projects'] = []

if st.button("Post (finish with post request)", type='primary', use_container_width=True):
    if not project_name or not project_description:
        st.error("Please fill in all required fields.")
    else:
        payload = {
            "title": project_name,
            "description": project_description,
            "country": selected_country,
            "start_date": project_date.strftime("%Y-%m-%d")
        }
        
        st.write("Payload to send:", payload)  # Debug output

        try:
            response = requests.post("http://web-api:4000/diplomats/aid_projects", json=payload)
            response.raise_for_status()
            st.success("Project posted successfully!")

            # Store the posted project locally
            st.session_state['posted_projects'].append(payload)

        except requests.RequestException as e:
            st.error(f"Failed to post project: {e}")

# Display posted projects
if st.session_state['posted_projects']:
    st.markdown("### Recently Posted Projects")
    for project in reversed(st.session_state['posted_projects']):
        with st.expander(f"📌 {project['title']} ({project['country']})"):
            st.write(f"**Description:** {project['description']}")
            st.write(f"**Start Date:** {project['start_date']}")
