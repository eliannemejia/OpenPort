from flask import Blueprint, jsonify, request
from backend.db_connection import db
from mysql.connector import Error
from flask import current_app

diplomats = Blueprint("diplomats", __name__)



@diplomats.route("/rejected_app",methods=["GET"])
def get_rejectd():
    try:
        current_app.logger.info('Starting get_rejected request')
        cursor = db.get_db().cursor()

        # Get query parameters
        country_name = request.args.get("country_name")
        country_id = request.args.get("country_id")
        year = request.args.get("year")

        current_app.logger.debug(f'Query parameters - country_name: {country_name}, country_id: {country_id}, year: {year}')

        # Base query
        query = """
            SELECT 
                c.CountryID, 
                c.CountryName, 
                d.DecisionYear, 
                d.Total AS RejectedTotal
            FROM Decision d
            JOIN Country c ON d.DecidingCountry = c.CountryID
            WHERE d.DecisionType = 'REJECTED'
        """
        params = []

        # Add filters if provided
        if country_id:
            query += " AND c.CountryID = %s"
            params.append(country_id)
        if country_name:
            query += " AND c.CountryName = %s"
            params.append(country_name)
        if year:
            query += " AND d.DecisionYear = %s"
            params.append(year)

        current_app.logger.debug(f'Executing query: {query} with params: {params}')
        cursor.execute(query, params)
        results = cursor.fetchall()
        cursor.close()

        current_app.logger.info(f'Successfully retrieved {len(results)} rejected applications')
        return jsonify(results), 200

    except Error as e:
        current_app.logger.error(f'Database error in get_rejected: {str(e)}')
        return jsonify({"error": str(e)}), 500


@diplomats.route("/accepted_applications", methods=["GET"])
def get_accepted_applications():
    try:
        current_app.logger.info('Starting get_accepted_applications request')
        cursor = db.get_db().cursor()
 
        country_name = request.args.get("country_name")
        country_id = request.args.get("country_id")

        current_app.logger.debug(f'Query parameters - country_name: {country_name}, country_id: {country_id}')


        # Base query
        query = """
            SELECT 
                CountryID, 
                CountryName, 
                NormAcceptance
            FROM CountryRatePerPop
            WHERE 1=1
        """
        params = []

        # Add filters if provided
        if country_id:
            query += " AND CountryID = %s"
            params.append(country_id)
        if country_name:
            query += " AND CountryName = %s"
            params.append(country_name)

        current_app.logger.debug(f'Executing query: {query} with params: {params}')
        cursor.execute(query, params)
        results = cursor.fetchall()
        cursor.close()

        current_app.logger.info(f'Successfully retrieved {len(results)} normalized accepted application rates')
        return jsonify(results), 200

    except Error as e:
        current_app.logger.error(f'Database error in get_accepted_applications: {str(e)}')
        return jsonify({"error": str(e)}), 500





@diplomats.route("/aid_recommendations", methods=["GET"])
def get_aid_recommendations():
    try:
        current_app.logger.info('Starting get_aid_recommendations request')
        conn = db.get_db()
        cursor = conn.cursor()  

        country_name = request.args.get("country_name")
        country_id = request.args.get("country_id")

        current_app.logger.debug(f'Query parameters - country_name: {country_name}, country_id: {country_id}')

        query = """
            SELECT 
                c.CountryID, 
                c.CountryName, 
                COUNT(ap.ProjectID) AS NumAidProjects
            FROM Country c
            LEFT JOIN AidProject ap ON c.CountryID = ap.CountryID
            WHERE 1=1
        """
        params = []

        if country_id:
            query += " AND c.CountryID = %s"
            params.append(country_id)
        if country_name:
            query += " AND c.CountryName = %s"
            params.append(country_name)

        query += " GROUP BY c.CountryID, c.CountryName"

        current_app.logger.debug(f'Executing query: {query} with params: {params}')
        cursor.execute(query, params)
        results = cursor.fetchall()
        cursor.close()

        current_app.logger.info(f'Successfully retrieved {len(results)} aid recommendations')
        return jsonify(results), 200

    except Error as e:
        current_app.logger.error(f'Database error in get_aid_recommendations: {str(e)}')
        return jsonify({"error": str(e)}), 500


@diplomats.route("/aid_projects", methods=["POST"])
def create_aid_project():
    try:
        data = request.get_json()

        # Validate required fields (including start_date)
        required_fields = ["title", "description", "country", "start_date"]
        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"Missing required field: {field}"}), 400

        # Optional: Validate date format (simple check)
        from datetime import datetime
        try:
            datetime.strptime(data["start_date"], "%Y-%m-%d")
        except ValueError:
            return jsonify({"error": "start_date must be in YYYY-MM-DD format"}), 400

        cursor = db.get_db().cursor()

        # Get CountryID from CountryName
        cursor.execute("SELECT CountryID FROM Country WHERE CountryName = %s", (data["country"],))
        country_row = cursor.fetchone()
        if not country_row:
            return jsonify({"error": "Country not found"}), 400
        country_id = country_row['CountryID']


        # Insert new AidProject with StartDate
        query = """
        INSERT INTO AidProject (Title, Proj_Description,CountryID, StartDate)
        VALUES (%s, %s, %s, %s)
        """
        cursor.execute(
            query,
            (
                
                data["title"],
                data["description"],
                country_id,
                data["start_date"]
            ),
        )

        db.get_db().commit()
        new_project_id = cursor.lastrowid
        cursor.close()

        return (
            jsonify({"message": "Aid project created successfully", "project_id": new_project_id}),
            201,
        )
    except Error as e:
        return jsonify({"error": str(e)}), 500

@diplomats.route("/aid_projects/<int:project_id>", methods=["PUT"])
def update_aid_project(project_id):
    try:
        data = request.get_json()

        # Validate required fields
        required_fields = ["title", "description", "country", "start_date"]
        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"Missing required field: {field}"}), 400

        # Validate date format
        from datetime import datetime
        try:
            datetime.strptime(data["start_date"], "%Y-%m-%d")
        except ValueError:
            return jsonify({"error": "start_date must be in YYYY-MM-DD format"}), 400

        cursor = db.get_db().cursor()

        # Get CountryID from CountryName
        cursor.execute("SELECT CountryID FROM Country WHERE CountryName = %s", (data["country"],))
        country_row = cursor.fetchone()
        if not country_row:
            return jsonify({"error": "Country not found"}), 400
        country_id = country_row["CountryID"]

        # Update query
        update_query = """
            UPDATE AidProject
            SET Title = %s,
                Proj_Description = %s,
                CountryID = %s,
                StartDate = %s
            WHERE ProjectID = %s
        """

        cursor.execute(update_query, (
            data["title"],
            data["description"],
            country_id,
            data["start_date"],
            project_id
        ))

        if cursor.rowcount == 0:
            return jsonify({"error": "Project not found or no changes made"}), 404

        db.get_db().commit()
        cursor.close()

        return jsonify({"message": "Aid project updated successfully"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500

@diplomats.route("/aid_project/delete/<int:project_id>", methods=["DELETE"])
def delete_aid_project(project_id):
    try:
        cursor = db.get_db().cursor()

        # Delete the project by project_id
        delete_query = "DELETE FROM AidProject WHERE ProjectID = %s"
        cursor.execute(delete_query, (project_id,))

        if cursor.rowcount == 0:
            # No project was deleted because it doesn't exist
            return jsonify({"error": "Project not found"}), 404

        db.get_db().commit()
        cursor.close()

        return jsonify({"message": "Aid project deleted successfully"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500


@diplomats.route("/timeseries", methods=["GET"])
def get_timeseries():
    try:
        cursor = db.get_db().cursor()
        year = request.args.get("year")
        country = request.args.get("country")

        query = """
            SELECT TimeID, DateYear, Country, TValue
            FROM TimeSeries
            WHERE 1=1
        """
        params = []

        if year:
            query += " AND DateYear = %s"
            params.append(year)
        if country:
            query += " AND Country = %s"
            params.append(country)

        cursor.execute(query, params)
        result = cursor.fetchall()
        cursor.close()

        return jsonify(result), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500


@diplomats.route("/weights", methods=["GET"])
def get_weights():
    try:
        current_app.logger.info('Starting get_weights request')
        cursor = db.get_db().cursor()
        
        query = "SELECT * FROM RawWeights"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()

        current_app.logger.info('Successfully retrieved weights data')
        return jsonify(results), 200

    except Error as e:
        current_app.logger.error(f'Database error in get_weights: {str(e)}')
        return jsonify({"error": str(e)}), 500
