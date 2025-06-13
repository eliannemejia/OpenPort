
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
    
@lawyers.route("/legal_aid_applications/<aid_type>", methods=["GET"])
def get_applications_by_type(aid_type):
    try:
        current_app.logger.info('Starting get_applications request')
        cursor = db.get_db().cursor()


        # Prepare the Base query
        query = f"SELECT * FROM LegalAidApplication WHERE AidDescription = '{aid_type}' AND IsActive = 1"
        current_app.logger.info(f'Aid Type {aid_type}')
        
        current_app.logger.debug(f'Executing query: {query}')
        cursor.execute(query)
        users = cursor.fetchall()
        cursor.close()

        current_app.logger.info(f'Successfully retrieved {len(users)} Users')
        return jsonify(users), 200
    except Error as e:
        current_app.logger.error(f'Database error in get_all_users: {str(e)}')
        return jsonify({"error": str(e)}), 500
    
    
@lawyers.route("/asylum_seekers/<uid>", methods=["GET"])
def get_user_name(uid):
    try:
        current_app.logger.info('Starting get_all_users request')
        cursor = db.get_db().cursor()

  # Get query parameters for filtering
        role = request.args.get("role")

        # Prepare the Base query
        query = f"SELECT FirstName, LastName FROM User WHERE UserID = {uid}"
    
        current_app.logger.debug(f'Executing query: {query}')
        cursor.execute(query)
        users = cursor.fetchall()
        cursor.close()

        current_app.logger.info(f'Successfully retrieved user {uid} name')
        return jsonify(users), 200
    except Error as e:
        current_app.logger.error(f'Database error in get_all_seekers: {str(e)}')
        return jsonify({"error": str(e)}), 500
    
@lawyers.route("/seeker_info/<uid>", methods=["GET"])
def get_seeker_info(uid):
    try:
        current_app.logger.info('Starting get_all_users request')
        cursor = db.get_db().cursor()

  # Get query parameters for filtering
        role = request.args.get("role")

        # Prepare the Base query
        query = f"SELECT DOB, SEX, CurrentLocation, Citizenship, ApplicantID FROM AsylumSeeker WHERE UserID = {uid}"
    
        current_app.logger.debug(f'Executing query: {query}')
        cursor.execute(query)
        users = cursor.fetchall()
        cursor.close()

        current_app.logger.info(f'Successfully retrieved user {uid} name')
        return jsonify(users), 200
    except Error as e:
        current_app.logger.error(f'Database error in get_all_seekers: {str(e)}')
        return jsonify({"error": str(e)}), 500

@lawyers.route("/legal_aid_applications/<aid>", methods=["PUT"])
def assign_lawyer(aid):
    try:
        current_app.logger.info("Starting assign_lawyer request")
        data = request.get_json()
        current_app.logger.info(f"Data received: {data}")

        lawyer = data.get("AssignedLawyer")
        if not lawyer:
            return jsonify({"error": "AssignedLawyer is required"}), 400

        cursor = db.get_db().cursor()

        # Check if the asylum seeker exists
        query = "SELECT * FROM AsylumSeeker WHERE ApplicantID = %s"
        cursor.execute(query, (aid,))
        asylum_seeker = cursor.fetchone()
        if not asylum_seeker:
            return jsonify({"error": "AsylumSeeker not found"}), 404

        # Update the assigned lawyer
        update_query = "UPDATE AsylumSeeker SET AssignedLawyer = %s WHERE ApplicantID = %s"
        cursor.execute(update_query, (lawyer, aid))
        
        query = f"SELECT AidDescription, SubmissionDate, ApplicationID FROM LegalAidApplication WHERE ApplicantID = {aid}"
        current_app.logger.debug(f'Executing query: {query}')
        cursor.execute(query)
        applications = cursor.fetchall()
        
        for app in applications:
            app_id = app["ApplicationID"]
            update_query = f"UPDATE LegalAidApplication SET IsActive = 0 WHERE ApplicationID = {app_id}"
            cursor.execute(update_query)
            
        db.get_db().commit()
        cursor.close()

        current_app.logger.info(f"Successfully assigned lawyer {lawyer} to seeker {aid}")
        return jsonify({"message": "AsylumSeeker updated successfully"}), 200

    except Exception as e:
        current_app.logger.error(f"Error in assign_lawyer: {str(e)}")
        return jsonify({"error": str(e)}), 500

    
@lawyers.route("/<int:uid>", methods = ["GET"])
def get_lawyer_by_user_id(uid):
    try:
        current_app.logger.info('Starting get_lawyer_by_user_id request')
        cursor = db.get_db().cursor()

        query = f"SELECT LawyerID FROM Lawyer WHERE UserID = {uid}"
    
        current_app.logger.debug(f'Executing query: {query}')
        cursor.execute(query)
        lawyer_id = cursor.fetchone()
        cursor.close()

        current_app.logger.info(f'Successfully retrieved user {uid} name')
        return jsonify(lawyer_id), 200
    except Error as e:
        current_app.logger.error(f'Database error in get_lawyer_by_user_id: {str(e)}')
        return jsonify({"error": str(e)}), 500
    
    
@lawyers.route("/fundreq", methods=["POST"])
def make_request():
    try:
        data = request.get_json()

        title = data.get("FundRequestTitle")
        desc = data.get("FundDesc")
        amount = data.get("FundAmt")
        email = data.get("LawyerEmail")

        if not all([title, desc, amount, email]):
            return jsonify({"error": "Missing required fields"}), 400

        cursor = db.get_db().cursor()
        query = """
            INSERT INTO FundApp (FundRequestTitle, FundDesc, FundAmt, LawyerEmail)
            VALUES (%s, %s, %s, %s)
        """
        cursor.execute(query, (title, desc, amount, email))
        db.get_db().commit()
        
        app_id = cursor.lastrowid
        cursor.close()

        return jsonify({"message": "Funding request submitted successfully", "AppID": app_id}), 201

    except Error as e:
        return jsonify({"error": str(e)}), 500

    
@lawyers.route("/fundreq/<int:AppID>", methods=["GET"])
def get_fund_request(AppID):
    try:
        current_app.logger.info(f"Fetching fund request {AppID}")
        cursor = db.get_db().cursor()

        query = """
            SELECT AppID, FundRequestTitle, FundDesc, FundAmt, 
                   LawyerEmail, FundStatus
            FROM FundApp
            WHERE AppID = %s
        """
        cursor.execute(query, (AppID,))
        record = cursor.fetchone()
        cursor.close()

        if not record:
            return jsonify({"error": "Request not found"}), 404

        return jsonify(record), 200

    except Error as e:
        current_app.logger.error(f"DB error in get_fund_request: {str(e)}")
        return jsonify({"error": str(e)}), 500
    
    
    
@lawyers.route("/case_assignments/<lid>", methods=["GET"])
def get_case_assignment(lid):
    try:
        # call sql to get the weight vector table, this also has teh column names
        current_app.logger.info('Starting get_lawyer_assignment request')
        cursor = db.get_db().cursor()
        # Prepare the Base query
        query = f"SELECT * FROM AsylumSeeker WHERE AssignedLawyer = {lid}"
        cursor.execute(query)
        applicants = cursor.fetchall()
        current_app.logger.info(f'Applicant {applicants}')
        all_info = []
        for applicant in applicants:
            user_id = applicant["UserID"]
            current_app.logger.info(f'Applicant {applicant}')
            if user_id:
                query = f"SELECT * FROM User WHERE UserID = {user_id}"
                cursor.execute(query)
                lawyer_table_info = cursor.fetchone()
                luid = lawyer_table_info["UserID"]
            
                query = f"SELECT FirstName, LastName, Email FROM User WHERE UserID = {luid}"
                cursor.execute(query)
                user_table_info = cursor.fetchone()
                
                country_id = applicant["Citizenship"]
                query = f"SELECT CountryName FROM Country WHERE CountryID = {country_id}"
                cursor.execute(query)
                citizenship = cursor.fetchone()
                
                country_id = applicant["CurrentLocation"]
                query = f"SELECT CountryName FROM Country WHERE CountryID = {country_id}"
                cursor.execute(query)
                current_location = cursor.fetchone()
            
                all_info.append({
                    "FirstName": user_table_info["FirstName"],
                    "LastName": user_table_info["LastName"],
                    "Country of Origin": citizenship["CountryName"],
                    "Current Location": current_location["CountryName"],
                    "Email": user_table_info["Email"],
                    "ApplicantID": applicant["ApplicantID"]
                })
        cursor.close()
        return jsonify(all_info)
    except Error as e:
        current_app.logger.error(f'Database error in get_prediction: {str(e)}')
        return jsonify({"error": str(e)}), 500 