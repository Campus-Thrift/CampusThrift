from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# association tables
following_association_table = db.Table (
    "following",
    db.Model.metadata,
    db.Column("user_id", db.Integer, db.ForeignKey("user.id")),
    db.Column("user_id", db.Integer, db.ForeignKey("user.id"))
)

followers_association_table = db.Table (
    "following",
    db.Model.metadata,
    db.Column("user_id", db.Integer, db.ForeignKey("course.id")),
    db.Column("user_id", db.Integer, db.ForeignKey("course.id"))
)

# classes
class User(db.Model):
    """
    User model
    """
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key = True, autoIncrement = True)
    name = db.Column(db.String, nullable = False)
    netid = db.Column(db.String, nullable = False)
    following = db.relationship("User", secondary = following_association_table, back_populates = "followers")
    followers = db.relationship("User", secondary = followers_association_table, back_populates = "followers")
    
    def __init__(self, **kwargs):
        """
        Initializes a User object
        """
        self.name = kwargs.get("name", "No name")
        self.netid = kwargs.get("netid", "None")

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "netid": self.netid,
            "following": [f.simple_serialize() for f in self.following],
            "followers": [f.simple_serialize() for f in self.followers]
        }
    
    def simple_serialize(self):
        """
        Serializes a User object without the following and followers field
        """
        return {
            "id": self.id,
            "name": self.name,
            "netid": self.netid
        }


class Post(db.Model):
    """
    Post model
    """