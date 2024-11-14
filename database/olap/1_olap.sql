CREATE SCHEMA olap;

CREATE TABLE olap.dim_local (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  description TEXT
);

CREATE SEQUENCE olap.local_id_seq START 1 INCREMENT 1;

CREATE TABLE olap.dim_time (
  id INTEGER PRIMARY KEY,
  year INTEGER,
  quarter INTEGER,
  month INTEGER,
  day INTEGER,
  week INTEGER,
  day_of_week VARCHAR(15),
  is_weekend BOOLEAN
);

CREATE SEQUENCE olap.time_id_seq START 1 INCREMENT 1;

CREATE TABLE olap.dim_sprinkler (
  id INTEGER PRIMARY KEY,
  irrigation_point_id INTEGER NOT NULL,
  sprinklers_count INTEGER,
  avg_water_consumption FLOAT,
  local_id INTEGER,
  created_at TIMESTAMP,
  --
  FOREIGN KEY (local_id) REFERENCES dim_local(id)
);

CREATE TABLE olap.dim_light (
  id INTEGER PRIMARY KEY,
  service_id INTEGER NOT NULL,
  model VARCHAR(255),
  avg_energy_consumption FLOAT,
  local_id INTEGER,
  created_at TIMESTAMP,
  --
  FOREIGN KEY (local_id) REFERENCES dim_local(id)
);

CREATE SEQUENCE olap.light_id_seq START 1 INCREMENT 1;

CREATE TABLE olap.dim_auto_door (
  id INTEGER PRIMARY KEY,
  service_id INTEGER NOT NULL,
  model VARCHAR(255),
  avg_energy_consumption FLOAT,
  local_id INTEGER,
  created_at TIMESTAMP,
  --
  FOREIGN KEY (local_id) REFERENCES dim_local(id)
);

CREATE SEQUENCE olap.auto_door_id_seq START 1 INCREMENT 1;

CREATE TABLE olap.fact_automation_billing (
  bill_id INTEGER PRIMARY KEY,
  auto_door_id INTEGER,
  sprinkler_id INTEGER,
  light_id INTEGER,
  value FLOAT,
  consumption FLOAT,
  measurement_unit VARCHAR(50),
  due_date TIMESTAMP,
  paid BOOLEAN,
  issued_at TIMESTAMP,
  paid_at TIMESTAMP,
  time_id INTEGER,
  --
  FOREIGN KEY (auto_door_id) REFERENCES dim_auto_door(id),
  FOREIGN KEY (sprinkler_id) REFERENCES dim_sprinkler(id),
  FOREIGN KEY (light_id) REFERENCES dim_light(id),
  FOREIGN KEY (time_id) REFERENCES dim_time(id)
);

CREATE SEQUENCE olap.automation_billing_id_seq START 1 INCREMENT 1;