import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome EU Commissioner, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### How would you like to help the world today?')

if st.button('View Pending Funding Requests', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/21_pending_to_aid.py')

if st.button('See Decision Stats Per Capita', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/22_Low_Acpt.py')

if st.button("Social Protection Expenditure Projections",
             type='primary',
             use_container_width=True):
  st.switch_page('pages/23_Group_Acpt.py')

if st.button("Top locations for aid",
             type='primary',
             use_container_width=True):
  st.switch_page('pages/24_Find_Aid_Projects.py')