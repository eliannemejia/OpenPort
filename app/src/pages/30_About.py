import streamlit as st
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

SideBarLinks()

# Create three columns for layout centering
left, center, right = st.columns([1, 2, 1])

with center:
    # Use HTML to center-align text within the middle column
    st.markdown("<h1 style='text-align: center;'>About Open Port</h1>", unsafe_allow_html=True)

st.markdown(
    """
    In a world increasingly torn by conflict, Open Port is a digital lifeline for those navigating the asylum process. 
    
    Whether you're a displaced refugee, a diplomat allocating aid, or a lawyer offering pro bono support, our platform delivers tailored insights from our extensive global asylum database. 
    
    Refugees can discover the most welcoming countries based on acceptance rates, cultural fit, and legal resources. Diplomats get actionable data to direct humanitarian aid where it matters most. 
    
    Legal professionals can identify where their impact will be greatest. Open Port turns complex, fragmented asylum systems into a guided, informed journey toward safety and support.
    """
)

# Add a button to return to home page
if st.button("Return to Home", type="primary"):
    st.switch_page("Home.py")
