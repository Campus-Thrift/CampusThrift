from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# association tables
follow = db.Table (
    "follow",
    db.Model.metadata,
    db.Column("follower_id", db.Integer, db.ForeignKey("user.id")),
    db.Column("followed_id", db.Integer, db.ForeignKey("user.id"))
)

likes_association_table = db.Table (
    "likes_association_table",
    db.Model.metadata,
    db.Column("post_id",db.Integer,db.ForeignKey("post.id")),
    db.Column("user_id",db.Integer,db.ForeignKey("user.id"))
)

cart_association_table = db.Table (
    "cart_association_table",
    db.Model.metadata,
    db.Column("user_id",db.Integer,db.ForeignKey("user.id")),
    db.Column("post_id",db.Integer,db.ForeignKey("post.id"))
)

# classes
class User(db.Model):
    """
    User model
    """
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    name = db.Column(db.String, nullable = False)
    netid = db.Column(db.String, nullable = False)
    balance = db.Column(db.Float, nullable = False)
    followers = db.relationship("User",
                                secondary=follow,
                                primaryjoin=(follow.c.followed_id == id),
                                secondaryjoin=(follow.c.follower_id == id),
                                backref="followed_ref",
                                foreign_keys=[follow.c.followed_id, follow.c.follower_id])
    followed = db.relationship("User",
                                secondary=follow,
                                primaryjoin=(follow.c.follower_id == id),
                                secondaryjoin=(follow.c.followed_id == id),
                                backref="followers_ref",
                                foreign_keys=[follow.c.follower_id, follow.c.followed_id])
    liked = db.relationship("Post",
                            secondary = likes_association_table,
                            back_populates = "likes")
    posts = db.relationship("Post",
                            foreign_keys="Post.user_id_post",
                            cascade = "delete")
    cart = db.relationship("Post",
                           secondary=cart_association_table,
                           back_populates = "carted")
    bought = db.relationship("Post",
                             foreign_keys="Post.user_id_buy",
                             cascade = "delete")

    
    def __init__(self, **kwargs):
        """
        Initializes a User object
        """
        self.name = kwargs.get("name", "No name")
        self.netid = kwargs.get("netid", "None")
        self.balance = kwargs.get("balance", 0.0)

    def serialize(self):
        """
        Serializes a User object
        """
        return {
            "id": self.id,
            "name": self.name,
            "netid": self.netid,
            "balance": self.balance,
            "followers": [f.simple_serialize() for f in self.followers],
            "followed": [f.simple_serialize() for f in self.followed],
            "posts": [p.simple_serialize() for p in self.posts],
            "bought": [p.simple_serialize() for p in self.bought],
            "cart": [p.simple_serialize() for p in self.bought],
            "liked": [p.simple_serialize() for p in self.liked]
        }
    
    def simple_serialize(self):
        """
        Serializes a User object without the following and followers field.
        """
        return {
            "id": self.id,
            "name": self.name,
            "netid": self.netid,
            "balance": self.balance
        }


class Post(db.Model):
    """
    Post model
    """
    __tablename__ = "post"
    id = db.Column(db.Integer,primary_key = True,autoincrement = True)
    username = db.Column(db.String,nullable = False)
    timestamp = db.Column(db.Integer,nullable = False)
    photo = db.Column(db.String,nullable = False)
    title = db.Column(db.String,nullable = False)
    description = db.Column(db.String,nullable = False)
    price = db.Column(db.Float,nullable = False)
    likes = db.relationship("User",
                            secondary = likes_association_table,
                            back_populates = "liked")
    user_id_post = db.Column(db.Integer,db.ForeignKey("user.id"),nullable =False)
    carted = db.relationship("User",
                                   secondary = cart_association_table,
                                   back_populates = "cart")
    user_id_buy = db.Column(db.Integer,db.ForeignKey("user.id"),nullable = False)
    
    def __init__(self,**kwargs):
        """
        Initializes a Post object.
        """
        self.username = kwargs.get("username")
        self.timestamp = int(kwargs.get("timestamp"))
        self.photo = kwargs.get("photo")
        self.title = kwargs.get("title")
        self.description = kwargs.get("description")
        self.price = int(kwargs.get("price"))
        self.user_id_post = kwargs.get("user_id_post")
        self.user_id_buy = kwargs.get("user_id_buy",-1)
        
    def serialize(self):
        """
        Serializes a Post object.
        """
        return {
            "id" : self.id,
            "username" : self.username,
            "timestamp" : self.timestamp,
            "photo" : self.photo,
            "title" : self.title,
            "description" : self.description,
            "price" : self.price,
            "user_id_post" : self.user_id_post,
            "user_id_buy" : self.user_id_buy
        }
    
    def simple_serialize(self):
        """
        Serializes a Post object without the user post and buy ids.
        """
        return {
            "id" : self.id,
            "username" : self.username,
            "timestamp" : self.timestamp,
            "photo" : self.photo,
            "title" : self.title,
            "description" : self.description,
            "price" : self.price
        }