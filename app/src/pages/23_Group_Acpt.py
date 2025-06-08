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
st.header('Social Protection Expenditure Projections')

# You can access the session state to make a more customized/personalized app experience
#st.write(f"### Hi, {st.session_state['first_name']}.")
st.write("not done, fix api")

# Load countries from CSV
df_countries = pd.read_csv("assets/list_of_countries.csv")
countries = sorted(df_countries["Country"].dropna().unique())



# Dropdown to select a country
chosen_country = st.selectbox("Select a country", countries)

# Checkbox for years 2011-2027
years = list(range(2011, 2028))
st.write("Select years to display:")
selected_years = []
cols = st.columns(5)
for i, year in enumerate(years):
    with cols[i % 5]:
        if st.checkbox(str(year), value=True):
            selected_years.append(year)

if not selected_years:
    st.warning("Please select at least one year.")
else:
    st.subheader(f"{chosen_country}'s Social Protection Expenditure Projections")

    # Mock data: random values for selected years
    expenditure_values = np.random.uniform(1, 5, size=len(selected_years))

    # Create dataframe for plotting
    df_proj = pd.DataFrame({
        "Year": selected_years,
        "Expenditure (in % of GDP)": expenditure_values
    }).sort_values("Year")

    # Plot with Plotly for better interactivity
    fig = px.line(df_proj, x="Year", y="Expenditure (in % of GDP)", markers=True,
                  title=f"{chosen_country} Social Protection Expenditure Projections")
    st.plotly_chart(fig, use_container_width=True)