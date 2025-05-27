from flask_login import UserMixin
from app import db

class Users(db.Model, UserMixin):
    __tablename__  = 'user'

    idUser         = db.Column(db.Integer, primary_key=True)
    correoUser     = db.Column(db.String(130), unique=True, nullable=False)
    nameUser       = db.Column(db.String(80), nullable=False)
    passwordUser   = db.Column(db.String(120), nullable=False)
    telefonoUser   = db.Column(db.String(80), nullable=False)
    rolUser        = db.Column(db.String(120), default='cliente', nullable=False)

    # back_populates coincide con Factura.user
    facturas = db.relationship(
        'Factura',
        back_populates='user',
        cascade='all, delete-orphan'
        )
    carrito = db.relationship(
        'Carrito',
        back_populates='usuario',
        cascade='all, delete-orphan'
        )

    def get_id(self):
        return str(self.idUser)
