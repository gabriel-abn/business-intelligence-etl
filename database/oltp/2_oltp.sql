-- Insert sample data into global.local
INSERT INTO global.local (id, name, description) VALUES
(1, 'Block 423', 'Front garden'),
(2, 'Block 234', 'Backyard'),
(3, 'Block 123', 'Corridor 1'),
(4, 'Block 456', 'Corridor 2'),
(5, 'Block 789', 'Parking lot'),
(6, 'Block 321', 'Lobby'),
(7, 'Block 654', 'Gym'),
(8, 'Block 987', 'Swimming pool area'),
(9, 'Block 111', 'Playground'),
(10, 'Block 222', 'Rooftop'),
(11, 'Block 423', 'Backyard'),
(12, 'Block 234', 'Front garden'),
(13, 'Block 123', 'Parking lot'),
(14, 'Block 456', 'Lobby'),
(15, 'Block 789', 'Gym'),
(16, 'Block 321', 'Swimming pool area'),
(17, 'Block 654', 'Playground'),
(18, 'Block 987', 'Rooftop'),
(19, 'Block 111', 'Corridor 1'),
(20, 'Block 222', 'Corridor 2');

-- Insert sample data into global.resource
INSERT INTO global.resource (id, name) VALUES
(1, 'Water'),
(2, 'Electricity');

-- Insert sample data into global.service
INSERT INTO global.service (id, name, resource_id) VALUES
(1, 'Water Supply', 1),
(2, 'Electricity Supply', 2);

-- Insert sample data into garden.irrigation_point
INSERT INTO garden.irrigation_point (id, sprinklers_count, avg_water_consumption, local_id, is_active, created_at) VALUES
(1, 4, 15.5, 1, TRUE, '2024-01-01 08:00:00'),
(2, 6, 20.0, 2, TRUE, '2024-01-01 08:00:00'),
(3, 5, 18.0, 3, TRUE, '2024-01-01 08:00:00'),
(4, 3, 12.5, 4, TRUE, '2024-01-01 08:00:00'),
(5, 7, 22.0, 5, TRUE, '2024-01-01 08:00:00'),
(6, 4, 16.0, 6, TRUE, '2024-02-01 08:00:00'),
(7, 6, 21.0, 7, TRUE, '2024-02-01 08:00:00'),
(8, 5, 19.0, 8, TRUE, '2024-02-01 08:00:00'),
(9, 3, 13.0, 9, TRUE, '2024-02-01 08:00:00'),
(10, 7, 23.0, 10, TRUE, '2024-02-01 08:00:00');

-- Insert sample data into garden.irrigation
INSERT INTO garden.irrigation (id, service_id, irrigation_point_id, start_time, end_time) VALUES
(1, 1, 1, '2024-01-01 06:00:00', '2024-01-01 06:30:00'),
(2, 1, 2, '2024-01-01 07:00:00', '2024-01-01 07:30:00'),
(3, 1, 3, '2024-01-01 08:00:00', '2024-01-01 08:30:00'),
(4, 1, 4, '2024-01-01 09:00:00', '2024-01-01 09:30:00'),
(5, 1, 5, '2024-01-01 10:00:00', '2024-01-01 10:30:00'),
(6, 1, 6, '2024-02-01 06:00:00', '2024-02-01 06:30:00'),
(7, 1, 7, '2024-02-01 07:00:00', '2024-02-01 07:30:00'),
(8, 1, 8, '2024-02-01 08:00:00', '2024-02-01 08:30:00'),
(9, 1, 9, '2024-02-01 09:00:00', '2024-02-01 09:30:00'),
(10, 1, 10, '2024-02-01 10:00:00', '2024-02-01 10:30:00');

-- Insert sample data into security.monitoring_point
INSERT INTO security.monitoring_point (id, service_id, camera_model, avg_energy_consumption, local_id, is_active, created_at) VALUES
(1, 2, 'CamModelX', 5.5, 1, TRUE, '2024-01-01 08:00:00'),
(2, 2, 'CamModelY', 6.0, 2, TRUE, '2024-01-01 08:00:00'),
(3, 2, 'CamModelZ', 5.8, 3, TRUE, '2024-01-01 08:00:00'),
(4, 2, 'CamModelA', 6.2, 4, TRUE, '2024-01-01 08:00:00'),
(5, 2, 'CamModelB', 5.9, 5, TRUE, '2024-01-01 08:00:00'),
(6, 2, 'CamModelC', 6.1, 6, TRUE, '2024-02-01 08:00:00'),
(7, 2, 'CamModelD', 6.3, 7, TRUE, '2024-02-01 08:00:00'),
(8, 2, 'CamModelE', 6.4, 8, TRUE, '2024-02-01 08:00:00'),
(9, 2, 'CamModelF', 6.5, 9, TRUE, '2024-02-01 08:00:00'),
(10, 2, 'CamModelG', 6.6, 10, TRUE, '2024-02-01 08:00:00');

-- Insert sample data into security.guard
INSERT INTO security.guard (cpf, service_id, name, salary, local_id, created_at) VALUES
('12345678901', 2, 'John Doe', 3000.0, 1, '2024-01-01 08:00:00'),
('98765432100', 2, 'Jane Smith', 3200.0, 2, '2024-01-01 08:00:00'),
('12312312312', 2, 'Alice Johnson', 3100.0, 3, '2024-01-01 08:00:00'),
('32132132132', 2, 'Bob Brown', 3300.0, 4, '2024-01-01 08:00:00'),
('45645645645', 2, 'Charlie Davis', 3400.0, 5, '2024-01-01 08:00:00'),
('78978978978', 2, 'David Evans', 3500.0, 6, '2024-02-01 08:00:00'),
('65465465465', 2, 'Eve Harris', 3600.0, 7, '2024-02-01 08:00:00'),
('32132132432', 2, 'Frank Green', 3700.0, 8, '2024-02-01 08:00:00'),
('98798798798', 2, 'Grace Hill', 3800.0, 9, '2024-02-01 08:00:00'),
('12312312352', 2, 'Hank Ives', 3900.0, 10, '2024-02-01 08:00:00');

-- Insert sample data into automation.auto_door
INSERT INTO automation.auto_door (id, service_id, model, avg_energy_consumption, local_id, is_active, created_at) VALUES
(1, 2, 'AutoDoorX', 2.5, 1, TRUE, '2024-01-01 08:00:00'),
(2, 2, 'AutoDoorY', 3.0, 2, TRUE, '2024-01-01 08:00:00'),
(3, 2, 'AutoDoorZ', 2.8, 3, TRUE, '2024-01-01 08:00:00'),
(4, 2, 'AutoDoorA', 3.2, 4, TRUE, '2024-01-01 08:00:00'),
(5, 2, 'AutoDoorB', 2.9, 5, TRUE, '2024-01-01 08:00:00'),
(6, 2, 'AutoDoorC', 3.1, 6, TRUE, '2024-02-01 08:00:00'),
(7, 2, 'AutoDoorD', 3.3, 7, TRUE, '2024-02-01 08:00:00'),
(8, 2, 'AutoDoorE', 3.4, 8, TRUE, '2024-02-01 08:00:00'),
(9, 2, 'AutoDoorF', 3.5, 9, TRUE, '2024-02-01 08:00:00'),
(10, 2, 'AutoDoorG', 3.6, 10, TRUE, '2024-02-01 08:00:00');

-- Insert sample data into lighting.light
INSERT INTO lighting.light (id, service_id, model, avg_energy_consumption, local_id, is_active, created_at) VALUES
(1, 2, 'LightModelX', 1.5, 1, TRUE, '2024-01-01 08:00:00'),
(2, 2, 'LightModelY', 2.0, 2, TRUE, '2024-01-01 08:00:00'),
(3, 2, 'LightModelZ', 1.8, 3, TRUE, '2024-01-01 08:00:00'),
(4, 2, 'LightModelA', 2.2, 4, TRUE, '2024-01-01 08:00:00'),
(5, 2, 'LightModelB', 1.9, 5, TRUE, '2024-01-01 08:00:00'),
(6, 2, 'LightModelC', 2.1, 6, TRUE, '2024-02-01 08:00:00'),
(7, 2, 'LightModelD', 2.3, 7, TRUE, '2024-02-01 08:00:00'),
(8, 2, 'LightModelE', 2.4, 8, TRUE, '2024-02-01 08:00:00'),
(9, 2, 'LightModelF', 2.5, 9, TRUE, '2024-02-01 08:00:00'),
(10, 2, 'LightModelG', 2.6, 10, TRUE, '2024-02-01 08:00:00');

-- Insert sample data into finance.bill
INSERT INTO finance.bill (id, value, month, consumption, measurement_unit, due_date, paid, issued_at, paid_at) VALUES
(1, 100.0, 1, 50.0, 'kWh', '2024-01-31 23:59:59', TRUE, '2024-01-01 08:00:00', '2024-01-15 08:00:00'),
(2, 150.0, 1, 75.0, 'm³', '2024-01-31 23:59:59', FALSE, '2024-01-01 08:00:00', NULL),
(3, 120.0, 2, 60.0, 'kWh', '2024-02-28 23:59:59', TRUE, '2024-02-01 08:00:00', '2024-02-15 08:00:00'),
(4, 180.0, 2, 90.0, 'm³', '2024-02-28 23:59:59', FALSE, '2024-02-01 08:00:00', NULL),
(5, 130.0, 3, 65.0, 'kWh', '2024-03-31 23:59:59', TRUE, '2024-03-01 08:00:00', '2024-03-15 08:00:00'),
(6, 140.0, 3, 70.0, 'm³', '2024-03-31 23:59:59', FALSE, '2024-03-01 08:00:00', NULL),
(7, 110.0, 4, 55.0, 'kWh', '2024-04-30 23:59:59', TRUE, '2024-04-01 08:00:00', '2024-04-15 08:00:00'),
(8, 160.0, 4, 80.0, 'm³', '2024-04-30 23:59:59', FALSE, '2024-04-01 08:00:00', NULL),
(9, 115.0, 5, 57.5, 'kWh', '2024-05-31 23:59:59', TRUE, '2024-05-01 08:00:00', '2024-05-15 08:00:00'),
(10, 165.0, 5, 82.5, 'm³', '2024-05-31 23:59:59', FALSE, '2024-05-01 08:00:00', NULL),
(11, 125.0, 6, 62.5, 'kWh', '2024-06-30 23:59:59', TRUE, '2024-06-01 08:00:00', '2024-06-15 08:00:00'),
(12, 175.0, 6, 87.5, 'm³', '2024-06-30 23:59:59', FALSE, '2024-06-01 08:00:00', NULL);
