-- global.local.csv
INSERT INTO
  global.local (id, name, description)
VALUES
  (1, 'Local 1', 'Description for Local 1'),
  (2, 'Local 2', 'Description for Local 2'),
  (3, 'Local 3', 'Description for Local 3'),
  (4, 'Local 4', 'Description for Local 4'),
  (5, 'Local 5', 'Description for Local 5'),
  (6, 'Local 6', 'Description for Local 6'),
  (7, 'Local 7', 'Description for Local 7'),
  (8, 'Local 8', 'Description for Local 8'),
  (9, 'Local 9', 'Description for Local 9'),
  (10, 'Local 10', 'Description for Local 10'),
  (11, 'Local 11', 'Description for Local 11'),
  (12, 'Local 12', 'Description for Local 12'),
  (13, 'Local 13', 'Description for Local 13'),
  (14, 'Local 14', 'Description for Local 14'),
  (15, 'Local 15', 'Description for Local 15'),
  (16, 'Local 16', 'Description for Local 16'),
  (17, 'Local 17', 'Description for Local 17'),
  (18, 'Local 18', 'Description for Local 18'),
  (19, 'Local 19', 'Description for Local 19'),
  (20, 'Local 20', 'Description for Local 20');

-- global.resource.csv
INSERT INTO
  global.resource (id, name)
VALUES
  (1, 'Resource 1'),
  (2, 'Resource 2'),
  (3, 'Resource 3'),
  (4, 'Resource 4'),
  (5, 'Resource 5'),
  (6, 'Resource 6'),
  (7, 'Resource 7'),
  (8, 'Resource 8'),
  (9, 'Resource 9'),
  (10, 'Resource 10'),
  (11, 'Resource 11'),
  (12, 'Resource 12'),
  (13, 'Resource 13'),
  (14, 'Resource 14'),
  (15, 'Resource 15'),
  (16, 'Resource 16'),
  (17, 'Resource 17'),
  (18, 'Resource 18'),
  (19, 'Resource 19'),
  (20, 'Resource 20');

-- global.service.csv
INSERT INTO
  global.service (id, name, resource_id)
VALUES
  (1, 'Service 1', 5),
  (2, 'Service 2', 12),
  (3, 'Service 3', 11),
  (4, 'Service 4', 6),
  (5, 'Service 5', 15),
  (6, 'Service 6', 4),
  (7, 'Service 7', 20),
  (8, 'Service 8', 19),
  (9, 'Service 9', 14),
  (10, 'Service 10', 2),
  (11, 'Service 11', 11),
  (12, 'Service 12', 18),
  (13, 'Service 13', 7),
  (14, 'Service 14', 18),
  (15, 'Service 15', 4),
  (16, 'Service 16', 12),
  (17, 'Service 17', 10),
  (18, 'Service 18', 1),
  (19, 'Service 19', 12),
  (20, 'Service 20', 8);

-- garden.irrigation_point.csv
INSERT INTO
  garden.irrigation_point (
    id,
    sprinklers_count,
    avg_water_consumption,
    local_id,
    status,
    created_at
  )
VALUES
  (1, 10, 20.0, 1, 'Active', '2023-01-01 00:00:00'),
  (
    2,
    15,
    25.0,
    2,
    'Inactive',
    '2023-02-01 00:00:00'
  );

-- garden.irrigation.csv
INSERT INTO
  garden.irrigation (
    id,
    service_id,
    irrigation_point_id,
    start_time,
    end_time
  )
VALUES
  (
    1,
    1,
    1,
    '2023-01-01 06:00:00',
    '2023-01-01 07:00:00'
  ),
  (
    2,
    2,
    2,
    '2023-02-01 06:00:00',
    '2023-02-01 07:00:00'
  );

-- security.monitoring_point.csv
INSERT INTO
  security.monitoring_point (
    id,
    service_id,
    camera_model,
    avg_energy_consumption,
    local_id,
    status,
    created_at
  )
VALUES
  (
    1,
    1,
    'Camera Model 1',
    5.0,
    '1',
    'Active',
    '2023-01-01 00:00:00'
  ),
  (
    2,
    2,
    'Camera Model 2',
    7.0,
    '2',
    'Inactive',
    '2023-02-01 00:00:00'
  );

-- security.guard.csv
INSERT INTO
  security.guard (
    cpf,
    service_id,
    name,
    salary,
    local_id,
    created_at
  )
VALUES
  (
    '12345678901',
    1,
    'Guard 1',
    3000.0,
    1,
    '2023-01-01 00:00:00'
  ),
  (
    '23456789012',
    2,
    'Guard 2',
    3500.0,
    2,
    '2023-02-01 00:00:00'
  );

-- automation.auto_door.csv
INSERT INTO
  automation.auto_door (
    id,
    service_id,
    model,
    avg_energy_consumption,
    local_id,
    status,
    created_at
  )
VALUES
  (
    1,
    12,
    'Door Model 1',
    11.05,
    11,
    'Closed',
    '2023-10-25 08:11:52'
  ),
  (
    2,
    13,
    'Door Model 2',
    17.92,
    9,
    'Closed',
    '2023-04-14 10:57:37'
  ),
  (
    3,
    4,
    'Door Model 3',
    5.53,
    15,
    'Closed',
    '2023-04-05 07:22:40'
  ),
  (
    4,
    12,
    'Door Model 4',
    6.25,
    20,
    'Open',
    '2023-10-17 07:46:33'
  ),
  (
    5,
    3,
    'Door Model 5',
    17.62,
    4,
    'Open',
    '2023-01-20 12:05:25'
  ),
  (
    6,
    18,
    'Door Model 6',
    6.74,
    7,
    'Open',
    '2023-02-20 12:24:00'
  ),
  (
    7,
    18,
    'Door Model 7',
    15.84,
    8,
    'Closed',
    '2023-09-14 05:40:24'
  ),
  (
    8,
    17,
    'Door Model 8',
    13.32,
    5,
    'Closed',
    '2023-12-09 17:02:56'
  ),
  (
    9,
    15,
    'Door Model 9',
    10.0,
    15,
    'Closed',
    '2023-01-01 02:45:54'
  ),
  (
    10,
    4,
    'Door Model 10',
    16.86,
    17,
    'Closed',
    '2023-09-12 20:52:29'
  ),
  (
    11,
    16,
    'Door Model 11',
    10.44,
    16,
    'Closed',
    '2023-04-13 05:54:40'
  ),
  (
    12,
    17,
    'Door Model 12',
    17.14,
    18,
    'Closed',
    '2023-05-14 01:12:05'
  ),
  (
    13,
    18,
    'Door Model 13',
    13.69,
    16,
    'Open',
    '2023-05-19 06:35:53'
  ),
  (
    14,
    15,
    'Door Model 14',
    8.66,
    18,
    'Open',
    '2023-03-03 14:45:30'
  ),
  (
    15,
    3,
    'Door Model 15',
    17.62,
    17,
    'Closed',
    '2023-05-03 20:55:47'
  ),
  (
    16,
    8,
    'Door Model 16',
    12.05,
    2,
    'Open',
    '2023-11-09 16:51:57'
  );

-- lighting.light.csv
INSERT INTO
  lighting.light (
    id,
    service_id,
    model,
    avg_energy_consumption,
    local_id,
    status,
    created_at
  )
VALUES
  (
    1,
    1,
    'Light Model 1',
    10.0,
    1,
    'Active',
    '2023-01-01 00:00:00'
  ),
  (
    2,
    2,
    'Light Model 2',
    15.0,
    2,
    'Inactive',
    '2023-02-01 00:00:00'
  );

-- finance.bill.csv
INSERT INTO
  finance.bill (
    id,
    value,
    month,
    consumption,
    measurement_unit,
    due_date,
    paid,
    issued_at,
    paid_at
  )
VALUES
  (
    1,
    100.0,
    1,
    50.0,
    'kWh',
    '2023-01-31 00:00:00',
    false,
    '2023-01-01 00:00:00',
    NULL
  ),
  (
    2,
    150.0,
    2,
    75.0,
    'kWh',
    '2023-02-28 00:00:00',
    true,
    '2023-02-01 00:00:00',
    '2023-02-15 00:00:00'
  );

-- automation.auto_door.csv
INSERT INTO
  automation.auto_door (
    id,
    service_id,
    model,
    avg_energy_consumption,
    local_id,
    status,
    created_at
  )
VALUES
  (
    1,
    12,
    'Door Model 1',
    11.05,
    11,
    'Closed',
    '2023-10-25 08:11:52'
  ),
  (
    2,
    13,
    'Door Model 2',
    17.92,
    9,
    'Closed',
    '2023-04-14 10:57:37'
  ),
  (
    3,
    4,
    'Door Model 3',
    5.53,
    15,
    'Closed',
    '2023-04-05 07:22:40'
  ),
  (
    4,
    12,
    'Door Model 4',
    6.25,
    20,
    'Open',
    '2023-10-17 07:46:33'
  ),
  (
    5,
    3,
    'Door Model 5',
    17.62,
    4,
    'Open',
    '2023-01-20 12:05:25'
  ),
  (
    6,
    18,
    'Door Model 6',
    6.74,
    7,
    'Open',
    '2023-02-20 12:24:00'
  ),
  (
    7,
    18,
    'Door Model 7',
    15.84,
    8,
    'Closed',
    '2023-09-14 05:40:24'
  ),
  (
    8,
    17,
    'Door Model 8',
    13.32,
    5,
    'Closed',
    '2023-12-09 17:02:56'
  ),
  (
    9,
    15,
    'Door Model 9',
    10.0,
    15,
    'Closed',
    '2023-01-01 02:45:54'
  ),
  (
    10,
    4,
    'Door Model 10',
    16.86,
    17,
    'Closed',
    '2023-09-12 20:52:29'
  ),
  (
    11,
    16,
    'Door Model 11',
    10.44,
    16,
    'Closed',
    '2023-04-13 05:54:40'
  ),
  (
    12,
    17,
    'Door Model 12',
    17.14,
    18,
    'Closed',
    '2023-05-14 01:12:05'
  ),
  (
    13,
    18,
    'Door Model 13',
    13.69,
    16,
    'Open',
    '2023-05-19 06:35:53'
  ),
  (
    14,
    15,
    'Door Model 14',
    8.66,
    18,
    'Open',
    '2023-03-03 14:45:30'
  ),
  (
    15,
    3,
    'Door Model 15',
    17.62,
    17,
    'Closed',
    '2023-05-03 20:55:47'
  ),
  (
    16,
    8,
    'Door Model 16',
    12.05,
    2,
    'Open',
    '2023-11-09 16:51:57'
  );

-- finance.bill.csv
INSERT INTO
  finance.bill (
    id,
    value,
    month,
    consumption,
    measurement_unit,
    due_date,
    paid,
    issued_at,
    paid_at
  )
VALUES
  (
    1,
    100.0,
    1,
    50.0,
    'kWh',
    '2023-01-31 00:00:00',
    false,
    '2023-01-01 00:00:00',
    NULL
  ),
  (
    2,
    150.0,
    2,
    75.0,
    'kWh',
    '2023-02-28 00:00:00',
    true,
    '2023-02-01 00:00:00',
    '2023-02-15 00:00:00'
  );

-- garden.irrigation_point.csv
INSERT INTO
  garden.irrigation_point (
    id,
    sprinklers_count,
    avg_water_consumption,
    local_id,
    status,
    created_at
  )
VALUES
  (1, 10, 20.0, 1, 'Active', '2023-01-01 00:00:00'),
  (
    2,
    15,
    25.0,
    2,
    'Inactive',
    '2023-02-01 00:00:00'
  );

-- garden.irrigation.csv
INSERT INTO
  garden.irrigation (
    id,
    service_id,
    irrigation_point_id,
    start_time,
    end_time
  )
VALUES
  (
    1,
    1,
    1,
    '2023-01-01 06:00:00',
    '2023-01-01 07:00:00'
  ),
  (
    2,
    2,
    2,
    '2023-02-01 06:00:00',
    '2023-02-01 07:00:00'
  );

-- global.local.csv
INSERT INTO
  global.local (id, name, description)
VALUES
  (1, 'Local 1', 'Description for Local 1'),
  (2, 'Local 2', 'Description for Local 2'),
  (3, 'Local 3', 'Description for Local 3'),
  (4, 'Local 4', 'Description for Local 4'),
  (5, 'Local 5', 'Description for Local 5'),
  (6, 'Local 6', 'Description for Local 6'),
  (7, 'Local 7', 'Description for Local 7'),
  (8, 'Local 8', 'Description for Local 8'),
  (9, 'Local 9', 'Description for Local 9'),
  (10, 'Local 10', 'Description for Local 10'),
  (11, 'Local 11', 'Description for Local 11'),
  (12, 'Local 12', 'Description for Local 12'),
  (13, 'Local 13', 'Description for Local 13'),
  (14, 'Local 14', 'Description for Local 14'),
  (15, 'Local 15', 'Description for Local 15'),
  (16, 'Local 16', 'Description for Local 16'),
  (17, 'Local 17', 'Description for Local 17'),
  (18, 'Local 18', 'Description for Local 18'),
  (19, 'Local 19', 'Description for Local 19'),
  (20, 'Local 20', 'Description for Local 20');

-- global.resource.csv
INSERT INTO
  global.resource (id, name)
VALUES
  (1, 'Resource 1'),
  (2, 'Resource 2'),
  (3, 'Resource 3'),
  (4, 'Resource 4'),
  (5, 'Resource 5'),
  (6, 'Resource 6'),
  (7, 'Resource 7'),
  (8, 'Resource 8'),
  (9, 'Resource 9'),
  (10, 'Resource 10'),
  (11, 'Resource 11'),
  (12, 'Resource 12'),
  (13, 'Resource 13'),
  (14, 'Resource 14'),
  (15, 'Resource 15'),
  (16, 'Resource 16'),
  (17, 'Resource 17'),
  (18, 'Resource 18'),
  (19, 'Resource 19'),
  (20, 'Resource 20');

-- global.service.csv
INSERT INTO
  global.service (id, name, resource_id)
VALUES
  (1, 'Service 1', 5),
  (2, 'Service 2', 12),
  (3, 'Service 3', 11),
  (4, 'Service 4', 6),
  (5, 'Service 5', 15),
  (6, 'Service 6', 4),
  (7, 'Service 7', 20),
  (8, 'Service 8', 19),
  (9, 'Service 9', 14),
  (10, 'Service 10', 2),
  (11, 'Service 11', 11),
  (12, 'Service 12', 18),
  (13, 'Service 13', 7),
  (14, 'Service 14', 18),
  (15, 'Service 15', 4),
  (16, 'Service 16', 12),
  (17, 'Service 17', 10),
  (18, 'Service 18', 1),
  (19, 'Service 19', 12),
  (20, 'Service 20', 8);

-- lighting.light.csv
INSERT INTO
  lighting.light (
    id,
    service_id,
    model,
    avg_energy_consumption,
    local_id,
    status,
    created_at
  )
VALUES
  (
    1,
    1,
    'Light Model 1',
    10.0,
    1,
    'Active',
    '2023-01-01 00:00:00'
  ),
  (
    2,
    2,
    'Light Model 2',
    15.0,
    2,
    'Inactive',
    '2023-02-01 00:00:00'
  );

-- security.guard.csv
INSERT INTO
  security.guard (
    cpf,
    service_id,
    name,
    salary,
    local_id,
    created_at
  )
VALUES
  (
    '12345678901',
    1,
    'Guard 1',
    3000.0,
    1,
    '2023-01-01 00:00:00'
  ),
  (
    '23456789012',
    2,
    'Guard 2',
    3500.0,
    2,
    '2023-02-01 00:00:00'
  );

-- security.monitoring_point.csv
INSERT INTO
  security.monitoring_point (
    id,
    service_id,
    camera_model,
    avg_energy_consumption,
    local_id,
    status,
    created_at
  )
VALUES
  (
    1,
    1,
    'Camera Model 1',
    5.0,
    '1',
    'Active',
    '2023-01-01 00:00:00'
  ),
  (
    2,
    2,
    'Camera Model 2',
    7.0,
    '2',
    'Inactive',
    '2023-02-01 00:00:00'
  );