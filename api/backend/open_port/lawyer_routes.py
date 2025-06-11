
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
        query = f"SELECT * FROM LegalAidApplication WHERE AidDescription = '{aid_type}'"
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
    
# @lawyers.route("/legal_aid_applications/<aid>", methods = ["PUT"])
# def assign_lawyer(aid):
#     try:
#         current_app.logger.info('Starting assign_lawywer request')
#         data = request.get_json()
#         current_app.logger.info(f'Data: {data}')
#         cursor = db.get_db().cursor()
        
#         lawyer = request.args.get("AssignedLawyer")
#         current_app.logger.info(f'Lawyer: {lawyer}')

#         query = f"SELECT * FROM AsylumSeeker WHERE ApplicantID = {aid}"
    
#         current_app.logger.debug(f'Executing query: {query}')
#         cursor.execute(query)
#         asylum_seeker = cursor.fetchone()
#         if not asylum_seeker:
#              return jsonify({"error": "AsylumSeeker not found"}), 404
         
#         current_app.logger.info(f'AsylumSeeker Found: {asylum_seeker}')
         
#         update_fields = []
#         params = []
#         allowed_fields = ["AssignedLawyer"]
        
#         for field in allowed_fields:
#             current_app.logger.info(f'Field: {field}')
#             if field in data:
#                 update_fields.append(f"{field} = %s")
#                 params.append(data[field])
                
#         if not update_fields:
#              return jsonify({"error": "No valid fields to update"}), 400
         
#         params.append(aid)
#         query = f"UPDATE AsylumSeeker SET {', '.join(update_fields)} WHERE ApplicantID = %s"

#         cursor.execute(query, params)
#         db.get_db().commit()
#         cursor.close()

#         current_app.logger.info(f'Successfully retrieved user {aid} name')
#         return jsonify({"message": "AsylumSeeker updated successfully"}), 200
#     except Error as e:
#         current_app.logger.error(f'Database error in get_all_seekers: {str(e)}')
#         return jsonify({"error": str(e)}), 500

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
        db.get_db().commit()
        cursor.close()

        current_app.logger.info(f"Successfully assigned lawyer {lawyer} to seeker {aid}")
        return jsonify({"message": "AsylumSeeker updated successfully"}), 200

    except Exception as e:
        current_app.logger.error(f"Error in assign_lawyer: {str(e)}")
        return jsonify({"error": str(e)}), 500

    
@lawyers.route("/lawyers/<int:uid>", methods = ["GET"])
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
    
    
    
    
# # Update an existing NGO's information
# # Can update any field except NGO_ID
# # Example: PUT /ngo/ngos/1 with JSON body containing fields to update
# @ngos.route("/ngos/<int:ngo_id>", methods=["PUT"])
# def update_ngo(ngo_id):
#     try:
#         data = request.get_json()

#         # Check if NGO exists
#         cursor = db.get_db().cursor()
#         cursor.execute("SELECT * FROM WorldNGOs WHERE NGO_ID = %s", (ngo_id,))
#         if not cursor.fetchone():
#             return jsonify({"error": "NGO not found"}), 404

#         # Build update query dynamically based on provided fields
#         update_fields = []
#         params = []
#         allowed_fields = ["AssignedLawyer"]

#         for field in allowed_fields:
#             if field in data:
#                 update_fields.append(f"{field} = %s")
#                 params.append(data[field])

#         if not update_fields:
#             return jsonify({"error": "No valid fields to update"}), 400

#         params.append(ngo_id)
#         query = f"UPDATE WorldNGOs SET {', '.join(update_fields)} WHERE NGO_ID = %s"

#         cursor.execute(query, params)
#         db.get_db().commit()
#         cursor.close()

#         return jsonify({"message": "NGO updated successfully"}), 200
#     except Error as e:
#         return jsonify({"error": str(e)}), 500