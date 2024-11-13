CREATE SCHEMA global;

CREATE SEQUENCE global.service_id_seq START 1 INCREMENT 1;

CREATE TABLE global.local (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE global.resource (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE global.service (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  resource_id INTEGER NOT NULL,
  ---
  FOREIGN KEY (resource_id) REFERENCES global.resource(id)
);

---
CREATE SCHEMA garden;

CREATE TABLE garden.irrigation_point (
  id INTEGER PRIMARY KEY,
  sprinklers_count INTEGER NOT NULL,
  avg_water_consumption FLOAT NOT NULL,
  local_id INTEGER NOT NULL,
  is_active BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW(),
  ---
  FOREIGN KEY (local_id) REFERENCES global.local(id)
);

CREATE SEQUENCE garden.irrigation_point_id_seq START 1 INCREMENT 1;

CREATE TABLE garden.irrigation (
  id INTEGER PRIMARY KEY,
  service_id INTEGER NOT NULL,
  irrigation_point_id INTEGER NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL
);

CREATE SEQUENCE garden.irrigation_id_seq START 1 INCREMENT 1;

---
CREATE SCHEMA security;

CREATE TABLE security.monitoring_point (
  id INTEGER PRIMARY KEY,
  service_id INTEGER NOT NULL,
  camera_model VARCHAR(255) NOT NULL,
  avg_energy_consumption FLOAT NOT NULL,
  local_id INTEGER NOT NULL,
  is_active BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW(),
  ---
  FOREIGN KEY (local_id) REFERENCES global.local(id)
);

CREATE SEQUENCE security.monitoring_point_id_seq START 1 INCREMENT 1;

CREATE TABLE security.guard (
  cpf VARCHAR(11) PRIMARY KEY,
  service_id INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  salary FLOAT NOT NULL,
  local_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  ---
  FOREIGN KEY (local_id) REFERENCES global.local(id)
);

---
CREATE SCHEMA automation;

CREATE TABLE automation.auto_door (
  id INTEGER PRIMARY KEY,
  service_id INTEGER NOT NULL,
  model VARCHAR(255) NOT NULL,
  avg_energy_consumption FLOAT NOT NULL,
  local_id INTEGER NOT NULL,
  is_active BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW(),
  ---
  FOREIGN KEY (local_id) REFERENCES global.local(id)
);

CREATE SEQUENCE automation.auto_door_id_seq START 1 INCREMENT 1;

---
CREATE SCHEMA lighting;

CREATE TABLE lighting.light (
  id INTEGER PRIMARY KEY,
  service_id INTEGER NOT NULL,
  model VARCHAR(255) NOT NULL,
  avg_energy_consumption FLOAT NOT NULL,
  local_id INTEGER NOT NULL,
  is_active BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW(),
  ---
  FOREIGN KEY (local_id) REFERENCES global.local(id)
);

CREATE SEQUENCE lighting.light_id_seq START 1 INCREMENT 1;

---
CREATE SCHEMA finance;

CREATE TABLE finance.bill (
  id INTEGER PRIMARY KEY,
  value FLOAT NOT NULL,
  month INTEGER NOT NULL,
  consumption FLOAT NOT NULL,
  measurement_unit VARCHAR(50) NOT NULL,
  due_date TIMESTAMP NOT NULL,
  paid BOOLEAN NOT NULL,
  issued_at TIMESTAMP DEFAULT NOW(),
  paid_at TIMESTAMP
);