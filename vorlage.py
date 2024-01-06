import datetime
import subprocess
import mysql.connector
import os

# Verbindungsparameter
db_user = ''
db_password = ''
db_host = '
db_name = ''
backup_folder = 'backup/'

# MySQL-Datenbank sichern
def backup_mysql():

    if not os.path.exists(backup_folder):
       
        os.makedirs(backup_folder)

    # Datenbankverbindung herstellen
    db = mysql.connector.connect(host=db_host, user=db_user, password=db_password, database=db_name)
    cursor = db.cursor()

    # Alle Tabellen auflisten
    cursor.execute("SHOW TABLES")
    tables = cursor.fetchall()

    # Alle Tabellen durchgehen
    for table in tables:

        # Tabellenname auslesen
        table = table[0]

        # Tabelleninhalt auslesen
        cursor.execute(f"SELECT * FROM {table}")
        data = cursor.fetchall()

        # Dateinamen erstellen
        filename = f"{backup_folder}{table}.sql"

        # Datei schreiben
        with open(filename, "w") as f:
            # SQL-Code für Datenbankwiederherstellung schreiben
            f.write(f"USE {db_name};\n")
            f.write(f"DROP TABLE IF EXISTS {table};\n")
            f.write(f"CREATE TABLE {table} (\n")

            # Spaltennamen und Standard-Datentyp
            column_names = [desc[0] for desc in cursor.description]
            columns_with_datatype = [f"{name} VARCHAR(255)" for name in column_names]

            f.write(', '.join(columns_with_datatype) + ");\n")

            # Daten einfügen
            for line in data:
                values = [repr(value) for value in line]
                f.write(f"INSERT INTO {table} VALUES ({', '.join(values)});\n")

    # Datenbankverbindung schließen
    db.close()


# Sicherung durchführen
backup_mysql()
exit()

