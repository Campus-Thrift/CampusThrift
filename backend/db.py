from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# association tables


# classes
class User(db.Model):
    """
    User model
    """
    __tablename__ = "users"


class Post(db.Model):
    """
    Post model
    """