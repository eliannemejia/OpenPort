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
st.header('Low acceptance rate countries')

# You can access the session state to make a more customized/personalized app experience
#st.write(f"### Hi, {st.session_state['first_name']}.")
st.write("not done, fix api")

countries = wb.get_countries()

# Sidebar or main UI controls

# Scroll bar from 1 to 100
slider_value = st.slider(
    "Select a number (1-100):",
    min_value=1,
    max_value=100,
    value=50,  # default value
    step=1
)

# Button for sex selection (toggle between M and F)
sex = st.radio(
    "Select sex:",
    options=['M', 'F','All'],
    index=2  # default to 'All'
)

# Dropdown for religion (empty for now)
religion = st.selectbox(
    "Select religion:",
    options=[""]  # empty list for now
)

# Dropdown for country of origin (empty for now)
country_of_origin = st.selectbox(
    "Select country of origin:",
    options=[""]  # empty list for now
)

# For demonstration: create some dummy data for bar heights (e.g., random or based on slider_value)
# Since real data is not connected yet, let's create a placeholder metric per country
import numpy as np

np.random.seed(42)
bar_heights = np.random.randint(1, 100, size=len(countries))

# Create a DataFrame for plotting
plot_df = countries.copy()
plot_df['metric'] = bar_heights  # dummy metric

# Bar chart with all countries on x-axis
fig = px.bar(
    plot_df,
    x='name',
    y='metric',
    title="Bar Chart: Acceptance Metric by Country (Dummy Data)",
    labels={'name': 'Country', 'metric': 'Acceptance Metric'}
)

# Make x-axis labels readable by rotating them
fig.update_layout(xaxis_tickangle=-45)

st.plotly_chart(fig)