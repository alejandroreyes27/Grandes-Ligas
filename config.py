import os
import secrets

class Config:

    DB_USER = os.environ.get('DB_USER')
    DB_PASS = os.environ.get('DB_PASS')

    SQLALCHEMY_DATABASE_URI = (
            f"mysql+pymysql://{DB_USER}:{DB_PASS}@"
        )
    
    #SQLALCHEMY_DATABASE_URI = 'sqlite:///flaskdb.sqlite'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = secrets.token_urlsafe(24)
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://{DB_USER}:{DB_PASS}@isladigital.xyz:3311/alejandrobd'
    #SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://usuario:contaseña@85.239.241.150:3306/alejandrobd'