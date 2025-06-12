import streamlit as st
import requests
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')

# Sidebar navigation
SideBarLinks()

st.header("Review Pending Aid Applications")
with st.expander("ℹ️ How to Use This Dashboard"):
    st.write("""
    This dashboard allows you to review and manage pending funding requests submitted by lawyers.

    - **Viewing Requests:**  
      All pending fund requests are listed below with their details, including title, description, amount requested, lawyer's email, and current status.

    - **Actions:**  
      For each request, you can either:
      - **Accept:** Approve the funding request.  
      - **Reject:** Deny the funding request.

    - **How to Update:**  
      Click the **Accept** or **Reject** button next to a request to update its status. The dashboard will automatically refresh to reflect your changes.
  
    Use this interface to efficiently track and respond to funding requests.

    """)
API_URL = "http://web-api:4000/diplomats/fund_requests"

def fetch_pending_requests():
    try:
        response = requests.get(API_URL)
        if response.status_code == 200:
            return response.json()
        else:
            st.error(f"Failed to fetch pending requests: {response.text}")
            return []
    except requests.exceptions.RequestException as e:
        st.error(f"Error connecting to the API: {e}")
        return []

def update_fund_status(app_id, new_status):
    url = f"{API_URL}/{app_id}"
    payload = {"FundStatus": new_status}
    try:
        response = requests.put(url, json=payload)
        if response.status_code == 200:
            st.success(f"Request {app_id} updated to '{new_status}'")
            return True
        else:
            st.error(f"Failed to update: {response.json().get('error', 'Unknown error')}")
            return False
    except requests.exceptions.RequestException as e:
        st.error(f"Error connecting to the API: {e}")
        return False

pending_requests = fetch_pending_requests()

if not pending_requests:
    st.info("No pending funding requests to review.")
else:
    for req in pending_requests:
        app_id = req["AppID"]
        title = req["FundRequestTitle"]
        desc = req["FundDesc"]
        amt = req["FundAmt"]
        lawyer_email = req["LawyerEmail"]
        status = req["FundStatus"]

        # Create each application in a container with border
        with st.container(border=True):
            st.markdown(f"**{title} (ID: {app_id})**")
            st.write(f"**Description:** {desc}")
            st.write(f"**Amount Requested:** ${amt}")
            st.write(f"**Lawyer Email:** {lawyer_email}")
            st.write(f"**Status:** {status}")

            col1, col2 = st.columns([1, 1])
            with col1:
                # Use type="primary" for green button
                if st.button(f"Accept", key=f"accept_{app_id}", type="primary"):
                    if update_fund_status(app_id, "Accepted"):
                        st.rerun()

            with col2:
                # Use type="secondary" for red button (we'll override with CSS)
                if st.button(f"Reject", key=f"reject_{app_id}", type="secondary"):
                    if update_fund_status(app_id, "Rejected"):
                        st.rerun()

    # Add CSS after buttons are rendered
    st.markdown("""
        <style>
        /* Blue borders for containers */
        div[data-testid="stContainer"] {
            border: 1px solid #0C406E !important;
        }
        
        /* Alternative selector */
        .stContainer > div {
            border: 1px solid #0C406E !important;
        }
        
        /* Even more specific */
        div[data-testid="stContainer"] > div {
            border-color: #0C406E !important;
        }
        
        /* Make both buttons the same blue color */
        .stButton > button[kind="primary"] {
            background-color: #0C406E !important;
            border-color: #0C406E !important;
        }
        
        .stButton > button[kind="secondary"] {
            background-color: #0C406E !important;
            border-color: #0C406E !important;
            color: white !important;
        }
        </style>
    """, unsafe_allow_html=True)