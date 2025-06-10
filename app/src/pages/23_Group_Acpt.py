import logging
logger = logging.getLogger(__name__)
import pandas as pd
import streamlit as st
from streamlit_extras.app_logo import add_logo
import plotly.express as px
import requests
from modules.nav import SideBarLinks
import numpy as np

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
else:
    # Fetch data from Flask API
    try:
        # Get full time series for country
        resp = requests.get("http://web-api:4000/diplomats/timeseries", params={"country": chosen_country})
        if resp.status_code != 200:
            raise Exception(f"API request failed: {resp.status_code} - {resp.text}")
        timeseries_data = pd.DataFrame(resp.json())

        st.dataframe(timeseries_data)
        cols = timeseries_data.columns
        st.write(end_year)
        #st.write(cols)
        def X_df(country, year):
            df_X = pd.DataFrame()
            df_X["lag_1"] = timeseries_data[(timeseries_data["Country"] == country) & (timeseries_data["DateYear"] == (year-1))]["TValue"].reset_index(drop = True)
            df_X["lag_2"] = timeseries_data[(timeseries_data["Country"] == country) & (timeseries_data["DateYear"] == (year-2))]["TValue"].reset_index(drop = True)
            df_X["lag_3"] = timeseries_data[(timeseries_data["Country"] == country) & (timeseries_data["DateYear"] == (year-3))]["TValue"].reset_index(drop = True)
            df_X["lag_4"] = timeseries_data[(timeseries_data["Country"] == country) & (timeseries_data["DateYear"] == (year-4))]["TValue"].reset_index(drop = True)
            df_X["lag_5"] = timeseries_data[(timeseries_data["Country"] == country) & (timeseries_data["DateYear"] == (year-5))]["TValue"].reset_index(drop = True)
            df_X["country"] = 1.0
            return df_X
        ml2_df = X_df(chosen_country, end_year)
        st.subheader("Country Features DataFrame (ml2_df)")
        st.dataframe(ml2_df)

        country_array= ml2_df.to_numpy()
        st.subheader("Country Features NumPy Array (ml2_np)")
        st.write(country_array)
        country_shape = country_array.shape
        st.markdown(country_shape)

        # Get weights
        weights_resp = requests.get("http://web-api:4000/diplomats/weights")
        if weights_resp.status_code != 200:
            raise Exception(f"API request failed: {weights_resp.status_code} - {weights_resp.text}")
        weights_df = pd.DataFrame(weights_resp.json())

        st.dataframe(weights_df)
        def W_df(country):
          df_W = pd.DataFrame()
          df_W["lag_1"] = weights_df[(weights_df["feature"] == "lag_1")]["CountryWeight"].reset_index(drop=True)
          df_W["lag_2"] = weights_df[(weights_df["feature"] == "lag_2")]["CountryWeight"].reset_index(drop=True)
          df_W["lag_3"] = weights_df[(weights_df["feature"] == "lag_3")]["CountryWeight"].reset_index(drop=True)
          df_W["lag_4"] = weights_df[(weights_df["feature"] == "lag_4")]["CountryWeight"].reset_index(drop=True)
          df_W["lag_5"] = weights_df[(weights_df["feature"] == "lag_5")]["CountryWeight"].reset_index(drop=True)
          df_W["country_weight"] = weights_df[(weights_df["feature"] == f"Countries_{country}")]["CountryWeight"].reset_index(drop=True)
          return df_W

        ml3_df = W_df(chosen_country)
        st.subheader("Weights DataFrame (ml3_df)")
        st.dataframe(ml3_df)

        weight = ml3_df.to_numpy()
        st.subheader("Weights NumPy Array (ml3_np)")
        st.markdown(weight)
        weight_shape = weight.shape
        st.write(weight_shape)

    
        dot_product = np.matmul(weight, country_array.T)
        st.write(dot_product)
  
    except Exception as e:
        st.error(f"Failed to fetch or process data: {str(e)}")