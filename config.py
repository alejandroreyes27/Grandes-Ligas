import os
import secrets

DB_USER = os.environ.get('DB_USER')
DB_PASS = os.environ.get('DB_PASS')

class Config:
    #SQLALCHEMY_DATABASE_URI = 'sqlite:///flaskdb.sqlite'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = secrets.token_urlsafe(24)
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://{USUARIO}:{PASS}@isladigital.xyz:3311/alejandrobd'
    #SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://$usuario:$contaseña@85.239.241.150:3306/alejandrobd'

#Comandos para descargar en instalar todas las librerias offline
#python ñ
#pip install --no-index --find-links=librerias -r requirements.txt