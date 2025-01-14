from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_jwt_extended import JWTManager, create_access_token, jwt_required, get_jwt_identity
from flask_swagger_ui import get_swaggerui_blueprint
from datetime import timedelta
import logging

app = Flask(__name__)

# JWT Configuration
app.config["JWT_SECRET_KEY"] = "secretKey"
app.config["JWT_ACCESS_TOKEN_EXPIRES"] = timedelta(hours=1)
jwt = JWTManager(app)

# Database Configuration
app.config['SQLALCHEMY_DATABASE_URI'] = 'mssql+pyodbc://LAyres:RknT369+@dist-6-505.uopnet.plymouth.ac.uk/COMP2001_LAyres?driver=ODBC+Driver+17+for+SQL+Server'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Logging Configuration
logging.basicConfig(level=logging.DEBUG)

# Swagger Configuration
SWAGGER_URL = '/swagger'
API_URL = '/static/swagger.json'
swaggerui_blueprint = get_swaggerui_blueprint(SWAGGER_URL, API_URL)
app.register_blueprint(swaggerui_blueprint, url_prefix=SWAGGER_URL)

# User Model
class User(db.Model):
    __tablename__ = 'USER'
    __table_args__ = {'schema': 'CW2'}
    UserID = db.Column(db.Integer, primary_key=True)
    Email_address = db.Column(db.String(255), unique=True, nullable=False)
    Role = db.Column(db.String(100), nullable=False)

# Trail Model
class Trail(db.Model):
    __tablename__ = 'TRAIL'
    __table_args__ = {'schema': 'CW2'}
    TrailID = db.Column(db.Integer, primary_key=True)
    TrailName = db.Column(db.String(255), nullable=False)
    TrailSummary = db.Column(db.Text)
    TrailDescription = db.Column(db.Text)
    Difficulty = db.Column(db.String(50), nullable=False)
    Location = db.Column(db.String(255))
    Length = db.Column(db.Float)
    ElevationGain = db.Column(db.Float)
    RouteType = db.Column(db.String(50))
    OwnerID = db.Column(db.Integer, db.ForeignKey('CW2.USER.UserID'), nullable=False)
    Created_On = db.Column(db.DateTime, default=db.func.now())

# Authentication Route
@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    user = User.query.filter_by(Email_address=email).first()

    if user != 'user' or password != 'password':
        return jsonify({"msg": "Invalid credentials"}), 401

    access_token = create_access_token(identity=user.UserID)
    return jsonify({"access_token": access_token}), 200

# Get all Users
@app.route('/users', methods=['GET'])
@jwt_required()
def get_users():
    users = User.query.all()
    return jsonify([{"UserID": user.UserID, "Email_address": user.Email_address, "Role": user.Role} for user in users])

# Create a new User
@app.route('/users', methods=['POST'])
@jwt_required()
def create_user():
    data = request.get_json()
    email = data.get('Email_address')
    role = data.get('Role')
    user = User(Email_address=email, Role=role)
    db.session.add(user)
    db.session.commit()
    return jsonify({"msg": "User created successfully"}), 201

# Get all Trails
@app.route('/trails', methods=['GET'])
@jwt_required()
def get_trails():
    trails = Trail.query.all()
    return jsonify([{"TrailID": trail.TrailID, "TrailName": trail.TrailName, "TrailSummary": trail.TrailSummary, "Difficulty": trail.Difficulty} for trail in trails])

# Create a new Trail
@app.route('/trails', methods=['POST'])
@jwt_required()
def create_trail():
    data = request.get_json()
    trail = Trail(
        TrailName=data['TrailName'],
        TrailSummary=data['TrailSummary'],
        TrailDescription=data['TrailDescription'],
        Difficulty=data['Difficulty'],
        Location=data.get('Location'),
        Length=data.get('Length'),
        ElevationGain=data.get('ElevationGain'),
        RouteType=data.get('RouteType'),
        OwnerID=data['OwnerID']
    )
    db.session.add(trail)
    db.session.commit()
    return jsonify({"msg": "Trail created successfully"}), 201

if __name__ == "__main__":
    app.run(debug=True)
