import psycopg2

oltp_connection = psycopg2.connect(
    host="localhost",
    database="oltp",
    user="oltp",
    password="oltp",
    port="5432",
)

olap_connection = psycopg2.connect(
    host="localhost",
    database="olap",
    user="olap",
    password="olap",
    port="5433",
)


def load_from_database():
    cursor = oltp_connection.cursor()
    cursor.execute("SELECT * FROM energy_consumption")
    data = cursor.fetchall()
    cursor.close()
    return data


def transform():
    pass
