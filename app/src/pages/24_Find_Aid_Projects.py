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

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

# set the header of the page
st.header('Find Countries in need of Aid Projects')

# You can access the session state to make a more customized/personalized app experience
#st.write(f"### Hi, {st.session_state['first_name']}.")
st.write("not done, fix api")

# Get country data
countries = wb.get_countries()

# --- Create placeholder 'project counts' ---
# For now, use a random integer to simulate the number of suggested aid projects per country
np.random.seed(42)  # for consistent results
project_counts = np.random.randint(0, 50, size=len(countries))  # Placeholder range from 0 to 49

# Add to dataframe
plot_df = countries.copy()
plot_df['projects'] = project_counts

# Sort by number of projects descending (optional for better visuals)
plot_df = plot_df.sort_values(by='projects', ascending=True)  # ascending for horizontal bar chart

# Horizontal bar chart: Countries on Y-axis, placeholder project counts on X-axis
fig = px.bar(
    plot_df,
    x='projects',
    y='name',
    orientation='h',
    labels={'projects': 'Number of Aid Projects (Placeholder)', 'name': 'Country'},
    title='Aid Project Placeholder Counts by Country'
)

# Show chart
st.plotly_chart(fig)

# --- Suggest a Project Section ---
st.markdown("## Suggest a Project")

# Project Name input
project_name = st.text_input("Project Name")

# Description input (expandable)
project_description = st.text_area("Describe your project")

# Country dropdown
selected_country = st.selectbox(
    "Select a Country",
    options=countries['name'].tolist()
)

if st.button("Post (finish with post request)",
            type='primary',
            use_container_width=True):
  st.switch_page('pages/24_Find_Aid_Projects.py')