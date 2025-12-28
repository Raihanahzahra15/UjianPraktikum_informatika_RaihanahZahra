from flask import Flask, render_template, request, redirect, url_for, session
from werkzeug.security import check_password_hash
import models

app = Flask(__name__)
app.secret_key = "posyandu_secret"

@app.route('/')
def index():
    if 'login' in session:
        return redirect(url_for('dashboard'))
    return redirect(url_for('login'))


@app.route('/login', methods=['GET','POST'])
def login():
    if request.method == 'POST':
        user = models.get_user(request.form['username'])

        if user and check_password_hash(
            user['password'],
            request.form['password']
        ):
            session['login'] = True
            session['username'] = user['username']
            session['role'] = user['role']
            return redirect(url_for('dashboard'))

    return render_template('login.html')

@app.route('/register', methods=['GET','POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        role = request.form['role']

        # cek username sudah ada
        if models.get_user(username):
            return render_template(
                'register.html',
                error="Username sudah digunakan"
            )

        models.insert_user(username, password,role)
        return redirect(url_for('login'))

    return render_template('register.html')


@app.route('/dashboard')
def dashboard():
    if 'login' not in session:
        return redirect(url_for('login'))

    return render_template(
        'dashboard.html',
        username=session['username'],
        role=session['role']
    )

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))


@app.route('/ibu', methods=['GET','POST'])
def ibu():
    if 'login' not in session:
        return redirect(url_for('login'))

    # PETUGAS BOLEH TAMBAH
    if request.method == 'POST':
        if session['role'] != 'petugas':
            return redirect(url_for('ibu'))

        models.insert_ibu(
            request.form['nama'],
            request.form['umur'],
            request.form['alamat']
        )
        return redirect(url_for('ibu'))

    return render_template('ibu.html', ibu=models.get_ibu())


@app.route('/ibu/edit/<int:id>', methods=['GET','POST'])
def edit_ibu(id):
    if 'login' not in session:
        return redirect(url_for('login'))

    if session['role'] != 'petugas':
        return redirect(url_for('ibu'))

    ibu = models.get_ibu_by_id(id)

    if request.method == 'POST':
        models.update_ibu(
            id,
            request.form['nama'],
            request.form['umur'],
            request.form['alamat']
        )
        return redirect(url_for('ibu'))

    return render_template('edit_ibu.html', ibu=ibu)


@app.route('/ibu/delete/<int:id>')
def delete_ibu(id):
    if 'login' not in session:
        return redirect(url_for('login'))

    if session['role'] != 'petugas':
        return redirect(url_for('ibu'))

    models.delete_ibu(id)
    return redirect(url_for('ibu'))

@app.route('/balita', methods=['GET','POST'])
def balita():
    if 'login' not in session:
        return redirect(url_for('login'))

    if request.method == 'POST':
        if session['role'] != 'petugas':
            return redirect(url_for('balita'))

        models.insert_balita(
            request.form['nama'],
            request.form['tgl'],
            request.form['jk'],
            request.form['ibu']
        )
        return redirect(url_for('balita'))

    return render_template(
        'balita.html',
        balita=models.get_balita(),
        ibu=models.get_ibu()
    )

@app.route('/balita/edit/<int:id>', methods=['GET','POST'])
def edit_balita(id):
    if 'login' not in session:
        return redirect(url_for('login'))

    if session['role'] != 'petugas':
        return redirect(url_for('balita'))

    balita = models.get_balita_by_id(id)

    if request.method == 'POST':
        models.update_balita(
            id,
            request.form['nama'],
            request.form['tgl'],
            request.form['jk'],
            request.form['ibu']
        )
        return redirect(url_for('balita'))

    return render_template(
        'edit_balita.html',
        balita=balita,
        ibu=models.get_ibu()
    )

@app.route('/balita/delete/<int:id>')
def delete_balita(id):
    if 'login' not in session:
        return redirect(url_for('login'))

    if session['role'] != 'petugas':
        return redirect(url_for('balita'))

    models.delete_balita(id)
    return redirect(url_for('balita'))

@app.route('/timbang', methods=['GET','POST'])
def timbang():
    if 'login' not in session:
        return redirect(url_for('login'))

    if request.method == 'POST':
        if session['role'] != 'petugas':
            return redirect(url_for('timbang'))

        models.insert_timbang(
            request.form['balita'],
            request.form['berat'],
            request.form['tinggi'],
            request.form['tanggal']
        )
        return redirect(url_for('timbang'))

    return render_template(
        'timbang.html',
        timbang=models.get_timbang(),
        balita=models.get_balita()
    )

@app.route('/timbang/edit/<int:id>', methods=['GET','POST'])
def edit_timbang(id):
    if 'login' not in session:
        return redirect(url_for('login'))

    if session['role'] != 'petugas':
        return redirect(url_for('timbang'))

    data = models.get_timbang_by_id(id)

    if request.method == 'POST':
        models.update_timbang(
            id,
            request.form['balita'],
            request.form['berat'],
            request.form['tinggi'],
            request.form['tanggal']
        )
        return redirect(url_for('timbang'))

    return render_template(
        'edit_timbang.html',
        data=data,
        balita=models.get_balita()
    )

@app.route('/timbang/delete/<int:id>')
def delete_timbang(id):
    if 'login' not in session:
        return redirect(url_for('login'))

    if session['role'] != 'petugas':
        return redirect(url_for('timbang'))

    models.delete_timbang(id)
    return redirect(url_for('timbang'))

@app.route('/imunisasi', methods=['GET','POST'])
def imunisasi():
    if 'login' not in session:
        return redirect(url_for('login'))

    if request.method == 'POST':
        if session['role'] != 'petugas':
            return redirect(url_for('imunisasi'))

        models.insert_imunisasi(
            request.form['balita'],
            request.form['jenis'],
            request.form['tanggal'],
            request.form['keterangan']
        )
        return redirect(url_for('imunisasi'))

    return render_template(
        'imunisasi.html',
        imunisasi=models.get_imunisasi(),
        balita=models.get_balita()
    )

@app.route('/imunisasi/edit/<int:id>', methods=['GET', 'POST'])
def edit_imunisasi(id):
    if 'login' not in session:
        return redirect(url_for('login'))

    if session['role'] != 'petugas':
        return redirect(url_for('imunisasi'))

    data = models.get_imunisasi_by_id(id)

    if request.method == 'POST':
        models.update_imunisasi(
            id,
            request.form['balita'],
            request.form['jenis'],
            request.form['tanggal'],
            request.form['keterangan']
        )
        return redirect(url_for('imunisasi'))

    return render_template(
        'edit_imunisasi.html',
        data=data,
        balita=models.get_balita()
    )


if __name__ == '__main__':
    app.run(debug=True)
