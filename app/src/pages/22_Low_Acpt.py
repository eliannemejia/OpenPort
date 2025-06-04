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
import requests

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

API_URL = "http://web-api:4000/diplomats/accepted_applications" 

# set the header of the page
st.header('Low acceptance rate countries')

# You can access the session state to make a more customized/personalized app experience
#st.write(f"### Hi, {st.session_state['first_name']}.")
st.write("not done, fix api")

# Load countries
df = pd.read_csv("assets/list_of_countries.csv")
countries = sorted(df["Country"].dropna().unique())

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

def fetch_accepted_applications():
    """
    Call the API to get accepted applications per country.
    Returns a DataFrame with CountryName and AcceptedTotal.
    """
    try:
        # We get data for all countries (no filters)
        response = requests.get(API_URL)
        response.raise_for_status()
        data = response.json()  # Should be a list of dicts
        
        # Convert to DataFrame
        df_api = pd.DataFrame(data)
        if df_api.empty:
            st.warning("No acceptance data returned from API.")
            return pd.DataFrame(columns=['CountryName', 'AcceptedTotal'])
        
        # Keep only relevant columns
        df_api = df_api[['CountryName', 'AcceptedTotal']]
        # Convert AcceptedTotal to numeric (sometimes it might be string)
        df_api['AcceptedTotal'] = pd.to_numeric(df_api['AcceptedTotal'], errors='coerce').fillna(0)
        
        return df_api
    except Exception as e:
        st.error(f"Error fetching data from API: {e}")
        return pd.DataFrame(columns=['CountryName', 'AcceptedTotal'])

if selection:
    accepted_df = fetch_accepted_applications()
    
    if accepted_df.empty:
        st.info("No data available to display.")
    else:
        # Filter only countries from our CSV list (some may not be in CSV)
        accepted_df = accepted_df[accepted_df['CountryName'].isin(countries)]
        
        # Sort ascending by AcceptedTotal
        accepted_df = accepted_df.sort_values(by='AcceptedTotal', ascending=True)
        
        if selection == 'top':
            plot_data = accepted_df.tail(10)
        elif selection == 'bottom':
            plot_data = accepted_df.head(10)
        else:
            plot_data = accepted_df
        
        # Plot bar chart with Plotly Express
        fig = px.bar(
            plot_data,
            x='CountryName',
            y='AcceptedTotal',
            title=f"{selection.capitalize()} Countries by Accepted Applications",
            labels={'CountryName': 'Country', 'AcceptedTotal': 'Number of Accepted Applications'}
        )
        fig.update_layout(xaxis_tickangle=-45)
        st.plotly_chart(fig)
        
        # Display list of countries below the chart
        st.markdown("**Countries Displayed:**")
        st.markdown("Lowest to Highest Acceptance Numbers")
        for country in plot_data['CountryName']:
            st.markdown(f"- {country}")
else:
    st.info("Click a button to view top 10, bottom 10, or all countries.")
