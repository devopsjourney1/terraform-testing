from flask import Flask, json
import socket

app = Flask(__name__)

@app.route("/")
def hello_world():
    return f"Hello, World! Served from {socket.gethostname()}"

@app.route("/bad")
def bad_page():
    errorcode = 404
    data = {'error': errorcode}
    response = app.response_class(
        response=json.dumps(data),
        status=errorcode,
        mimetype='application/json'
    )
    return response
