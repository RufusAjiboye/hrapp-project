from flask import Flask, request, redirect, render_template, url_for
from flask_sqlalchemy import SQLAlchemy
import traceback
import os
import datetime
import boto3

app = Flask(__name__)
version = "1.7.1"

user = os.environ.get("POSTGRES_USER")
pw = os.environ.get("POSTGRES_PASSWORD")
host = os.environ.get("POSTGRES_HOST")
db = os.environ.get("POSTGRES_DATABASE_NAME")
DB_URL = f"postgresql+psycopg2://{user}:{pw}@{host}/{db}"
print(DB_URL)

app = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = DB_URL
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False


db = SQLAlchemy(app)


client = boto3.client(
    'ses', 
    region_name= os.environ.get("AWS_REGION_NAME"),
    aws_access_key_id = os.environ.get("AWS_ACCESS_NAME"),
    aws_secret_access_key = os.environ.get("AWS_KEY_NAME")
)



class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    firstname = db.Column(db.String, unique=True, nullable=False)
    lastname = db.Column(db.String)
    email = db.Column(db.String)
    password = db.Column(db.String)
    city = db.Column(db.String)
    

with app.app_context():
    #db.drop_all()
    db.create_all()


@app.route('/')
def index():
    user = User.query.all() 
    return render_template('index.html', user=user, gmt_dt=datetime.datetime.utcnow())

@app.route('/add')
def add():
    return render_template('/user/create.html')

@app.route("/user", methods=["GET", "POST"])
def user_create():
    print (" savvy {} {} {} {} {}".format(
        request.form["firstname"], 
        request.form["lastname"], 
        request.form["password"], 
        request.form["city"],
        request.form["email"]))
    if request.method == "POST":
        user = User(
            firstname=request.form["firstname"],
            lastname=request.form["lastname"],
            email=request.form["email"],
            password=request.form["password"],
            city=request.form["city"]
        )
        db.session.add(user)
        db.session.commit()
        response = client.send_email(
        Destination={
            'ToAddresses': [os.environ.get("TO_ADDRESS")]
        },
        Message={
            'Body': {
                'Text': {
                    'Charset': 'UTF-8',
                    'Data': " Congratulations! Account sucessfully created For {} with email address {}".format(
                        request.form["firstname"].upper(),request.form["email"].upper()
                    ),
                },
            },
            'Subject': {
                'Charset': 'UTF-8',
                'Data': 'Account Creation',
            },
        },
        Source=os.environ.get("SOURCE_ADDRESS"),
        )
        return redirect(url_for("index"))

    return render_template("user/create.html", )

@app.route("/about")
def about():
    return render_template("user/about.html")
    

@app.route("/user/<int:id>/delete", methods=["GET", "POST"])
def user_delete(id):
    user = User.query.filter_by(id=id).all()
    if request.method == "POST":
        db.session.delete(user)
        db.session.commit()
        return redirect(url_for("user_list"))

@app.route("/user/<int:id>")
def user_detail(id):
    user = User.query.filter_by(id=id).all()
    return render_template("user/detail.html", user=user)
