import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome Diplomat, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Find Countries with most pending cases to aid', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/11PendingCaseToAid.py')

if st.button('Find low-acceptance countries', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/12_API_Test.py')

if st.button("Vulnerable Group Acceptance Data",
             type='primary',
             use_container_width=True):
  st.switch_page('pages/13_Classification.py')

if st.button("Top Locations for aid",
             type='primary',
             use_container_width=True):
  st.switch_page('pages/13_Classification.py')