# Idea borrowed from https://github.com/fsmosca/sample-streamlit-authenticator

# This file has function to add certain functionality to the left side bar of the app

import streamlit as st


#### ------------------------ General ------------------------
def HomeNav():
    st.sidebar.page_link("Home.py", label="Home", icon="🏠")


def AboutPageNav():
    st.sidebar.page_link("pages/30_About.py", label="About", icon="🧠")

### ------------------------------- Lawyer Sidebar ---------------------------------------
def HistTrends():
    st.sidebar.page_link("pages/01_App_Prob_Stats.py", label="Find Best Asylum Option", icon="✅")

def ProBonoOpps():
    st.sidebar.page_link("pages/11_Pro_Bono_Opps.py", label="See Pro Bono Opportunities", icon="🙏🏽")
    
def DecisionStats():
    st.sidebar.page_link("pages/11_Decision_Stats.py", label="See Decision Stats", icon="📊")
    
def LegalAidHome():
    st.sidebar.page_link("pages/02_Legal_Aid_App.py", label="Seek Legal Aid", icon="👨🏽‍⚖️")

    
### -------------------------- Refugee Sidebar -------------------------------------------
def AcceptanceProbStats():
    st.sidebar.page_link("pages/01_App_Prob_Stats.py", label="Find Best Asylum Option", icon="✅")

def EducationSysData():
    st.sidebar.page_link("pages/03_Education_Data.py", label="See Education Stats", icon="📚")
    
def ReligDemographics():
    st.sidebar.page_link("pages/04_Religious_Demo.py", label="See Religious Demographics", icon="📊")
    
def LegalAidHome():
    st.sidebar.page_link("pages/02_Legal_Aid_App.py", label="Seek Legal Aid", icon="👨🏽‍⚖️")
    
def RefugeeProfile():
    st.sidebar.page_link("pages/06_Refugee_Profile.py", label="User Profile", icon="👤")
#### ------------------------ Examples for Role of pol_strat_advisor ------------------------
def PolStratAdvHomeNav():
    st.sidebar.page_link(
        "pages/00_Pol_Strat_Home.py", label="Political Strategist Home", icon="👤"
    )


def WorldBankVizNav():
    st.sidebar.page_link(
        "pages/01_World_Bank_Viz.py", label="World Bank Visualization", icon="🏦"
    )


def MapDemoNav():
    st.sidebar.page_link("pages/02_Map_Demo.py", label="Map Demonstration", icon="🗺️")


## ------------------------ Examples for Role of usaid_worker ------------------------
def ApiTestNav():
    st.sidebar.page_link("pages/12_API_Test.py", label="Test the API", icon="🛜")


def PredictionNav():
    st.sidebar.page_link(
        "pages/11_Prediction.py", label="Regression Prediction", icon="📈"
    )


def ClassificationNav():
    st.sidebar.page_link(
        "pages/13_Classification.py", label="Classification Demo", icon="🌺"
    )


def NgoDirectoryNav():
    st.sidebar.page_link("pages/14_NGO_Directory.py", label="NGO Directory", icon="📁")


def AddNgoNav():
    st.sidebar.page_link("pages/15_Add_NGO.py", label="Add New NGO", icon="➕")


#### ------------------------ System Admin Role ------------------------
def AdminPageNav():
    st.sidebar.page_link("pages/20_Admin_Home.py", label="System Admin", icon="🖥️")
    st.sidebar.page_link(
        "pages/21_ML_Model_Mgmt.py", label="ML Model Management", icon="🏢"
    )
def DiplomatNav():
    st.sidebar.page_link("pages/20_Commissioner_Home.py", label="Diplomat Home", icon="👤")
    st.sidebar.page_link("pages/21_pending_to_aid.py", label="Pending/Aid", icon="⛑️")
    st.sidebar.page_link("pages/22_Low_Acpt.py", label="Low Acceptance Countries", icon="📉")
    st.sidebar.page_link("pages/23_Group_Acpt.py", label="Inclusion Index", icon="🤝")
    st.sidebar.page_link("pages/24_Find_Aid_Projects.py", label="Humanitarian Aid Dashboard", icon="📦")



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
            EducationSysData()
            ReligDemographics()
            LegalAidHome()
            RefugeeProfile()
            
        # # Show World Bank Link and Map Demo Link if the user is a political strategy advisor role.
        # if st.session_state["role"] == "pol_strat_advisor":
        #     PolStratAdvHomeNav()
        #     WorldBankVizNav()
        #     MapDemoNav()

        # # If the user role is usaid worker, show the Api Testing page
        # if st.session_state["role"] == "usaid_worker":
        #     PredictionNav()
        #     ApiTestNav()
        #     ClassificationNav()
        #     NgoDirectoryNav()
        #     AddNgoNav()

        # If the user is an administrator, give them access to the administrator pages
        if st.session_state["role"] == "administrator":
            AdminPageNav()
        
        if st.session_state["role"] == "diplomat":
            DiplomatNav()
            
        if st.session_state["role"] == "lawyer":
            ProBonoOpps()
            DecisionStats()
    
    # Always show the About page at the bottom of the list of links
    AboutPageNav()

    if st.session_state["authenticated"]:
        # Always show a logout button if there is a logged in user
        if st.sidebar.button("Logout"):
            del st.session_state["role"]
            del st.session_state["authenticated"]
            st.switch_page("Home.py")


        