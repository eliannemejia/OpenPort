from flask import Blueprint, jsonify, request
from backend.db_connection import db
from mysql.connector import Error
from flask import current_app

countries = Blueprint("test", __name__)

@countries.route("/countries", methods=["GET"]) 
def get_all_countries():
    try:
        current_app.logger.info('Starting get_all_countries request')
        cursor = db.get_db().cursor()

        query = "SELECT CountryName FROM Country"

        current_app.logger.debug(f'Executing query: {query}')
        cursor.execute(query)
        countries = cursor.fetchall()
        cursor.close()

        current_app.logger.info(f'Successfully retrieved {len(countries)} Countries')
        return jsonify(countries), 200
    except Error as e:
        current_app.logger.error(f'Database error in get_all_countries: {str(e)}')
        return jsonify({"error": str(e)}), 500
    

@countries.route("/countries/<cname>", methods=["GET"])
def get_country_by_name(cname):
    try:
        current_app.logger.info('Starting get_all_countries request')
        cursor = db.get_db().cursor()

        cursor.execute("SELECT * FROM Country WHERE CountryName = %s", (cname,))
        
        country = cursor.fetchone()
        
        if not country:
            return jsonify({"error": "NGO not found"}), 404
        
        cursor.close()
    
        current_app.logger.info(f'Successfully retrieved Country: {cname}')
        return jsonify(country), 200
    except Error as e:
        current_app.logger.error(f'Database error in get_all_countries: {str(e)}')
        return jsonify({"error": str(e)}), 500
    

