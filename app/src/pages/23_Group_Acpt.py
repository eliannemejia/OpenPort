import logging
logger = logging.getLogger(__name__)

import pandas as pd
import streamlit as st
from streamlit_extras.app_logo import add_logo
import plotly.express as px
import requests

from modules.nav import SideBarLinks

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

st.header('Social Protection Expenditure Projections')
st.write("Projections based on lag-5 regression using historical EU data and learned weights.")

# Load countries from CSV
df_countries = pd.read_csv("assets/country_list.csv")
countries = sorted(df_countries["Country"].dropna().unique())

# Dropdown to select a country
chosen_country = st.selectbox("Select a country", countries)

# Year selection dropdowns
st.write("Select year range to display:")
start_year = st.selectbox("Start Year", list(range(2011, 2027)), index=0)
end_year = st.selectbox("End Year", list(range(2012, 2028)), index=len(range(2012, 2028)) - 1)

if start_year >= end_year:
    st.warning("Start year must be before end year.")
elif chosen_country is None:
    st.warning("Please select a country.")
'''else:
    # Fetch data from Flask API
    try:
        # Get full time series for country
        resp = requests.get("http://web-api:4000/diplomats/timeseries", params={"country": chosen_country})
        timeseries_data = pd.DataFrame(resp.json())

        # Convert and sort
        timeseries_data["DateYear"] = timeseries_data["DateYear"].astype(int)
        timeseries_data = timeseries_data.sort_values("DateYear")

        # Get weights
        weights_resp = requests.get("http://web-api:4000/diplomats/weights")
        weights_df = pd.DataFrame(weights_resp.json())

        # Parse lags
        lag_weights = {
            int(row['feature'].split('_')[1]): row['CountryWeight']
            for _, row in weights_df.iterrows()
            if row['feature'].startswith("lag_")
        }

        # Ensure country weight is added
        country_weight_key = f"Countries_{chosen_country}"
        country_weight = weights_df.loc[weights_df['feature'] == country_weight_key, 'CountryWeight']
        country_weight = float(country_weight.iloc[0]) if not country_weight.empty else 1.0

        # Initialize prediction data
        full_years = list(range(start_year, end_year + 1))
        full_data = {row["DateYear"]: row["TValue"] for _, row in timeseries_data.iterrows()}

        # Start with known years, compute projections for future years
        for year in full_years:
            if year in full_data:
                continue  # already have real data

            # Only predict if all 5 lag values are present
            lags = [full_data.get(year - i) for i in range(1, 6)]
            if all(v is not None for v in lags):
                prediction = sum(lag_weights.get(i, 0) * lags[i - 1] for i in range(1, 6))
                full_data[year] = prediction * (country_weight / 100)  # Normalize with weight
            else:
                full_data[year] = None  # Not enough data to project

        # Create final dataframe for plotting
        plot_df = pd.DataFrame({
            "Year": full_years,
            "Expenditure (in % of GDP)": [full_data.get(y) for y in full_years]
        }).dropna().sort_values("Year")

        # Plot with Plotly
        fig = px.line(
            plot_df,
            x="Year",
            y="Expenditure (in % of GDP)",
            markers=True,
            title=f"{chosen_country} Social Protection Expenditure Projections"
        )
        st.plotly_chart(fig, use_container_width=True)

    except Exception as e:
        st.error(f"Failed to fetch or process data: {str(e)}")'''
