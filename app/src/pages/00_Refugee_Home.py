import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Find Your Best Asylum Location', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/01_World_Bank_Viz.py')

if st.button('See Education Data', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/02_Map_Demo.py')
  
if st.button('See Religious Demographics', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/02_Map_Demo.py')
  
if st.button('Seek Legal Aid', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/02_Legal_Aid_App.py')