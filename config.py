import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    # Desactiva warnings de SQLAlchemy
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    # Clave secreta
    SECRET_KEY = os.environ.get("SECRET_KEY") or os.urandom(24)

    # Variables de entorno
    DB_USER = os.environ.get("DB_USER")
    DB_PASS = os.environ.get("DB_PASS")
    DB_HOST = os.environ.get("DB_HOST", "isladigital.xyz")
    DB_PORT = os.environ.get("DB_PORT", "3311")
    DB_NAME = os.environ.get("DB_NAME", "alejandrobd")

    # ÚNICA URI — ¡ASEGÚRATE de usar paréntesis () y la f‑string completa!
    SQLALCHEMY_DATABASE_URI = (
        f"mysql+pymysql://{DB_USER}:{DB_PASS}"
        f"@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    )
