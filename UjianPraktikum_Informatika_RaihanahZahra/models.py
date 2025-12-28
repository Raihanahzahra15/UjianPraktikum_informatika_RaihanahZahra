from werkzeug.security import generate_password_hash
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="posyandu_kasihibu"
)

cursor = db.cursor(dictionary=True)

def get_user(username):
    cursor.execute(
        "SELECT * FROM users WHERE username=%s",
        (username,)
    )
    return cursor.fetchone()

def insert_user(username, password, role):
    hashed = generate_password_hash(password)
    cursor.execute(
        "INSERT INTO users (username, password, role) VALUES (%s,%s,%s)",
        (username, hashed, role)
    )
    db.commit()

# ===== IBU =====
def get_ibu():
    cursor.execute("SELECT * FROM ibu")
    return cursor.fetchall()

def get_ibu_by_id(id):
    cursor.execute("SELECT * FROM ibu WHERE id_ibu=%s", (id,))
    return cursor.fetchone()

def insert_ibu(nama, umur, alamat):
    cursor.execute(
        "INSERT INTO ibu (nama_ibu, umur, alamat) VALUES (%s,%s,%s)",
        (nama, umur, alamat)
    )
    db.commit()

def update_ibu(id, nama, umur, alamat):
    cursor.execute("""
        UPDATE ibu SET nama_ibu=%s, umur=%s, alamat=%s
        WHERE id_ibu=%s
    """, (nama, umur, alamat, id))
    db.commit()

def delete_ibu(id):
    cursor.execute("DELETE FROM ibu WHERE id_ibu=%s", (id,))
    db.commit()

# ===== BALITA =====
def get_balita():
    cursor.execute("""
        SELECT balita.*, ibu.nama_ibu
        FROM balita
        JOIN ibu ON balita.id_ibu = ibu.id_ibu
    """)
    return cursor.fetchall()

def get_balita_by_id(id):
    cursor.execute("SELECT * FROM balita WHERE id_balita=%s", (id,))
    return cursor.fetchone()

def insert_balita(nama, tgl, jk, id_ibu):
    cursor.execute("""
        INSERT INTO balita (nama_balita, tanggal_lahir, jenis_kelamin, id_ibu)
        VALUES (%s,%s,%s,%s)
    """, (nama, tgl, jk, id_ibu))
    db.commit()

def update_balita(id, nama, tgl, jk, id_ibu):
    cursor.execute("""
        UPDATE balita SET
        nama_balita=%s,
        tanggal_lahir=%s,
        jenis_kelamin=%s,
        id_ibu=%s
        WHERE id_balita=%s
    """, (nama, tgl, jk, id_ibu, id))
    db.commit()

def delete_balita(id):
    cursor.execute("DELETE FROM balita WHERE id_balita=%s", (id,))
    db.commit()

# ===== PENIMBANGAN =====
def get_timbang():
    cursor.execute("""
        SELECT p.*, b.nama_balita
        FROM penimbangan p
        JOIN balita b ON p.id_balita = b.id_balita
        ORDER BY p.tanggal DESC
    """)
    return cursor.fetchall()

def get_timbang_by_id(id):
    cursor.execute(
        "SELECT * FROM penimbangan WHERE id_timbang=%s",
        (id,)
    )
    return cursor.fetchone()

def insert_timbang(id_balita, berat, tinggi, tanggal):
    cursor.execute("""
        INSERT INTO penimbangan (id_balita, berat, tinggi, tanggal)
        VALUES (%s,%s,%s,%s)
    """, (id_balita, berat, tinggi, tanggal))
    db.commit()

def update_timbang(id, id_balita, berat, tinggi, tanggal):
    cursor.execute("""
        UPDATE penimbangan SET
        id_balita=%s,
        berat=%s,
        tinggi=%s,
        tanggal=%s
        WHERE id_timbang=%s
    """, (id_balita, berat, tinggi, tanggal, id))
    db.commit()

def delete_timbang(id):
    cursor.execute(
        "DELETE FROM penimbangan WHERE id_timbang=%s",
        (id,)
    )
    db.commit()

    # ===== IMUNISASI =====
def get_imunisasi():
    cursor.execute("""
        SELECT i.*, b.nama_balita
        FROM imunisasi i
        JOIN balita b ON i.id_balita = b.id_balita
        ORDER BY i.tanggal DESC
    """)
    return cursor.fetchall()

def get_imunisasi_by_id(id):
    cursor.execute(
        "SELECT * FROM imunisasi WHERE id_imunisasi=%s",
        (id,)
    )
    return cursor.fetchone()

def insert_imunisasi(id_balita, jenis, tanggal, ket):
    cursor.execute("""
        INSERT INTO imunisasi (id_balita, jenis_imunisasi, tanggal, keterangan)
        VALUES (%s,%s,%s,%s)
    """, (id_balita, jenis, tanggal, ket))
    db.commit()

def update_imunisasi(id, id_balita, jenis, tanggal, ket):
    cursor.execute("""
        UPDATE imunisasi SET
        id_balita=%s,
        jenis_imunisasi=%s,
        tanggal=%s,
        keterangan=%s
        WHERE id_imunisasi=%s
    """, (id_balita, jenis, tanggal, ket, id))
    db.commit()

def delete_imunisasi(id):
    cursor.execute(
        "DELETE FROM imunisasi WHERE id_imunisasi=%s",
        (id,)
    )
    db.commit()


