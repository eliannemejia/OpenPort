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

st.markdown(
    """
    ## About the Creators:
    """
)

col1, col2, col3, col4 = st.columns(4, gap="Small")

with col1:
    st.image("assets/Alp.jpg", width=300)
    st.markdown("""
                Alp Berrak
                \n4th Year
                \nCybersecurity Major
                """)
with col2:
    st.image("assets/Elianne.jpg", width=300)
    st.markdown("""
                Elianne Mejia
                \n4th Year
                \nComputer Science Major
                """)
    
with col3:
    st.image("assets/Jess.jpeg", width=300)
    st.markdown("""
                Jessica Poblete
                \n2nd Year
                \nComputer Science Major
                """)

with col4:
    st.image("assets/Mahika.jpg", width=207)
    st.markdown("""
                Mahika Modi
                \n3rd Year
                \nData Science and Finance Major
                """)

# Add a button to return to home page
if st.button("Return to Home", type="primary"):
    st.switch_page("Home.py")
