import logging
logger = logging.getLogger(__name__)
import pandas as pd
import streamlit as st
from streamlit_extras.app_logo import add_logo
#import world_bank_data as wb
import matplotlib.pyplot as plt
import numpy as np
import plotly.express as px
from modules.nav import SideBarLinks

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

API_URL = "http://web-api:4000/diplomats"


# set the header of the page
st.header('Rejected Cases to aid ratio')

# You can access the session state to make a more customized/personalized app experience
#st.write(f"### Hi, {st.session_state['first_name']}.")
st.write("not done, fix api")

# Load countries
df = pd.read_csv("assets/list_of_countries.csv")
countries = sorted(df["Country"].dropna().unique())

  
# Random x and y placeholder data
np.random.seed(42)
placeholder_data = pd.DataFrame({
    "Country": countries,
    "x": np.random.rand(len(countries)) * 100,
    "y": np.random.rand(len(countries)) * 100
})

# Create a dropdown (multi-select) for country names
selected_countries = st.multiselect(
    'Select up to 10 countries to plot:',
    options=countries,
    default=countries[:10],  # default to first 10
    max_selections=10
)

# Filter placeholder data to selected countries
scatter_data = placeholder_data[placeholder_data["Country"].isin(selected_countries)]

# Plot
if not scatter_data.empty:
    fig = px.scatter(
        scatter_data,
        x='x',
        y='y',
        text='Country',
        title='Scatter Plot of Selected Countries (Random Data)',
        labels={'x': 'X Axis (placeholder)', 'y': 'Y Axis (placeholder)'}
    )
    fig.update_traces(textposition='top center')
    st.plotly_chart(fig)
else:
    st.warning("Please select at least one country to generate the plot.")