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
st.write("not done, fix country display")

  
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

if 'posted_projects' not in st.session_state:
    st.session_state['posted_projects'] = []

project_ids = [proj.get('project_id') for proj in st.session_state['posted_projects']]

# Select project to update
selected_project_id = None
if project_ids:
    selected_project_id = st.selectbox("Select Project to Update", options=project_ids)
else:
    st.selectbox("Select Project to Update", options=["No projects posted yet"], disabled=True)

# Pre-fill form with selected project data or blank for new project
def get_project_by_id(project_id):
    for proj in st.session_state['posted_projects']:
        if proj.get('project_id') == project_id:
            return proj
    return None

selected_project = get_project_by_id(selected_project_id) if selected_project_id else None

# Form inputs with pre-filled data or empty if new
project_name = st.text_input("Project Name", value=selected_project['title'] if selected_project else "")
project_description = st.text_area("Describe your project", value=selected_project['description'] if selected_project else "")
selected_country = st.selectbox("Select a Country", options=countries, index=countries.index(selected_project['country']) if selected_project else 0)

project_date = st.date_input("Project Date", value=datetime.datetime.strptime(selected_project['start_date'], "%Y-%m-%d").date() if selected_project else datetime.date.today())

# Post new project  
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
        
        st.write("Payload to send:", payload)

        try:
            response = requests.post("http://web-api:4000/diplomats/aid_projects", json=payload)
            response.raise_for_status()
            
            resp_json = response.json()
            project_id = resp_json.get("project_id", "N/A")

            created_project = {
                "project_id": project_id,
                "title": project_name,
                "description": project_description,
                "country": selected_country,
                "start_date": project_date.strftime("%Y-%m-%d"),
            }

            st.success("Project posted successfully!")

            st.session_state['posted_projects'].append(created_project)
            st.rerun()

        except requests.RequestException as e:
            st.error(f"Failed to post project: {e}")

# Update existing project
if selected_project_id and st.button("Update", use_container_width=True):
    if not project_name or not project_description:
        st.error("Please fill in all required fields.")
    else:
        payload = {
            "title": project_name,
            "description": project_description,
            "country": selected_country,
            "start_date": project_date.strftime("%Y-%m-%d")
        }

        update_url = f"http://web-api:4000/diplomats/aid_projects/{selected_project_id}"
        try:
            response = requests.put(update_url, json=payload)
            response.raise_for_status()

            # Update session state project in place
            for proj in st.session_state['posted_projects']:
                if proj.get('project_id') == selected_project_id:
                    proj['title'] = project_name
                    proj['description'] = project_description
                    proj['country'] = selected_country
                    proj['start_date'] = project_date.strftime("%Y-%m-%d")
                    break

            st.success("Project updated successfully!")
            st.rerun()

        except requests.RequestException as e:
            st.error(f"Failed to update project: {e}")
    
# Display posted projects with their IDs
if st.session_state['posted_projects']:
    st.markdown("### Recently Posted Projects")
    for project in reversed(st.session_state['posted_projects']):
        project_id = project.get('project_id', 'N/A')  # fallback if no id
        title = project.get('title', 'Untitled')
        country = project.get('country', 'Unknown')
        description = project.get('description', '')
        start_date = project.get('start_date', '')
        
        with st.expander(f"📌 [{project_id}] {title} ({country})"):
            st.write(f"**Description:** {description}")
            st.write(f"**Start Date:** {start_date}")

            # DELETE button for each project
            if st.button(f"❌ Delete Project {project_id}", key=f"delete_{project_id}"):
                try:
                    delete_url = f"http://web-api:4000/diplomats/aid_project/delete/{project_id}"
                    response = requests.delete(delete_url)
                    response.raise_for_status()

                    st.success(f"Project {project_id} deleted successfully.")

                    # Remove from session state
                    st.session_state['posted_projects'] = [
                        proj for proj in st.session_state['posted_projects']
                        if proj.get("project_id") != project_id
                    ]

                    st.rerun()  # Refresh the app to reflect deletion

                except requests.RequestException as e:
                    st.error(f"Failed to delete project: {e}")
