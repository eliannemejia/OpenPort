from flask import Blueprint, jsonify, request
from backend.db_connection import db
from mysql.connector import Error
from flask import current_app

# Create a Blueprint for NGO routes
refugees = Blueprint("refugees", __name__)

@refugees.route("/application_stats/<uid>", methods=["GET"]) 
def get_acceptance_prob(uid):
    return

# From Mock Data
@refugees.route("/education_info/<country>", methods=["GET"])
def get_education_ranks(country):
    return

# From Mock Data
@refugees.route("/religious_info/country", methods=["GET"])
def get_religion(country):
    return

# # From Mock Data
# @refugees.route("/available_lawyers/<uid>", methods=["GET"])
# def get_lawyers(uid):
#     return

# From Mock Data
@refugees.route("/available_lawyers/<uid>", methods=["PUT"])
def get_lawyers(uid):
    return

@refugees.route("/legal_aid_application/<uid>", methods=["POST"])
def submit_application(uid):
    return

@refugees.route("/legal_aid_application/<uid>", methods=["DELETE"])
def assign_lawyer(uid):
    return  