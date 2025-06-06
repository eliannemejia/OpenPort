import logging
logger = logging.getLogger(__name__)

import requests
import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

API_URL = "http://web-api:4000/lawyers"

st.title("Available Pro Bono Opporunities")

applications = requests.get(f"{API_URL}/legal_aid_applications").json()

st.write(applications)