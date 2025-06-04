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

df = pd.read_csv("assets/list_of_countries.csv")
countries = sorted(df["Country"].dropna().unique())

# set the header of the page
st.header('Asylum Acceptance Probability')

st.write("### Enter Your Details")

origin = st.selectbox(
    "Country of Origin",
    countries,
    index=None,
    placeholder="Select a Country",
    key="origin"
)

sex = st.radio(
    "Sex", 
    ["Male", "Female", "Other"],
    key="applicant_sex"
    )

age = st.slider("Age", 0, 150)

submit = st.button("Submit")

