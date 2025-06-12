import logging
logger = logging.getLogger(__name__)

import pandas as pd
import requests
import streamlit as st
from modules.nav import SideBarLinks
from streamlit_extras.card import card
import plotly.express as px

st.set_page_config(layout = 'wide')

API_URL = "http://web-api:4000/lawyers"

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

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
    
def get_average_acceptance_rates(sex, citizen, age):
    age_range = get_age_range(age)
    url = f"http://web-api:4000/refugees/application_stats?sex={sex}&citizen={citizen}&age={age_range}"
    
    response = requests.get(url)
    return response.json()
    
def get_country_list():
    countries_url = "http://web-api:4000/countries/countries"
    countries_get = requests.get(countries_url).json()
    countries = []
    for entry in countries_get:
        name = entry["CountryName"]
        countries.append(name)
    return countries

# set the header of the page
st.header('Average Acceptance Rates for selected age, sex, and nationality')
st.write("### Select a Refugee Demographic")
col1, col2, col3 = st.columns(3)

with col1:
    origin = st.selectbox(
        "Country of Origin",
        get_country_list()[27:95],
        index=None,
        placeholder="Select a Country",
        key="origin"
    )
    submit = st.button("Submit")

with col2:
    sex = st.selectbox(
        "Sex",
        ["Males", "Females"],
        index=None,
        placeholder="Select a Sex",
        key="sex"
    )
with col3:
    age = st.number_input("Age", 0, 150)

if submit:

        countries = get_country_list()

        euCountries = countries[0:27]
        idx = 1
        acceptance_prob_list = []
        countries = []
        avgs = get_average_acceptance_rates(sex, origin, age)

        for entry in avgs:
            geo = entry["geo"]
            acceptance_rate = float(entry["acceptance_rate"])
            countries.append(geo)
            acceptance_prob_list.append(round(acceptance_rate*100, 1))
            idx += 1
        
        countriesAndProb = zip(countries, acceptance_prob_list)
        df = pd.DataFrame(countriesAndProb, columns=["Country", "Probability of Acceptance"])
        df = df.sort_values(by='Probability of Acceptance', ascending=False)
      
 

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
        title="Asylum Acceptance Rate by Country",
        width=1500,
        height=1500
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