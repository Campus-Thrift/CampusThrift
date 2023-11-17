import json

from db import db
from flask import Flask,request
import os
from db import Post
from db import User

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

@app.route("/api/post/")
def get_all_post():
    posts = [post.serialize() for post in Post.query.all()]
    return success_response({"Posts":posts})

@app.route("/api/post/<int:user_id>/create", methods = ["POST"])
def create_post(user_id):
    user = User.query.filter_by(id=user_id)
    if user is None:
        return failure_response("user not found")
    body = json.loads(request.data)
    username = body.get("username")
    timestamp = body.get("timestamp")
    photo = body.get("photo")
    title = body.get("title")
    description = body.get("decription")
    price = body.get("price")
    if (username is None) or (timestamp is None) or (photo is None) or (title is None) or (description is None) or (price is None):
        return failure_response("missing information")
    user_id_post = user_id
    user_id_buy = -1
    new_post = Post(
        username = username,
        timestamp = timestamp,
        photo = photo,
        title = title,
        description = description,
        price = price,
        user_id_post = user_id_post,
        user_id_buy = user_id_buy
    )
    db.session.add(new_post)
    db.session.commit()
    return success_response(new_post.serialize(),201)

@app.route("/api/post/<int:post_id>/")
def get_post_by_id(post_id):
    post = Post.query.filter_by(id = post_id).first()
    if post is None:
        return failure_response("post not found")
    return success_response(post.serialize())

@app.route("/api/post/<int:post_id>/<int:user_id>/",methods= ["DELETE"])
def delete_post_by_id(post_id,user_id):
    post = Post.query.filter_by(id = post_id).first()
    if post is None:
        return failure_response("post not found")
    if post.user_id_post == user_id:
        #delete
        db.session.delete(post)
        db.session.commit()
        return success_response(post.serialize())
    return failure_response("can not delete other's post")
    
@app.route("/api/post/<int:post_id>/<int:buyer_id>/buy")
def buy_post(post_id,buyer_id):
    buyer = User.query.filter_by(id = buyer_id).first()
    if buyer is None:
        return failure_response("buyer not found")
    post = Post.query.filter_by(id = post_id).first()
    if post is None:
        return failure_response("post not found")
    #find the user who post the post
    poster_id = post.user_id_post
    poster = User.query.filter_by(id = poster_id).first()
    if poster is None:
        return failure_response("poster not found")
    if buyer.balance < post.price:
        return failure_response("not enough balance")
    post.user_id_buy = buyer_id
    buyer.balance = buyer.balance - post.price
    poster.balance = poster.balance + post.price
    buyer.bought.append(post)
    db.session.commit()
    return success_response(post.serialize())

@app.route("/api/post/<int:post_id>/<int:user_id>/like")
def like_post(post_id,user_id):
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return failure_response("user not found")
    post = Post.query.filter_by(id = post_id).first()
    if post is None:
        return failure_response("post not found")
    user.liked.append(post)
    post.likes.append(user)
    db.session.commit()
    return success_response(user.serialize())

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
