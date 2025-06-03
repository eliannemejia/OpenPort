import streamlit as st
import requests
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

# Initialize sidebar
SideBarLinks()

st.title("Add New NGO")

# API endpoint
API_URL = "http://web-api:4000/ngo/ngos"

# Create a form for NGO details
with st.form("add_ngo_form"):
    st.subheader("NGO Information")

    # Required fields
    name = st.text_input("Organization Name *")
    country = st.text_input("Country *")
    founding_year = st.number_input(
        "Founding Year *", min_value=1800, max_value=2024, value=2024
    )
    focus_area = st.text_input("Focus Area *")
    website = st.text_input("Website URL *")

    # Form submission button
    submitted = st.form_submit_button("Add NGO")

    if submitted:
        # Validate required fields
        if not all([name, country, founding_year, focus_area, website]):
            st.error("Please fill in all required fields marked with *")
        else:
            # Prepare the data for API
            ngo_data = {
                "Name": name,
                "Country": country,
                "Founding_Year": int(founding_year),
                "Focus_Area": focus_area,
                "Website": website,
            }

            try:
                # Send POST request to API
                response = requests.post(API_URL, json=ngo_data)

                if response.status_code == 201:
                    st.success("NGO added successfully!")
                    # Clear the form
                    st.rerun()
                else:
                    st.error(
                        f"Failed to add NGO: {response.json().get('error', 'Unknown error')}"
                    )

            except requests.exceptions.RequestException as e:
                st.error(f"Error connecting to the API: {str(e)}")
                st.info("Please ensure the API server is running")

# Add a button to return to the NGO Directory
if st.button("Return to NGO Directory"):
    st.switch_page("pages/14_NGO_Directory.py")
