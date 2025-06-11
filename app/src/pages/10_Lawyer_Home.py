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


if st.button('See Pro Bono Opportunities', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/11_Pro_Bono_Opps.py')
  
if st.button('See Decision Statistics', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/02_Map_Demo.py')

if st.button('Request funding', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/13_Apply_For_Aid.py')
  
  