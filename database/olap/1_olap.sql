CREATE SCHEMA olap;

CREATE TABLE olap.fact_automation_billing (
  bill_id INTEGER PRIMARY KEY,
  auto_door_id INTEGER REFERENCES dim_auto_door(id),
  sprinkler_id INTEGER REFERENCES dim_sprinkler(id),
  light_id INTEGER REFERENCES dim_light(id),
  value FLOAT,
  consumption FLOAT,
  measurement_unit VARCHAR(50),
  due_date TIMESTAMP,
  paid BOOLEAN,
  issued_at TIMESTAMP,
  paid_at TIMESTAMP,
  time_id INTEGER REFERENCES dim_time(id)
);

-- Criação da tabela de dimensões: Portas Automáticas
CREATE TABLE olap.dim_auto_door (
  id INTEGER PRIMARY KEY,
  service_id INTEGER NOT NULL,
  model VARCHAR(255),
  avg_energy_consumption FLOAT,
  local_id INTEGER REFERENCES dim_local(id),
  status VARCHAR(255),
  created_at TIMESTAMP
);

-- Criação da tabela de dimensões: Irrigadores
CREATE TABLE olap.dim_sprinkler (
  id INTEGER PRIMARY KEY,
  irrigation_point_id INTEGER NOT NULL,
  sprinklers_count INTEGER,
  avg_water_consumption FLOAT,
  local_id INTEGER REFERENCES dim_local(id),
  status VARCHAR(255),
  created_at TIMESTAMP
);

-- Criação da tabela de dimensões: Luzes Automáticas
CREATE TABLE olap.dim_light (
  id INTEGER PRIMARY KEY,
  service_id INTEGER NOT NULL,
  model VARCHAR(255),
  avg_energy_consumption FLOAT,
  local_id INTEGER REFERENCES dim_local(id),
  status VARCHAR(255),
  created_at TIMESTAMP
);

-- Criação da tabela de dimensões: Locais
CREATE TABLE olap.dim_local (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  description TEXT
);

-- Criação da tabela de dimensões: Tempo
CREATE TABLE olap.dim_time (
  id SERIAL PRIMARY KEY,
  year INTEGER,
  quarter INTEGER,
  month INTEGER,
  day INTEGER,
  week INTEGER,
  day_of_week VARCHAR(15),
  is_weekend BOOLEAN
);