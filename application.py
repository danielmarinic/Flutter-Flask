from flask import Flask
from flask import jsonify

app = Flask(__name__)

@app.route("/contacts")
def contacts():
	users = [
				{"fullname": "Daniel Marinič", "email": "daniel.marinic@gmail.com"},
				{"fullname": "Peter Stašák", "email": "peter.stasak@example.com"},
				{"fullname": "Zuzana Čaputová", "email": "zuzana.caputova@example.com"},
				{"fullname": "Jozef Golonka", "email": "jozef.golonka@example.com"}
			]
	return jsonify([user for user in users])