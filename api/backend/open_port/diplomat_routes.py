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
        year = request.args.get("year")

        current_app.logger.debug(f'Query parameters - country_name: {country_name}, country_id: {country_id}, year: {year}')

        # Base query
        query = """
            SELECT 
                c.CountryID, 
                c.CountryName, 
                d.DecisionYear, 
                d.Total AS AcceptedTotal
            FROM Decision d
            JOIN Country c ON d.DecidingCountry = c.CountryID
            WHERE d.DecisionType = 'TOTAL_POS'
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

        current_app.logger.info(f'Successfully retrieved {len(results)} accepted applications')
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
  
  
@diplomats.route("/group_data", methods=["GET"])
def get_group_data():
    try:
        current_app.logger.info('Starting get_group_data request')
        cursor = db.get_db().cursor()
        
        # Query parameters
        country = request.args.get("country")  # maps to CurrentLocation
        citizenship = request.args.get("citizenship")
        age = request.args.get("age")  # expected as an integer
        sex = request.args.get("sex")
        religion = request.args.get("religion")
        
        current_app.logger.debug(f'Params - country: {country}, citizenship: {citizenship}, age: {age}, sex: {sex}, religion: {religion}')
        
        # Base query with JOINs to get readable values
        query = """
            SELECT 
                a.ApplicantID, u.FirstName, u.LastName, a.SEX, a.DOB, 
                TIMESTAMPDIFF(YEAR, a.DOB, CURDATE()) AS Age, c1.CountryName AS CurrentLocation, c2.CountryName AS Citizenship, r.ReligionName               
            FROM AsylumSeeker a
            JOIN User u ON a.UserID = u.UserID
            LEFT JOIN Country c1 ON a.CurrentLocation = c1.CountryID
            LEFT JOIN Country c2 ON a.Citizenship = c2.CountryID
            LEFT JOIN Religion r ON a.Religion = r.ReligionID
            WHERE 1=1
        """

        params = []
        
        # Filters
        if country:
            query += " AND c1.CountryName = %s"
            params.append(country)
        if citizenship:
            query += " AND c2.CountryName = %s"
            params.append(citizenship)
        if age:
            query += " AND TIMESTAMPDIFF(YEAR, a.DOB, CURDATE()) = %s"
            params.append(age)
        if sex:
            query += " AND a.SEX = %s"
            params.append(sex)
        if religion:
            query += " AND r.ReligionName = %s"
            params.append(religion)
        
        current_app.logger.debug(f'Executing: {query} with {params}')
        cursor.execute(query, params)
        result = cursor.fetchall()
        cursor.close()

        current_app.logger.info(f'Retrieved {len(result)} vulnerable group entries')
        return jsonify(result), 200

    except Error as e:
        current_app.logger.error(f'Database error in get_group_data: {str(e)}')
        return jsonify({"error": str(e)}), 500