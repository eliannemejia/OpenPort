from flask import Blueprint, jsonify, request
from backend.db_connection import db
from mysql.connector import Error
from flask import current_app
from backend.ml_models.log_reg import predict_acceptance

# Create a Blueprint for NGO routes
refugees = Blueprint("refugees", __name__)

    
@refugees.route("/application_stats", methods=["GET"])
def get_top_three():
    try:
        current_app.logger.info('Starting get_all_countries request')
        cursor = db.get_db().cursor()

        geo = request.args.get("geo")
        sex = request.args.get("sex")
        citizen = request.args.get("citizen")
        age = request.args.get("age")
        
        query = "SELECT DISTINCT geo, acceptance_rate FROM AverageAcceptanceRates WHERE 1=1"
        params = []

        # Add filters if provided
        if sex:
            query += " AND sex = %s"
            params.append(sex)
        if citizen:
            query += " AND citizen = %s"
            params.append(citizen)
        if age: 
            query += " AND age = %s"
            params.append(age)
        
        query += " ORDER BY acceptance_rate DESC"
        query += " LIMIT 3"
        
        cursor.execute(query, params)
        top_three = cursor.fetchall()
        cursor.close()
        
        if not top_three:
            return jsonify({"error": "NGO not found"}), 404
        
        cursor.close()
    
        current_app.logger.info(f'Successfully retrieved top three countries')
        return jsonify(top_three), 200
    except Error as e:
        current_app.logger.error(f'Database error in get_top_three: {str(e)}')
        return jsonify({"error": str(e)}), 500
    
    
@refugees.route("/application_stats/probability/<uid>", methods=["GET"]) 
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

# From Mock Data
@refugees.route("/available_lawyers/<uid>", methods=["PUT"])
def update_lawyers(uid):
    return

@refugees.route("/new_user", methods=["POST"])
def create_user():
    try:
        data = request.get_json()
        required_fields = ["FirstName", "LastName", "UserRole", "Email"]
        
        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"Missing required field: {field}"}), 400
            if field == "UserRole" and data[field] not in ["Lawyer", "AsylumSeeker", "Diplomat"]:
                return jsonify({"error": f"Invalid User Role {data[field]} Only Lawyer, AsylumSeeker, or Diplomat are accepted"}), 400
        
        cursor = db.get_db().cursor()
        
        query = """
        INSERT INTO User (LastLogin, FirstName, LastName, UserRole, Email)
        VALUES (NOW(), %s, %s, %s, %s)
        """
        
        cursor.execute(
            query,
            (
                data["FirstName"],
                data["LastName"],
                data["UserRole"],
                data["Email"],
            ),
        )
        
        db.get_db().commit()
        user_id = cursor.lastrowid
        cursor.close()

        return (
            jsonify({"message": "User Created Successfully", "UserID": user_id}),
            201,
        )
    except Error as e:
        return jsonify({"error": str(e)}), 500
    
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
        return country
    except Error as e:
        current_app.logger.error(f'Database error in get_all_countries: {str(e)}')
        return jsonify({"error": str(e)}), 500
    
@refugees.route("/new_user/<int:uid>", methods=["POST"])
def new_asylum_seeker(uid):
    try:
        data = request.get_json()
        required_fields = ["DOB", "SEX", "CurrentLocation", "Citizenship"]
        
        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"Missing required field: {field}"}), 400
        
        cursor = db.get_db().cursor()
        c_loc = data["CurrentLocation"]
        cit = data["Citizenship"]
        current_loc_response = get_country_by_name(c_loc)
        citizenship_response = get_country_by_name(cit)
        
        current_loc_id = current_loc_response["CountryID"]
        citizenship_id = citizenship_response["CountryID"]
        
        query = """
        INSERT INTO AsylumSeeker (UserID, DOB, SEX, CurrentLocation, Citizenship)
        VALUES (%s, %s, %s, %s, %s)
        """
        
        cursor.execute(
            query,
            (
                uid,
                data["DOB"],
                data["SEX"],
                current_loc_id,
                citizenship_id,
            ),
        )
        
        db.get_db().commit()
        applicant_id = cursor.lastrowid
        cursor.close()

        return (
            jsonify({"message": "Asylum Seeker Created Successfully", "applicant_id": applicant_id}),
            201,
        )
    except Error as e:
        return jsonify({"error": str(e)}), 500

@refugees.route("/legal_aid_application/<uid>", methods=["POST"])
def submit_application(uid):
    try:
        data = request.get_json()
        required_fields = ["AidDescription"]
        
        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"Missing required field: {field}"}), 400
        
        cursor = db.get_db().cursor()
        
        query = """
        INSERT INTO LegalAidApplication (ApplicantID, AidDescription, SubmissionDate)
        VALUES (%s, %s, CURRENT_DATE())
        """
        
        cursor.execute(
            query,
            (
                uid,
                data["AidDescription"],
            ),
        )
        
        db.get_db().commit()
        app_id = cursor.lastrowid
        cursor.close()

        return (
            jsonify({"message": "Application Submitted Sucessfully", "application_id": app_id}),
            201,
        )
    except Error as e:
        return jsonify({"error": str(e)}), 500

@refugees.route("/legal_aid_application/<uid>", methods=["DELETE"])
def assign_lawyer(uid):
    return

@refugees.route("/users", methods=["GET"])
def get_all_users():
    try:
        current_app.logger.info('Starting get_all_users request')
        cursor = db.get_db().cursor()

  # Get query parameters for filtering
        role = request.args.get("role")

        # Prepare the Base query
        query = "SELECT * FROM User WHERE 1=1"
        params = []

        # Add filters if provided
        if role:
            query += " AND UserRole = %s"
            params.append(role)

        current_app.logger.debug(f'Executing query: {query}')
        cursor.execute(query, params)
        users = cursor.fetchall()
        cursor.close()

        current_app.logger.info(f'Successfully retrieved {len(users)} Users')
        return jsonify(users), 200
    except Error as e:
        current_app.logger.error(f'Database error in get_all_users: {str(e)}')
        return jsonify({"error": str(e)}), 500
    
@refugees.route("/asylum_seekers", methods=["GET"])
def get_all_seekers():
    try:
        current_app.logger.info('Starting get_all_users request')
        cursor = db.get_db().cursor()

  # Get query parameters for filtering
        role = request.args.get("role")

        # Prepare the Base query
        query = "SELECT * FROM AsylumSeeker"
    
        current_app.logger.debug(f'Executing query: {query}')
        cursor.execute(query)
        users = cursor.fetchall()
        cursor.close()

        current_app.logger.info(f'Successfully retrieved {len(users)} Asylum Seekers')
        return jsonify(users), 200
    except Error as e:
        current_app.logger.error(f'Database error in get_all_seekers: {str(e)}')
        return jsonify({"error": str(e)}), 500



@refugees.route("/legal_aid_application/family/<int:fid>", methods=["POST"])
def add_family_member(fid):
    try:
        data = request.get_json()
        required_fields = ["DOB", "SEX", "FirstName", "LastName"]
        
        for field in required_fields:
            if field not in data:
                print(data)
                return jsonify({"error": f"Missing required field: {field}"}), 400
        
        cursor = db.get_db().cursor()
        
        query = """
        INSERT INTO FamilyMember (FamilyID, DOB, SEX, FirstName, LastName)
        VALUES (%s, %s, %s, %s, %s)
        """
        
        cursor.execute(
            query,
            (
                fid,
                data["DOB"],
                data["SEX"],
                data["FirstName"],
                data["LastName"],
            ),
        )
        
        db.get_db().commit()
        applicant_id = cursor.lastrowid
        cursor.close()

        return (
            jsonify({"message": "Asylum Seeker Created Successfully", "applicant_id": applicant_id}),
            201,
        )
    except Error as e:
        return jsonify({"error": str(e)}), 500
    
@refugees.route("/legal_aid_applications", methods=["GET"])
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
    
@refugees.route("/final_prediction/<age>/<sex>/<citizen>", methods=["GET"])
def get_weight_vector():
    try:
        # call sql to get the weight vector table, this also has teh column names
        current_app.logger.info('Starting get_weights request')
        cursor = db.get_db().cursor()

        # Prepare the Base query
        query = "SELECT * FROM Weights"
        cursor.execute(query)
        weights = cursor.fetchall()
        cursor.close()
        
        # one_hot_template is teh column name 
        # the weights are the num py array of the vlaues in that data frame
        # in sql we have a one row 176 column table 
        return weights.json()
    except Error as e:
        current_app.logger.error(f'Database error in get_prediction: {str(e)}')
        return jsonify({"error": str(e)}), 500 
    
@refugees.route("/final_prediction/<age>/<sex>/<citizen>", methods=["GET"])
def get_prediction(age, sex, citizen):
    try:
        # call sql to get the weight vector table, this also has teh column names
        current_app.logger.info('Starting get_weights request')
        cursor = db.get_db().cursor()

        # Prepare the Base query
        query = "SELECT * FROM Weights"
        
        
        # one_hot_template is teh column name 
        # the weights are the num py array of the vlaues in that data frame
        # in sql we have a one row 176 column table 
        return
    except Error as e:
        current_app.logger.error(f'Database error in get_prediction: {str(e)}')
        return jsonify({"error": str(e)}), 500 