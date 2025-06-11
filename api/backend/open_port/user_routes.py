from flask import Blueprint, jsonify, request
import numpy as np
from backend.db_connection import db
from mysql.connector import Error
from flask import current_app
from backend.ml_models.log_reg import predict_acceptance
import pandas as pd 
users = Blueprint("users", __name__)

@users.route("/users/<role>", methods=["GET"])
def get_all_users(role):
    try:
        current_app.logger.info('Starting get_all_users request')
        cursor = db.get_db().cursor()

  # Get query parameters for filtering

        # Prepare the Base query
        query = f"SELECT * FROM User WHERE UserRole = '{role}'"

        current_app.logger.debug(f'Executing query: {query}')
        cursor.execute(query)
        users = cursor.fetchall()
        cursor.close()

        current_app.logger.info(f'Successfully retrieved {len(users)} Users')
        return jsonify(users), 200
    except Error as e:
        current_app.logger.error(f'Database error in get_all_users: {str(e)}')
        return jsonify({"error": str(e)}), 500
    
    
    