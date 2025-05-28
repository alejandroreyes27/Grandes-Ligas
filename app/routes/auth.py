from flask import Blueprint, render_template, redirect, url_for, request, flash
from flask_login import login_user, logout_user, login_required, current_user
from app.models.users import Users
from app import db
from werkzeug.security import generate_password_hash, check_password_hash

bp = Blueprint('auth', __name__)

@bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        correoUser = request.form['correoUser']
        passwordUser = request.form['passwordUser']

        user = Users.query.filter_by(correoUser=correoUser).first()

        if user and check_password_hash(user.passwordUser, passwordUser):
            login_user(user)
            flash("¡Inicio de sesión exitoso!", "success")
            if user.rolUser == 'administrador':
                return redirect(url_for('productos.index'))
            else:
                return redirect(url_for('productos.index'))

        
        flash('Credenciales no válidas. Por favor, inténtelo de nuevo.', 'danger')
    
    if current_user.is_authenticated:
        return redirect(url_for('auth.dashboard'))
    return render_template("login/login.html")

@bp.route('/logout')
@login_required
def logout():
    logout_user()
    flash('Se ha cerrado la sesión.', 'info')
    return redirect(url_for('auth.login'))

@bp.route('/dashboard')
@login_required
def dashboard():
    if current_user.rolUser == 'administrador':
        data_user = Users.query.all()
        return render_template('login/index.html',data_user=data_user)
    else:
        return redirect(url_for('productos.index'))
    
@bp.route('/auth/add', methods=['GET', 'POST'])
def add():
    if request.method == 'POST':
        correoUser = request.form['correoUser']
        nameUser = request.form['nameUser']
        passwordUser = request.form['passwordUser']
        telefonoUser = request.form['telefonoUser']

        # Validar que telefonoUser tenga exactamente 10 dígitos numéricos
        if not (telefonoUser.isdigit() and len(telefonoUser) == 10):
            error_tel = "El número de teléfono debe tener exactamente 10 dígitos numéricos."
            return render_template('login/add.html', error_tel=error_tel, correoUser=correoUser, nameUser=nameUser, telefonoUser=telefonoUser)

        # Verificar si el correo ya está registrado
        existing_user = Users.query.filter_by(correoUser=correoUser).first()
        if existing_user:
            error = "El correo ya está en uso. Por favor, elige otro."
            return render_template('login/add.html', error=error, correoUser=correoUser, nameUser=nameUser, telefonoUser=telefonoUser)

        # Verificar si ya existe algún usuario registrado
        first_user = Users.query.first()
        
        # Si no existe, asignamos el rol de 'administrador'
        if not first_user:
            hashed_password = generate_password_hash(passwordUser, method='pbkdf2:sha256', salt_length=16)
            new_User = Users(correoUser=correoUser, nameUser=nameUser, passwordUser=hashed_password, telefonoUser=telefonoUser, rolUser='administrador')
        else:
            hashed_password = generate_password_hash(passwordUser, method='pbkdf2:sha256', salt_length=16)
            new_User = Users(correoUser=correoUser, nameUser=nameUser, passwordUser=hashed_password, telefonoUser=telefonoUser)
        
        db.session.add(new_User)
        db.session.commit()
        
        return redirect(url_for('auth.login'))

    return render_template('login/add.html')

@bp.route('/auth/edit/<int:id>', methods=['GET', 'POST'])
@login_required
def edit(id):
    user = Users.query.get_or_404(id)

    if request.method == 'POST':
        user.correoUser = request.form['correoUser']
        user.nameUser = request.form['nameUser']
        new_password = request.form.get('passwordUser')
        if new_password:
            user.passwordUser = generate_password_hash(new_password, method='pbkdf2:sha256', salt_length=16)
        user.telefonoUser = request.form['telefonoUser']

        if current_user.idUser == 1 and 'rolUser' in request.form:
            user.rolUser = request.form['rolUser']

        db.session.commit()
        flash('Usuario actualizado correctamente.', 'success')
        if current_user.rolUser == 'administrador':
            return redirect(url_for('productos.index'))
        else:
            return redirect(url_for('auth.logout'))

    return render_template('login/edit.html', user=user, current_user=current_user)

@bp.route('/auth/delete/<int:id>')
def delete(id):
    User = Users.query.get_or_404(id)
    
    db.session.delete(User)
    db.session.commit()

    return redirect(url_for('auth.dashboard'))