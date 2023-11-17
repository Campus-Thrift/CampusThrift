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
    __tablename__ = "posts"
    id = db.Column(db.Integer,primary_key = True,autoincrement = True)
    username = db.Column(db.String,nullable = False)
    timestamp = db.Column(db.Integer,nullable = False)
    photo = db.Column(db.LargeBinary,nullable = False)
    title = db.Column(db.String,nullable = False)
    description = db.Column(db.String,nullable = False)
    price = db.Column(db.Integer,nullable = False)
    user_id_post = db.Column(db.Integer,db.ForeignKey("users.id"),nullable =False)
    user_id_buy = db.Column(db.Intger,db.ForeignKey("users.id"),nullable = False)
    
    def __init__(self,**kwargs):
        self.username = kwargs.get("username")
        self.timestamp = int(kwargs.get("timestamp"))
        self.photo = kwargs.get("photo")
        self.title = kwargs.get("title")
        self.description = kwargs.get("description")
        self.price = int(kwargs.get("price"))
        self.user_id_post = kwargs.get("user_id_post")
        self.user_id_buy = kwargs.get("user_id_buy",-1)
        
    def serialize(self):
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