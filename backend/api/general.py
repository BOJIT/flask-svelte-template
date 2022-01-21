from flask import jsonify

def ping():
	return jsonify({"ping": "pong!"})
