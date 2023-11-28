import json

from db import *
from flask import Flask,request
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

@app.route("/api/users/<int:user_id>/", methods = ["POST"])
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
    return success_response(user.serialize(),201)

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
    return success_response(user.serialize(),201)

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
    return success_response(user.serialize(),201)

@app.route("/api/users/<int:user_id>/cart/")
def get_cart(user_id):
    """
    Endpoint for getting all posts in a user's cart
    """
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return failure_response("User not found.")
    cart = [post.simple_serialize() for post in user.cart]
    return success_response({"Cart":cart})

@app.route("/api/users/<int:user_id>/cart/<int:post_id>/", methods = ["DELETE"])
def remove_from_cart(user_id, post_id):
    """
    Endpoint for removing a post from a user's cart
    """
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return failure_response("User not found.")
    post = Post.query.filter_by(id=post_id)
    if post is None:
        return failure_response("Post not found.")
    if post not in user.cart:
        return failure_response("Post not in cart.", 400)
    user.cart.remove(post)
    return success_response({"Cart":[post.simple_serialize() for post in user.cart]})

@app.route("/api/posts/")
def get_all_post():
    """
    Endpoint for getting all posts.
    """
    posts = [post.serialize() for post in Post.query.all()]
    return success_response({"Posts":posts})

@app.route("/api/posts/<int:user_id>/create/", methods = ["POST"])
def create_post(user_id):
    """
    Endpoint for creating a post.
    """
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("user not found")
    body = json.loads(request.data)
    username = body.get("username")
    timestamp = body.get("timestamp")
    photo = body.get("photo")
    title = body.get("title")
    description = body.get("description")
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

@app.route("/api/posts/<int:post_id>/")
def get_post_by_id(post_id):
    """
    Endpoint for getting a post by its id
    """
    post = Post.query.filter_by(id = post_id).first()
    if post is None:
        return failure_response("post not found")
    return success_response(post.serialize())

@app.route("/api/posts/<int:post_id>/<int:user_id>/",methods= ["DELETE"])
def delete_post_by_id(post_id,user_id):
    """
    Endpoint for deleting a post
    """
    post = Post.query.filter_by(id = post_id).first()
    if post is None:
        return failure_response("post not found")
    if post.user_id_post == user_id:
        #delete
        db.session.delete(post)
        db.session.commit()
        return success_response(post.serialize())
    return failure_response("can not delete other's post")
    
@app.route("/api/posts/<int:post_id>/<int:buyer_id>/buy/", methods = ["POST"])
def buy_post(post_id,buyer_id):
    """
    Endpoint for buying a post.
    """
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
    if poster_id == buyer_id:
        return failure_response("cannot buy your own item")
    if buyer.balance < post.price:
        return failure_response("not enough balance")
    post.user_id_buy = buyer_id
    buyer.balance = buyer.balance - post.price
    poster.balance = poster.balance + post.price
    buyer.bought.append(post)
    db.session.commit()
    return success_response(post.serialize(),201)

@app.route("/api/posts/<int:post_id>/<int:user_id>/update/",methods = ["POST"])
def update_post(post_id,user_id):
    """
    Endpoint for updating a post.
    """
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return failure_response("user not found")
    post = Post.query.filter_by(id=post_id).first()
    if post is None:
        return failure_response("post not found")
    if post.user_id_post != user_id:
        return failure_response("cannot update other's post")
    body = json.loads(request.data)
    username = body.get("username")
    timestamp = body.get("timestamp")
    photo = body.get("photo")
    title = body.get("title")
    description = body.get("description")
    price = body.get("price")
    if (username is None) or (timestamp is None) or (photo is None) or (title is None) or (description is None) or (price is None):
        return failure_response("missing information")
    user_id_post = user_id
    user_id_buy = -1
    post.username = username,
    post.timestamp = timestamp,
    post.photo = photo,
    post.title = title,
    post.description = description,
    post.price = price,
    post.user_id_post = user_id_post,
    post.user_id_buy = user_id_buy
    db.session.commit()
    return success_response(post.serialize(),201)

@app.route("/api/posts/<int:post_id>/<int:user_id>/like/", methods = ["POST"])
def like_post(post_id,user_id):
    """
    Endpoint for a user liking a post.
    """
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return failure_response("user not found")
    post = Post.query.filter_by(id = post_id).first()
    if post is None:
        return failure_response("post not found")
    user.liked.append(post)
    db.session.commit()
    return success_response(user.serialize(),201)

@app.route("/api/posts/<int:post_id>/<int:user_id>/addtocart/", methods = ["POST"])
def add_post_to_cart(post_id, user_id):
    """
    Endpoint for adding a post to a user's cart
    """
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return failure_response("User not found.")
    post = Post.query.filter_by(id = post_id).first()
    if post is None:
        return failure_response("Post not found.")
    if post in user.posts:
        return failure_response("Cannot add your own post to your cart.", 400)
    if post in user.cart:
        return failure_response("Post already in cart.", 400)
    user.cart.append(post)
    db.session.commit()
    return success_response({"Cart":[post.simple_serialize() for post in user.cart]})

@app.route("/api/posts/<int:post_id>/checkstatus/")
def check_post_status(post_id):
    post = Post.query.filter_by(id=post_id).first()
    if post is None:
        return failure_response("Post not found")
    if post.user_id_buy == -1:
        return success_response("post unbought")
    else:
        return success_response("post bought")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
