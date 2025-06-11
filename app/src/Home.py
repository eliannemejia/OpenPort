##################################################
# This is the main/entry-point file for the 
# sample application for your project
##################################################

# Set up basic logging infrastructure
import logging
logging.basicConfig(format='%(filename)s:%(lineno)s:%(levelname)s -- %(message)s', level=logging.INFO)
logger = logging.getLogger(__name__)

# import the main streamlit library as well
# as SideBarLinks function from src/modules folder
import requests
import streamlit as st
from modules.nav import SideBarLinks

# streamlit supports reguarl and wide layout (how the controls
# are organized/displayed on the screen).
st.set_page_config(layout = 'wide')

# If a user is at this page, we assume they are not 
# authenticated.  So we change the 'authenticated' value
# in the streamlit session_state to false. 
st.session_state['authenticated'] = False

# Use the SideBarLinks function from src/modules/nav.py to control
# the links displayed on the left-side panel. 
# IMPORTANT: ensure src/.streamlit/config.toml sets
# showSidebarNavigation = false in the [client] section
SideBarLinks()

# ***************************************************
#    The major content of this page
# ***************************************************

# Create three columns for layout centering
left, center, right = st.columns([1, 2, 1])

with center:
    # Use HTML to center-align text within the middle column
    st.markdown("<h1 style='text-align: center;'>Open Port</h1>", unsafe_allow_html=True)
    st.markdown("<br>", unsafe_allow_html=True)
    st.markdown("<h3 style='text-align: center;'>Find Your Safe Haven</h3>", unsafe_allow_html=True)
    st.markdown("<br>", unsafe_allow_html=True)
    st.markdown("<h4 style='text-align: center;'> Which user would you like to log in?</h4>", unsafe_allow_html=True)

# Close the div
st.markdown('</div>', unsafe_allow_html=True)

API_URL = "http://web-api:4000/users"

def get_users(role):
    url = f"{API_URL}/users/{role}"
    users = requests.get(url).json()
    
    user_names = [
        f"{user['FirstName']} {user['LastName']} ({user['Email']})"
        for user in users
    ]
    
    return users

    
# For each of the user personas for which we are implementing
# functionality, we put a button on the screen that the user 
# can click to MIMIC logging in as that mock user. 

st.write("### Asylum Seeker ")
col1, col2 = st.columns([3, 1]) 
users = get_users("AsylumSeeker")
user_names = [
        f"{user['FirstName']} {user['LastName']} ({user['Email']})"
        for user in users
    ]
with col1:
    selected_user_name = st.selectbox(
        "Select a User",
        user_names,
        index=None,
        placeholder="Select a User",
        key="asylum_seeker"
    )
    
selected_user = None
if selected_user_name:
    # Match the selected name back to the original user dictionary
    for user in users:
        full_name_email = f"{user['FirstName']} {user['LastName']} ({user['Email']})"
        if full_name_email == selected_user_name:
            selected_user = user
            st.session_state['user_id'] = selected_user['UserID']
            break
with col2:
    st.markdown("<div style='height: 1.8em;'></div>", unsafe_allow_html=True)
    if st.button("Log In", key="one"):
        st.session_state['authenticated'] = True
        st.session_state['role'] = 'asylum_seeker'
        st.session_state['first_name'] = 'Mohammed'
        st.switch_page('pages/01_App_Prob_Stats.py')
        
   
    
    

st.write("### Lawyer ")
col3, col4 = st.columns([3, 1])
users = get_users("Lawyer")
user_names = [
        f"{user['FirstName']} {user['LastName']} ({user['Email']})"
        for user in users
    ]
with col3:
    selected_user_name = st.selectbox(
        "Select a User",
        user_names,
        index=None,
        placeholder="Select a User",
        key="lawyer"
    )
    
    
selected_user = None
if selected_user_name:
    # Match the selected name back to the original user dictionary
    for user in users:
        full_name_email = f"{user['FirstName']} {user['LastName']} ({user['Email']})"
        if full_name_email == selected_user_name:
            selected_user = user
            st.session_state['user_id'] = selected_user['UserID']
            break

with col4:
    st.markdown("<div style='height: 1.8em;'></div>", unsafe_allow_html=True)
    if st.button("Log In", key="two"):
        st.session_state['role'] = 'lawyer'
        st.session_state['authenticated'] = True
        st.session_state['first_name'] = 'Mark'
        st.switch_page('pages/10_Lawyer_Home.py')
       
    


st.write("### Commissioner ")
col5, col6 = st.columns([3, 1])
users = get_users("AsylumSeeker")
user_names = [
        f"{user['FirstName']} {user['LastName']} ({user['Email']})"
        for user in users
    ]
with col5:
    selected_user_name = st.selectbox(
        "Select a User",
        user_names,
        index=None,
        placeholder="Select a User",
        key="commissioner"
    )

selected_user = None
if selected_user_name:
    # Match the selected name back to the original user dictionary
    for user in users:
        full_name_email = f"{user['FirstName']} {user['LastName']} ({user['Email']})"
        if full_name_email == selected_user_name:
            selected_user = user
            st.session_state['user_id'] = selected_user['UserID']
            break

with col6:
    st.markdown("<div style='height: 1.8em;'></div>", unsafe_allow_html=True)
    if st.button("Log In", key="three"):
        st.session_state['authenticated'] = True
        st.session_state['role'] = 'diplomat'
        st.session_state['first_name'] = 'Eric'
        st.switch_page('pages/20_Commissioner_Home.py')
        
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

    


# if st.button("Act as Mohammed, a 17 year old refugee from Syria ", 
#             type = 'primary', 
#             use_container_width=True):
#     # when user clicks the button, they are now considered authenticated
#     st.session_state['authenticated'] = True
#     # we set the role of the current user
#     st.session_state['role'] = 'asylum_seeker'
#     # we add the first name of the user (so it can be displayed on 
#     # subsequent pages). 
#     st.session_state['first_name'] = 'Mohammed'
#     # finally, we ask streamlit to switch to another page, in this case, the 
#     # landing page for this particular user type
#     logger.info("Logging in as Syrian Refugee Persona")
#     st.switch_page('pages/01_App_Prob_Stats.py')

# if st.button('Act as Mark, a German Lawyer', 
#             type = 'primary', 
#             use_container_width=True):
#     st.session_state['authenticated'] = True
#     st.session_state['role'] = 'lawyer'
#     st.session_state['first_name'] = 'Mark'
#     st.switch_page('pages/10_Lawyer_Home.py')

# if st.button('Act as Eric, An EU Commissioner', 
#             type = 'primary', 
#             use_container_width=True):
#     st.session_state['authenticated'] = True
#     st.session_state['role'] = 'diplomat'
#     st.session_state['first_name'] = 'Eric'
#     st.switch_page('pages/20_Commissioner_Home.py')

