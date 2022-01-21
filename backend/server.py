from flask import Flask, send_from_directory
import os

import random

app = Flask(__name__)

#------------------------------------------------------------------------------#

# Path for our main Svelte page
@app.route("/")
def base():
	return send_from_directory('../dist', 'index.html')

# Path for all the static files (compiled JS/CSS, etc.)
@app.route("/<path:path>")
def home(path):
	return send_from_directory('../dist', path)


@app.route("/rand")
def hello():
	return str(random.randint(0, 100))

#------------------------------------------------------------------------------#

if __name__ == "__main__":
	flask_env = os.environ.get['FLASK_ENV']
	flask_host = os.envrion.get['FLASK_HOST']
	flask_port = os.environ.get['FLASK_PORT']
	if flask_env == 'development':
		app.run(debug=True, host=flask_host, port=flask_port)
	else:
		app.run(host=flask_host, port=flask_port)
