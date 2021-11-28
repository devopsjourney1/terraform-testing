from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Our App is working!<br>"

@app.route("/error1")
def error1():
    return "Bad Request!<br>", 400

@app.route("/error2")
def error2():
    return "Server Problem!<br>", 500

