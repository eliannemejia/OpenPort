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

# API endpoint for aid recommendations
API_URL = "http://web-api:4000/diplomats/aid_recommendations"

# Fetch aid recommendations from API
def fetch_aid_recommendations():
    try:
        response = requests.get(API_URL)
        response.raise_for_status()
        return response.json()
    except requests.RequestException as e:
        st.error(f"Error fetching aid recommendations: {e}")
        return []

aid_data = fetch_aid_recommendations()

# aid_data expected format: list of dicts with keys CountryName, NumAidProjects
# Filter to only countries in CSV list (optional)
aid_df = pd.DataFrame(aid_data)
if not aid_df.empty:
    aid_df = aid_df[aid_df['CountryName'].isin(countries)]
else:
    aid_df = pd.DataFrame(columns=["CountryName", "NumAidProjects"])

# Sort ascending for horizontal bar chart
aid_df = aid_df.sort_values(by='NumAidProjects', ascending=True)

# Plot horizontal bar chart
fig = px.bar(
    aid_df,
    x='NumAidProjects',
    y='CountryName',
    orientation='h',
    labels={'NumAidProjects': 'Number of Aid Projects', 'CountryName': 'Country'},
    title='Number of Aid Projects by Country'
)

st.plotly_chart(fig)


# --- Suggest a Project Section ---
st.markdown("## Suggest a Project")

project_name = st.text_input("Project Name")
project_description = st.text_area("Describe your project")
selected_country = st.selectbox("Select a Country", options=countries)

# Add date input here — default to today
project_date = st.date_inpssssut("Project Date", value=datetime.date.today())

if st.button("Post (finish with post request)", type='primary', use_container_width=True):
    if not project_name or not project_description:
        st.error("Please fill in all required fields.")
    else:
        payload = {
            "project_name": project_name,
            "project_description": project_description,
            "country": selected_country,
            "project_date": project_date.strftime("%Y-%m-%d")
        }
        try:
            response = requests.post("http://web-api:4000/diplomats/aid_projects", json=payload)
            response.raise_for_status()
            st.success("Project posted successfully!")
            st.experimental_rerun()  # Optionally rerun or switch page after success
            # Or use switch_page if you prefer:
            # st.switch_page('pages/24_Find_Aid_Projects.py')
        except requests.RequestException as e:
            st.error(f"Failed to post project: {e}")