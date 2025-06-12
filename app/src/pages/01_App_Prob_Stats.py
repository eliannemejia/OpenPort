import logging
logger = logging.getLogger(__name__)
import pandas as pd
import streamlit as st
from streamlit_extras.app_logo import add_logo
import world_bank_data as wb
import matplotlib.pyplot as plt
import numpy as np
import plotly.express as px
import streamlit as st
import requests
from modules.nav import SideBarLinks

# Call the SideBarLinks from the nav module in the modules directory
SideBarLinks()

API_URL = "http://web-api:4000/refugees"

def get_age_range(age):
    if age >= 65:
        return f"65 years or over"
    if (35 <= age <= 64):
        return f"From 35 to 64 years"
    if (18 <= age <= 34):
        return f"From 18 to 34 years"
    if (18 > age >= 14):
        return f"Less than 18 years"
    if (age < 14):
        return f"Less than 14 years"
    
def get_top_three(sex, citizen, age):
    age_range = get_age_range(age)
    url = f"{API_URL}/application_stats?sex={sex}&citizen={citizen}&age={age_range}"
    
    response = requests.get(url)
    return response.json()
    
def get_probability(age, sex, citizen, geo):
    age_range = get_age_range(age)
    c_name = geo
    prob_url = f"{API_URL}/final_prediction/{age_range}/{sex}/{citizen}/{c_name}"
    
    response = requests.get(prob_url)
    return response.json()

def show_probability(age, sex, citizen, geo):
    acceptance_prob = get_probability(age, sex, citizen, geo) * 100
    st.write(f"**Proability of Acceptance**: {acceptance_prob}")

def get_button(country, idx, age, sex, origin):
    return st.button(f"{idx}." + country["geo"])
    
def get_country_list():
    countries_url = "http://web-api:4000/countries/countries"
    countries_get = requests.get(countries_url).json()
    countries = []
    for entry in countries_get:
        name = entry["CountryName"]
        countries.append(name)
    return countries

# set the header of the page
st.header('Asylum Acceptance Probability')

col1, col2 = st.columns(2, gap="large")

with col1:
    st.write("### Enter Your Details")

    origin = st.selectbox(
        "Country of Origin",
        get_country_list(),
        index=None,
        placeholder="Select a Country",
        key="origin"
    )

    sex = st.radio(
        "Sex", 
        ["Males", "Females"],
        key="applicant_sex"
        )

    age = st.number_input("Age", 0, 150)

    submit = st.button("Submit")
    
no_one = None

with col2:
    if submit:
        st.write("### Top Three Countries")
        st.write("#### Based on your Age, Sex, and Nationality")

        countries = get_country_list()

        euCountries = countries[0:27]
        idx = 1
        acceptance_prob_list = []

        for country in euCountries:
            acceptance_prob = get_probability(age, sex, origin, country)
            acceptance_prob_list.append(round(acceptance_prob*100, 1))
            idx += 1
        
        countriesAndProb = zip(euCountries, acceptance_prob_list)
        df = pd.DataFrame(countriesAndProb, columns=["Country", "Probability of Acceptance"])
        df = df.sort_values(by='Probability of Acceptance', ascending=False)
        finalDf = df.head(3)

        for index, row in finalDf.iterrows():
            st.markdown(f"**Country:** {row['Country']}  \n**Probability of Acceptance:** {row['Probability of Acceptance']}%")
 

if submit:

    st.header("Map Visualizations")
    st.write("Hover over and zoom it to each country to get the probabilty of acceptence based off of the demographics you submitted")

    country_abbreviations = {
        "Austria": "AUT",
        "Belgium": "BEL",
        "Bulgaria": "BGR",
        "Croatia": "HRV",
        "Republic of Cyprus": "CYP",
        "Czech Republic": "CZE",
        "Denmark": "DNK",
        "Estonia": "EST",
        "Finland": "FIN",
        "France": "FRA",
        "Germany": "DEU",
        "Greece": "GRC",
        "Hungary": "HUN",
        "Ireland": "IRL",
        "Italy": "ITA",
        "Latvia": "LVA",
        "Lithuania": "LTU",
        "Luxembourg": "LUX",
        "Malta": "MLT",
        "Netherlands": "NLD",
        "Poland": "POL",
        "Portugal": "PRT",
        "Romania": "ROU",
        "Slovakia": "SVK",
        "Slovenia": "SVN",
        "Spain": "ESP",
        "Sweden": "SWE"
    }


    df["Country_abbreviations"] = df["Country"].map(country_abbreviations)

    fig = px.choropleth(
        df,
        locations="Country_abbreviations",
        color="Probability of Acceptance",
        hover_name="Country",
        hover_data={"Country_abbreviations": False},
        color_continuous_scale="YlOrRd",
        range_color=(0, 100),
        scope="europe",
        title="Asylum Acceptance Probability by Country",
        width=1000,   # Set your desired width
        height=900  
    )

    fig.update_traces(
        hoverlabel=dict(
            font_size=16
        )
    )
    st.plotly_chart(fig)

st.markdown("""
    <style>
    div.stButton > button {
        background-color: #0C406E;
        color: white;
    }
    div.stButton > button:hover {
        background-color: #FFFFFF;
        color: #0C406E;
    }
    </style>
    """, unsafe_allow_html=True)