import logging
logger = logging.getLogger(__name__)

import requests
import streamlit as st
from modules.nav import SideBarLinks
from streamlit_extras.card import card

st.set_page_config(layout = 'wide')

API_URL = "http://web-api:4000/refugees"

# Show appropriate sidebar links for the role of the currently logged in user
SideBarLinks()

def get_applicant_id():
    user_id = st.session_state['user_id']
    url = f"{API_URL}/{user_id}"
    try:
        aid = requests.get(url)
        if aid.status_code != 200:
            st.error(
                f"Failed to create AsylumSeeker: {aid.json().get('error', 'Unknown error')}"
            )
    except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to the API: {str(e)}")
            st.info("Please ensure the API server is running")
    
    return aid.json()


def get_applications():
    applicant_id = get_applicant_id()["ApplicantID"]
    url = f"{API_URL}/legal_aid_applications/{applicant_id}"
    try:
        applications = requests.get(url)
        st.write(applications)
        if applications.status_code != 200:
            st.error(
                f"Failed to create AsylumSeeker: {applications.json().get('error', 'Unknown error')}"
            )
    except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to the API: {str(e)}")
            st.info("Please ensure the API server is running")
    
    return applications.json()


def get_lawyer_assignment():
    applicant_id = get_applicant_id()["ApplicantID"]
    url = f"{API_URL}/lawyer_assignment/{applicant_id}"
    try:
        lawyer = requests.get(url).json()
        if lawyer:
            return lawyer
    except requests.exceptions.RequestException as e:
            st.error(f"Error connecting to the API: {str(e)}")
            st.info("Please ensure the API server is running")


st.title("View Your Profile")

st.write("### Open Applications")
applications = get_applications()
if applications:
    for idx, app in enumerate(applications, start = 1):
        st.markdown(f"""
        **Application {idx}**
        - **Description**: {app.get("AidDescription")}
        - **Status**: {app.get("status", "Pending")}
        ---
        """)
else:
    st.write("No Open Applications At This Time")

st.write("### Lawyer Assignment \n **Assigned Lawyer**")
lawyer = get_lawyer_assignment()
if lawyer:
    st.markdown(f"""
    - **Name**: {lawyer.get("FirstName", "")} {lawyer.get("LastName", "")}
    """)
else:
    st.markdown("No Lawyer Assignments At This Time")

# type = st.selectbox(
#         "Aid Type",
#         ["Asylum Application", "Citizenship Application", "Family Reuinification", "Other"],
#         index=None,
#         placeholder="Select an aid type",
#         key="aid_type"
#     )

# if type:
#     applications = requests.get(f"{API_URL}/legal_aid_applications/{type}").json()

#     # CSS and grid container
#     st.markdown("""
#         <style>
#         .card-grid {
#             display: grid;
#             grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
#             gap: 16px;
#             justify-items: center;
#             margin-top: 20px;
#         }

#         .custom-card {
#             background-color: white;
#             width: 200px;
#             height: 200px;
#             border-radius: 10px;
#             box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
#             text-align: center;
#             padding: 1rem;
#             display: flex;
#             flex-direction: column;
#             justify-content: center;
#             transition: 0.2s ease;
#             overflow: hidden;
#         }

#         .custom-card:hover {
#             box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
#             cursor: pointer;
#             transform: scale(1.03);
#         }

#         .custom-card h4, .custom-card p {
#             margin: 4px 0;
#             font-size: 14px;
#         }
#         </style>
#     """, unsafe_allow_html=True)


#     idx = 0
#     for app in applications:
    
#         uid = app["ApplicantID"]
#         name = requests.get(f"{API_URL}/asylum_seekers/{uid}").json()[0]
#         fname = name["FirstName"]
#         lname = name["LastName"]
#         description = app["AidDescription"]
#         applicant_info = requests.get(f"{API_URL}/seeker_info/{uid}").json()[0]
#         dob = applicant_info["DOB"]
#         sex = applicant_info["SEX"]
#         status = app.get("status", "Pending")

#         with st.container():
#             st.markdown(f"""
#                 <div class="custom-card" style="border: 1px solid #ccc; padding: 1em; border-radius: 8px; margin-bottom: 1em;">
#                     <h4>{fname} {lname}</h4>
#                     <p><strong>{description}</strong></p>
#                     <p>DOB: {dob}</p>
#                     <p>Sex: {sex}</p>
#                     <p>Status: {status}</p>
#                 </div>
#             """, unsafe_allow_html=True)

#             if st.button(f"Accept Case", key=f"button_{idx}"):
#                 lawyer_id = get_lawyer_id()
#                 assign_lawyer(applicant_info["ApplicantID"], lawyer_id)
#                 st.write(f"You clicked to review {fname} {lname}'s application.")
#         idx += 1
#     # Display the grid of cards
#     # st.markdown(card_html, unsafe_allow_html=True)
