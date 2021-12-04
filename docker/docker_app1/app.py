from flask import Flask, json

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p><br>"

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