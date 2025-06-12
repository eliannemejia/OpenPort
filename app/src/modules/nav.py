# Idea borrowed from https://github.com/fsmosca/sample-streamlit-authenticator

# This file has function to add certain functionality to the left side bar of the app

import streamlit as st


#### ------------------------ General ------------------------
def HomeNav():
    st.sidebar.page_link("Home.py", label="Home", icon="🏠")


def AboutPageNav():
    st.sidebar.page_link("pages/30_About.py", label="About", icon="🧠")

### ------------------------------- Lawyer Sidebar ---------------------------------------

def ProBonoOpps():
    st.sidebar.page_link("pages/11_Pro_Bono_Opps.py", label="See Pro Bono Opportunities", icon="🙏🏽")
    
def DecisionStats():
    st.sidebar.page_link("pages/11_Decision_Stats.py", label="See Decision Stats", icon="📊")
    
def RequestFunding():
    st.sidebar.page_link("pages/13_Apply_For_Aid.py", label="Apply for Funding", icon="💰")

def LawyerProfile():
    st.sidebar.page_link("pages/14_Lawyer_Profile.py", label="User Profile", icon="👤")
    
### -------------------------- Refugee Sidebar -------------------------------------------
def AcceptanceProbStats():
    st.sidebar.page_link("pages/01_App_Prob_Stats.py", label="Find Best Asylum Option", icon="✅")

def CountryDemographics():
    st.sidebar.page_link("pages/03_Country_Demographics.py", label="See Country Demographics", icon="📚")
    
def LegalAidHome():
    st.sidebar.page_link("pages/02_Legal_Aid_App.py", label="Seek Legal Aid", icon="👨🏽‍⚖️")
    
def RefugeeProfile():
    st.sidebar.page_link("pages/06_Refugee_Profile.py", label="User Profile", icon="👤")
    

def DiplomatNav():
    st.sidebar.page_link("pages/20_Commissioner_Home.py", label="Commissioner Home", icon="👤")
    st.sidebar.page_link("pages/21_pending_to_aid.py", label="Pending Funding", icon="💰")
    st.sidebar.page_link("pages/22_Low_Acpt.py", label="Decision Stats", icon="📈")
    st.sidebar.page_link("pages/23_Group_Acpt.py", label="Future Expenditure", icon="🏛️")
    st.sidebar.page_link("pages/24_Find_Aid_Projects.py", label="Aid Dashboard", icon="🌍")



# --------------------------------Links Function -----------------------------------------------
def SideBarLinks(show_home=False):
    """
    This function handles adding links to the sidebar of the app based upon the logged-in user's role, which was put in the streamlit session_state object when logging in.
    """

    # add a logo to the sidebar always
    st.sidebar.image("assets/logo.png", width=600)

    # If there is no logged in user, redirect to the Home (Landing) page
    if "authenticated" not in st.session_state:
        st.session_state.authenticated = False
        st.switch_page("Home.py")

    if show_home:
        # Show the Home page link (the landing page)
        HomeNav()

    # Show the other page navigators depending on the users' role.
    if st.session_state["authenticated"]:

        # Show Asylum Acceptance Probability, Education Data, Religious Demographics and Legal Application Links
        if st.session_state["role"] == "asylum_seeker":
            AcceptanceProbStats()
            CountryDemographics()
            LegalAidHome()
            RefugeeProfile()
        
        if st.session_state["role"] == "diplomat":
            DiplomatNav()
            
        if st.session_state["role"] == "lawyer":
            ProBonoOpps()
            DecisionStats()
            RequestFunding()
            LawyerProfile()
    
    # Always show the About page at the bottom of the list of links
    AboutPageNav()

    if st.session_state["authenticated"]:
        # Always show a logout button if there is a logged in user
        if st.sidebar.button("Logout"):
            del st.session_state["role"]
            del st.session_state["authenticated"]
            st.switch_page("Home.py")


        