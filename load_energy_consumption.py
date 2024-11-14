from dataclasses import dataclass
from datetime import datetime, timedelta
from pprint import pprint

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


@dataclass
class Local:
    id: int
    name: str
    description: str


@dataclass
class Light:
    id: int
    service_id: int
    model: str
    avg_energy_consumption: float
    local_id: int
    is_active: bool
    created_at: datetime


@dataclass
class AutoDoor:
    id: int
    service_id: int
    model: str
    avg_energy_consumption: float
    local_id: int
    is_active: bool
    created_at: datetime


def create_time_dimension() -> tuple[int, datetime]:
    try:
        current_date = datetime.fromisoformat("2024-02-01")
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
    except Exception as e:
        pprint(e)
        raise


def fetch_local_data(start_date: datetime, end_date: datetime) -> list[Local]:
    """
    Fetch local data created within the specified date range.

    Args:
        start_date (datetime): The start date of the range.
        end_date (datetime): The end date of the range.

    Returns:
        list: A list of tuples containing local data.
    """
    try:
        oltp_cursor = oltp_connection.cursor()
        oltp_cursor.execute(
            """
            SELECT id, name, description
            FROM global.local;
            """
        )
        local_data = [Local(*row) for row in oltp_cursor.fetchall()]
        oltp_cursor.close()
        return local_data
    except Exception as e:
        pprint(e)
        raise


def fetch_light_data(start_date: datetime, end_date: datetime) -> list[Light]:
    """
    Fetch light data created within the specified date range.

    Args:
        start_date (datetime): The start date of the range.
        end_date (datetime): The end date of the range.

    Returns:
        list: A list of tuples containing light data.
    """
    try:
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
        light_data = [Light(*row) for row in oltp_cursor.fetchall()]
        oltp_cursor.close()
        return light_data
    except Exception as e:
        pprint(e)
        raise


def fetch_auto_door_data(start_date: datetime, end_date: datetime) -> list[AutoDoor]:
    """
    Fetch auto door data created within the specified date range.

    Args:
        start_date (datetime): The start date of the range.
        end_date (datetime): The end date of the range.

    Returns:
        list: A list of tuples containing auto door data.
    """
    try:
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
        auto_door_data = [AutoDoor(*row) for row in oltp_cursor.fetchall()]
        oltp_cursor.close()
        return auto_door_data
    except Exception as e:
        pprint(e)
        raise


def load_local_dimension(local_data: list[Local]) -> list[int]:
    try:
        olap_cursor = olap_connection.cursor()
        local_ids = []
        for local in local_data:
            olap_cursor.execute(
                """
                INSERT INTO olap.dim_local (id, name, description)
                VALUES (nextval('olap.local_id_seq'), %(name)s, %(description)s)
                RETURNING id;
                """,
                {
                    "name": local.name,
                    "description": local.description,
                },
            )
            local_ids.append(olap_cursor.fetchone()[0])
        olap_connection.commit()
        olap_cursor.close()
        return local_ids
    except Exception as e:
        pprint(e)
        raise


def load_light_dimension(light_data: list[Light]) -> list[int]:
    try:
        olap_cursor = olap_connection.cursor()
        light_ids = []
        for light in light_data:
            olap_cursor.execute(
                """
                INSERT INTO olap.dim_light (id, service_id, model,
                    avg_energy_consumption, local_id, created_at)
                VALUES (nextval('olap.light_id_seq'), %(service_id)s, %(model)s,
                    %(avg_energy_consumption)s, %(local_id)s, %(created_at)s)
                RETURNING id;
                """,
                {
                    "service_id": light.service_id,
                    "model": light.model,
                    "avg_energy_consumption": light.avg_energy_consumption,
                    "local_id": light.local_id,
                    "created_at": light.created_at,
                },
            )
            light_ids.append(olap_cursor.fetchone()[0])
        olap_connection.commit()
        olap_cursor.close()
        return light_ids
    except Exception as e:
        pprint(e)
        raise


def load_auto_door_dimension(auto_door_data: list[AutoDoor]) -> list[int]:
    try:
        olap_cursor = olap_connection.cursor()
        auto_door_ids = []
        for auto_door in auto_door_data:
            olap_cursor.execute(
                """
                INSERT INTO olap.dim_auto_door (id, service_id, model,
                    avg_energy_consumption, local_id, created_at)
                VALUES (nextval('olap.auto_door_id_seq'), %(service_id)s,
                    %(model)s, %(avg_energy_consumption)s, %(local_id)s,
                    %(created_at)s)
                RETURNING id;
                """,
                {
                    "service_id": auto_door.service_id,
                    "model": auto_door.model,
                    "avg_energy_consumption": auto_door.avg_energy_consumption,
                    "local_id": auto_door.local_id,
                    "created_at": auto_door.created_at,
                },
            )
            auto_door_ids.append(olap_cursor.fetchone()[0])
        olap_connection.commit()
        olap_cursor.close()
        return auto_door_ids
    except Exception as e:
        pprint(e)
        raise


def load_fact_automation_billing(
    time_dim_id: int,
    light_ids: list[int],
    auto_door_ids: list[int],
    light_data: list[Light],
    auto_door_data: list[AutoDoor],
):
    try:
        olap_cursor = olap_connection.cursor()
        total_energy_consumption = sum(
            light.avg_energy_consumption for light in light_data
        ) + sum(auto_door.avg_energy_consumption for auto_door in auto_door_data)

        for light_id, auto_door_id in zip(light_ids, auto_door_ids):
            olap_cursor.execute(
                """
                INSERT INTO olap.fact_automation_billing (bill_id, auto_door_id,
                    light_id, value, consumption, measurement_unit, due_date, paid,
                    issued_at, paid_at, time_id)
                VALUES (nextval('olap.automation_billing_id_seq'), %(auto_door_id)s,
                %(light_id)s, %(value)s, %(consumption)s, %(measurement_unit)s,
                %(due_date)s, %(paid)s, %(issued_at)s, %(paid_at)s, %(time_id)s)
                """,
                {
                    "auto_door_id": auto_door_id,
                    "light_id": light_id,
                    "value": 0,
                    "consumption": total_energy_consumption,
                    "measurement_unit": "kWh",
                    "due_date": datetime.now(),
                    "paid": False,
                    "issued_at": datetime.now(),
                    "paid_at": None,
                    "time_id": time_dim_id,
                },
            )

        olap_connection.commit()
        olap_cursor.close()
    except Exception as e:
        pprint(e)
        raise


def transform(time_dim_id: int, current_date: datetime):
    try:
        start_date = current_date - timedelta(days=30)
        end_date = current_date

        local_data = fetch_local_data(start_date, end_date)
        light_data = fetch_light_data(start_date, end_date)
        auto_door_data = fetch_auto_door_data(start_date, end_date)

        load_local_dimension(local_data)

        light_ids = load_light_dimension(light_data)
        auto_door_ids = load_auto_door_dimension(auto_door_data)

        pprint(time_dim_id, light_ids, auto_door_ids, light_data, auto_door_data)

        load_fact_automation_billing(
            time_dim_id, light_ids, auto_door_ids, light_data, auto_door_data
        )
    except Exception as e:
        pprint(e)
        raise


if __name__ == "__main__":
    try:
        time_dim_id, current_date = create_time_dimension()

        print(f"Time dimension created with id: {time_dim_id}")

        transform(time_dim_id, current_date)
    except Exception as e:
        pprint(e)
    finally:
        oltp_connection.close()
        olap_connection.close()
