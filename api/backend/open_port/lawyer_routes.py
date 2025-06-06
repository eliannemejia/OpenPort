
from flask import Blueprint, jsonify, request
from backend.db_connection import db
from mysql.connector import Error
from flask import current_app

# Create a Blueprint for NGO routes
lawyers = Blueprint("lawyers", __name__)

@lawyers.route("/legal_aid_applications", methods=["GET"])
def get_applications():
    try:
        current_app.logger.info('Starting get_applications request')
        cursor = db.get_db().cursor()


        # Prepare the Base query
        query = "SELECT * FROM LegalAidApplication"
        
        current_app.logger.debug(f'Executing query: {query}')
        cursor.execute(query)
        users = cursor.fetchall()
        cursor.close()

        current_app.logger.info(f'Successfully retrieved {len(users)} Users')
        return jsonify(users), 200
    except Error as e:
        current_app.logger.error(f'Database error in get_all_users: {str(e)}')
        return jsonify({"error": str(e)}), 500