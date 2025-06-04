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

# Use longitude as a temporary metric (replace with real metric later)
metric_column = 'longitude'  # Replace with e.g., 'acceptance_rate' in future

# Button options to choose view
col1, col2, col3 = st.columns(3)
selection = None

with col1:
    if st.button("Top 10"):
        selection = 'top'
with col2:
    if st.button("Bottom 10"):
        selection = 'bottom'
with col3:
    if st.button("All"):
        selection = 'all'

# Sort and filter based on user choice
if selection:
    sorted_countries = countries[['name', metric_column]].dropna().sort_values(by=metric_column)

    if selection == 'top':
        plot_data = sorted_countries.tail(10)  # Highest 10
    elif selection == 'bottom':
        plot_data = sorted_countries.head(10)  # Lowest 10
    else:
        plot_data = sorted_countries

    fig = px.bar(
        plot_data,
        x='name',
        y=metric_column,
        title=f"{selection.capitalize()} Countries by {metric_column.capitalize()}",
        labels={'name': 'Country', metric_column: metric_column.capitalize()},
    )
    fig.update_layout(xaxis_tickangle=-45)
    st.plotly_chart(fig)
    
    # Display the list of countries below the chart
    st.markdown("**Countries Displayed:**")
    st.markdown("Lowest to Highest")
    for country in plot_data['name']:
        st.markdown(f"- {country}")
        
else:
    st.info("Click a button to view top 10, bottom 10, or all countries.")