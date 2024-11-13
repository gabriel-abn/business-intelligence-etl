from datetime import datetime, timedelta

import psycopg2

olap_connection = psycopg2.connect(
    host="localhost",
    database="olap",
    user="olap",
    password="olap",
    port="5433",
)

oltp_connection = psycopg2.connect(
    host="localhost",
    database="oltp",
    user="oltp",
    password="oltp",
    port="5432",
)


def create_time_dimension() -> tuple[int, datetime]:
    current_date = datetime.now()
    olap_cursor = olap_connection.cursor()

    olap_cursor.execute(
        """
        INSERT INTO olap.dim_time
        VALUES (nextval('olap.time_id_seq'),
            %(year)s, %(quarter)s, %(month)s, %(day)s,
            %(week)s, %(day_of_week)s, %(is_weekend)s
            )
        RETURNING id;
        """,
        {
            "year": current_date.year,
            "quarter": (current_date.month - 1) // 3 + 1,
            "month": current_date.month,
            "day": current_date.day,
            "week": current_date.isocalendar()[1],
            "day_of_week": current_date.weekday(),
            "is_weekend": current_date.weekday() >= 5,
        },
    )

    time_dim_id = olap_cursor.fetchone()[0]
    olap_connection.commit()

    olap_cursor.close()

    return time_dim_id, current_date


def fetch_local_data(start_date: datetime, end_date: datetime):
    """
    Fetch local data created within the specified date range.

    Args:
        start_date (datetime): The start date of the range.
        end_date (datetime): The end date of the range.

    Returns:
        list: A list of tuples containing local data.
    """
    oltp_cursor = oltp_connection.cursor()
    oltp_cursor.execute(
        """
        SELECT id, name, description
        FROM global.local
        WHERE created_at BETWEEN %(start_date)s AND %(end_date)s
        """,
        {
            "start_date": start_date.strftime("%Y-%m-%d"),
            "end_date": end_date.strftime("%Y-%m-%d"),
        },
    )
    local_data = oltp_cursor.fetchall()
    oltp_cursor.close()
    return local_data


def fetch_irrigation_data(start_date: datetime, end_date: datetime):
    """
    Fetch irrigation data created within the specified date range.

    Args:
        start_date (datetime): The start date of the range.
        end_date (datetime): The end date of the range.

    Returns:
        list: A list of tuples containing irrigation data.
    """
    oltp_cursor = oltp_connection.cursor()
    oltp_cursor.execute(
        """
        SELECT ip.id, ip.sprinklers_count, ip.avg_water_consumption,
            ip.local_id, ip.is_active, ip.created_at
        FROM garden.irrigation_point ip
        WHERE ip.created_at BETWEEN %(start_date)s AND %(end_date)s
        """,
        {
            "start_date": start_date.strftime("%Y-%m-%d"),
            "end_date": end_date.strftime("%Y-%m-%d"),
        },
    )
    irrigation_data = oltp_cursor.fetchall()
    oltp_cursor.close()
    return irrigation_data


def fetch_light_data(start_date: datetime, end_date: datetime):
    """
    Fetch light data created within the specified date range.

    Args:
        start_date (datetime): The start date of the range.
        end_date (datetime): The end date of the range.

    Returns:
        list: A list of tuples containing light data.
    """
    oltp_cursor = oltp_connection.cursor()
    oltp_cursor.execute(
        """
        SELECT l.id, l.service_id, l.model, l.avg_energy_consumption,
            l.local_id, l.is_active, l.created_at
        FROM lighting.light l
        WHERE l.created_at BETWEEN %(start_date)s AND %(end_date)s
        """,
        {
            "start_date": start_date.strftime("%Y-%m-%d"),
            "end_date": end_date.strftime("%Y-%m-%d"),
        },
    )
    light_data = oltp_cursor.fetchall()
    oltp_cursor.close()
    return light_data


def fetch_auto_door_data(start_date: datetime, end_date: datetime):
    """
    Fetch auto door data created within the specified date range.

    Args:
        start_date (datetime): The start date of the range.
        end_date (datetime): The end date of the range.

    Returns:
        list: A list of tuples containing auto door data.
    """
    oltp_cursor = oltp_connection.cursor()
    oltp_cursor.execute(
        """
        SELECT ad.id, ad.service_id, ad.model, ad.avg_energy_consumption,
            ad.local_id, ad.is_active, ad.created_at
        FROM automation.auto_door ad
        WHERE ad.created_at BETWEEN %(start_date)s AND %(end_date)s
        """,
        {
            "start_date": start_date.strftime("%Y-%m-%d"),
            "end_date": end_date.strftime("%Y-%m-%d"),
        },
    )
    auto_door_data = oltp_cursor.fetchall()
    oltp_cursor.close()
    return auto_door_data


def transform(time_dim_id: int, current_date: datetime):
    start_date = current_date - timedelta(days=7)
    end_date = current_date

    local_data = fetch_local_data(start_date, end_date)
    irrigation_data = fetch_irrigation_data(start_date, end_date)
    light_data = fetch_light_data(start_date, end_date)
    auto_door_data = fetch_auto_door_data(start_date, end_date)
    # ...transform and load data into OLAP database...


if __name__ == "__main__":
    try:
        time_dim_id, current_date = create_time_dimension()

        print(f"Time dimension created with id: {time_dim_id}")
        transform(time_dim_id, current_date)
    except Exception as e:
        print(e)
    finally:
        oltp_connection.close()
        olap_connection.close()
