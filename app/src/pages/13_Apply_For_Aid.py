import logging
import requests
import streamlit as st
from modules.nav import SideBarLinks
from streamlit_extras.card import card

logger = logging.getLogger(__name__)

st.set_page_config(layout='wide')

API_URL = "http://web-api:4000/lawyers/fundreq"

# Sidebar links based on user role
SideBarLinks()

st.title("Submit Fund Request")

def get_fund_request(app_id):
    try:
        response = requests.get(f"{API_URL}/{app_id}")
        if response.status_code == 200:
            return response.json()
        else:
            return None
    except Exception as e:
        logger.error(f"Error fetching fund request {app_id}: {e}")
        return None

def display_fund_request(fund_request):
    st.write(f"**AppID:** {fund_request['AppID']}")
    st.write(f"**Title:** {fund_request['FundRequestTitle']}")
    st.write(f"**Description:** {fund_request['FundDesc']}")

    # Safely convert FundAmt to float and format
    try:
        amount = float(fund_request['FundAmt'])
        st.write(f"**Amount:** ${amount:.2f}")
    except (ValueError, TypeError):
        st.write(f"**Amount:** {fund_request['FundAmt']}")

    st.write(f"**Lawyer Email:** {fund_request['LawyerEmail']}")
    st.write(f"**Status:** {fund_request['FundStatus']}")

# Fund request submission form
with st.form("fund_request_form"):
    fund_title = st.text_input("Fund Request Title")
    fund_desc = st.text_area("Description")
    fund_amt = st.number_input("Amount Requested", min_value=0.0, format="%.2f")
    lawyer_email = st.text_input("Your Email")
    st.write("LAWYER EMAIL")
    st.write(lawyer_email)
    submitted = st.form_submit_button("Submit Request")

    if submitted:
        
        if not fund_title or not fund_desc or not fund_amt or not lawyer_email:
            st.error("Please fill out all fields.")
        else:
            payload = {
                "FundRequestTitle": fund_title,
                "FundDesc": fund_desc,
                "FundAmt": fund_amt,
                "LawyerEmail": lawyer_email
            }

            try:
                response = requests.post(API_URL, json=payload)
                if response.status_code == 201:
                    st.success("Fund request submitted successfully!")
                    app_id = response.json().get("AppID")
                    if app_id:
                        fund_request = get_fund_request(app_id)
                        if fund_request:
                            st.markdown("### Your Fund Request Details")
                            st.write(f"**AppID:** {fund_request['AppID']}")
                            st.write(f"**Title:** {fund_request['FundRequestTitle']}")
                        else:
                            st.error("Failed to retrieve fund request details.")
                    else:
                        st.error("Could not retrieve AppID from response.")
                else:
                    st.error(f"Failed to submit request: {response.text}")
                    logger.error(f"Error response: {response.text}")
            except Exception as e:
                st.error("An error occurred while submitting the request.")
                logger.exception(e)

st.markdown("---")
st.header("Lookup Your Fund Request")

# Lookup form by AppID
with st.form("lookup_form"):
    lookup_app_id = st.number_input("Enter your Fund Request AppID", min_value=1, step=1)
    lookup_submitted = st.form_submit_button("Lookup Request")

    if lookup_submitted:
        if not lookup_app_id:
            st.error("Please enter a valid AppID.")
        else:
            try:
                response = requests.get(f"{API_URL}/{lookup_app_id}")
                if response.status_code == 200:
                    fund_request = response.json()
                    st.markdown("### Fund Request Details")
                    display_fund_request(fund_request)
                elif response.status_code == 404:
                    st.error("Fund request not found.")
                else:
                    st.error(f"Error fetching fund request: {response.text}")
            except Exception as e:
                st.error("An error occurred while fetching the fund request.")
                logger.exception(e)