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
st.header('Pending Cases to aid ratio')

# You can access the session state to make a more customized/personalized app experience
#st.write(f"### Hi, {st.session_state['first_name']}.")
st.write("not done, fix api")

countries = wb.get_countries()

# Create a dropdown (multi-select) for country names
selected_countries = st.multiselect(
    'Select up to 10 countries to plot:',
    options=countries['name'].tolist(),
    default=countries['name'].iloc[:10].tolist(),  # default to first 10
    max_selections=10  # optional limit
)

# Filter the data to only selected countries
scatter_data = countries[countries['name'].isin(selected_countries)]

if not scatter_data.empty:
    fig = px.scatter(
        scatter_data,
        x='longitude',
        y='latitude',
        text='name',
        title='Scatter Plot of Selected Countries (Latitude vs Longitude)',
        labels={'longitude': 'Longitude', 'latitude': 'Latitude'}
    )
    fig.update_traces(textposition='top center')
    st.plotly_chart(fig)
else:
    st.warning("Please select at least one country to generate the plot.")