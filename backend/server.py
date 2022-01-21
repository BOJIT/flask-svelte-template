from flask import Flask, send_from_directory
import os
import api

app = Flask(__name__)

#------------------------------------------------------------------------------#

@app.route("/api/ping")
def ping():
	return api.ping()

#------------------------------------------------------------------------------#

def getConfig(key):
	conf = os.environ.get(key)
	if conf is None:
		raise Exception('Environment Variable "' + key + '" not set!')
	return conf

if __name__ == "__main__":
	# Get environmment variables
	flask_env = getConfig('FLASK_ENV')
	flask_host = getConfig('FLASK_HOST')
	flask_port = getConfig('FLASK_PORT')

	# Run server
	if flask_env == 'development':
		app.run(debug=True, host=flask_host, port=flask_port)
	else:
		app.run(host=flask_host, port=flask_port)
