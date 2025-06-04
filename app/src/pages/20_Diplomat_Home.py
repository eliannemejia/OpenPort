import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout = 'wide')

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

st.title(f"Welcome EU Diplomat, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### How would you like to help the world today?')

if st.button('Find Countries with the most pending cases to aid', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/21_pending_to_aid.py')

if st.button('Find low-acceptance countries', 
             type='primary',
             use_container_width=True):
  st.switch_page('pages/22_Low_Acpt.py')

if st.button("Group acceptance data",
             type='primary',
             use_container_width=True):
  st.switch_page('pages/23_Group_Acpt.py')

if st.button("Top locations for aid",
             type='primary',
             use_container_width=True):
  st.switch_page('pages/24_Find_Aid_Projects.py')