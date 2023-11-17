import json

from db import *
from flask import Flask, request
import os

# define db filename
db_filename = "todo.db"
app = Flask(__name__)

# setup config
app.config["SQLALCHEMY_DATABASE_URI"] = f"sqlite:///{db_filename}"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

# initialize app
db.init_app(app)
with app.app_context():
    db.create_all()


# generalized response formats
def success_response(data, code=200):
    return json.dumps(data), code


def failure_response(message, code=404):
    return json.dumps({"error": message}), code

# routes
@app.route("/")
@app.route("/api/")

# routes for users
@app.route("/api/users/")
def get_users():
    """
    Endpoint for getting all users
    """
    users = [user.serialize() for user in User.query.all()]
    return success_response({"users": users}, 200)

@app.route("/api/users/", methods = ["POST"])
def create_user():
    """
    Endpoint for creating a new user
    """
    body = json.loads(request.data)
    name = body.get("name")
    netid = body.get("netid")
    balance = body.get("balance", 0.0)
    if (name is None) or (netid is None):
        return failure_response("Invalid name or netid.", 400)
    new_user = User(name = name, netid = netid, balance = balance)
    db.session.add(new_user)
    db.session.commit()
    return success_response(new_user.serialize(), 201)

@app.route("/api/users/<int:user_id>/")
def get_user(user_id):
    """
    Endpoint for getting a user by id
    """
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return failure_response("User not found.")
    return success_response(user.serialize())

@app.route("/api/users/<int:user_id>/")
def update_user(user_id):
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return failure_response("User not found.")
    body = json.loads(request.data)
    name = body.get("name", user.name)
    balance = body.get("balance", user.balance)
    user.name = name
    user.balance = balance
    db.session.commit()
    return success_response(user.serialize())

@app.route("/api/users/<int:user_id>/", methods = ["DELETE"])
def delete_user(user_id):
    """
    Endpoint for deleting a user by id
    """
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return failure_response("User not found.")
    db.session.delete(user)
    db.session.commit()
    return success_response(user.serialize())

@app.route("/api/users/<int:user_id>/follow/", methods = ["POST"])
def follow_user(user_id):
    """
    Endpoint for following a user
    """
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return failure_response("User not found.")
    body = json.loads(request.data)
    follow_user_id = body.get("user_id")
    if follow_user_id is None:
        return failure_response("Invalid following user_id.", 400)
    follow_user = User.query.filter_by(id = follow_user_id).first()
    if follow_user is None:
        return failure_response("Following user not found.")
    user.followed.append(follow_user)
    db.session.commit()
    return success_response(user.serialize())

@app.route("/api/users/<int:user_id>/unfollow/", methods = ["POST"])
def unfollow_user(user_id):
    """
    Endpoint for unfollowing a user
    """
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return failure_response("User not found.")
    body = json.loads(request.data)
    follow_user_id = body.get("user_id")
    if follow_user_id is None:
        return failure_response("Invalid following user_id.", 400)
    follow_user = User.query.filter_by(id = follow_user_id).first()
    if follow_user is None:
        return failure_response("Following user not found.")
    if follow_user not in  user.followed:
        return failure_response("Following user not followed.", 400)
    user.followed.remove(follow_user)
    db.session.commit()
    return success_response(user.serialize())

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
