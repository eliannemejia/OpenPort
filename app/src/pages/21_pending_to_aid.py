import streamlit as st
import requests
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')

# Sidebar navigation
SideBarLinks()

st.header("Review Pending Aid Applications")

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
    st.markdown("""
        <style>
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .custom-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            padding: 16px;
        }
        .card-header {
            font-weight: bold;
            font-size: 1.1rem;
            margin-bottom: 8px;
        }
        .card-body p {
            margin: 4px 0;
            font-size: 0.9rem;
        }
        .card-buttons {
            margin-top: 12px;
            display: flex;
            justify-content: space-between;
        }
        </style>
    """, unsafe_allow_html=True)

    st.markdown('<div class="card-grid">', unsafe_allow_html=True)

    for req in pending_requests:
        app_id = req["AppID"]
        title = req["FundRequestTitle"]
        desc = req["FundDesc"]
        amt = req["FundAmt"]
        lawyer_email = req["LawyerEmail"]
        status = req["FundStatus"]

        st.markdown(f'<div class="custom-card">', unsafe_allow_html=True)
        st.markdown(f'<div class="card-header">{title} (ID: {app_id})</div>', unsafe_allow_html=True)
        st.markdown(f'<div class="card-body">', unsafe_allow_html=True)
        st.markdown(f'<p><b>Description:</b> {desc}</p>', unsafe_allow_html=True)
        st.markdown(f'<p><b>Amount Requested:</b> ${amt}</p>', unsafe_allow_html=True)
        st.markdown(f'<p><b>Lawyer Email:</b> {lawyer_email}</p>', unsafe_allow_html=True)
        st.markdown(f'<p><b>Status:</b> {status}</p>', unsafe_allow_html=True)
        st.markdown('</div>', unsafe_allow_html=True)

        col1, col2 = st.columns([1, 1])
        with col1:
            if st.button(f"Accept {app_id}", key=f"accept_{app_id}"):
                if update_fund_status(app_id, "Accepted"):
                    st.rerun()  # Refresh to update UI after change

        with col2:
            if st.button(f"Reject {app_id}", key=f"reject_{app_id}"):
                if update_fund_status(app_id, "Rejected"):
                    st.rerun()  # Refresh to update UI after change

        st.markdown('</div>', unsafe_allow_html=True)

    st.markdown('</div>', unsafe_allow_html=True)