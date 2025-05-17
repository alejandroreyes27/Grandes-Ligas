import os
import secrets
from dotenv import load_dotenv
load_dotenv()

class Config:
    DB_USER = os.getenv("DB_USER")
 
    #SQLALCHEMY_DATABASE_URI = 'sqlite:///flaskdb.sqlite'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = secrets.token_urlsafe(24)
    print(DB_USER)
    SQLALCHEMY_DATABASE_URI = f"mysql+pymysql://{DB_USER}:Seyerreyes27_@isladigital.xyz:3311/alejandrobd"
    #SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://usuario:contaseña@85.239.241.150:3306/alejandrobd'

#Comandos para descargar en instalar todas las librerias offline
#python ñ
#pip install --no-index --find-links=librerias -r requirements.txt