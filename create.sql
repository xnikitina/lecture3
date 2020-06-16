CREATE TABLE fligts (
    id SERIAL PRIMARY KEY,
    origin VARCHAR NOT NULL,
    destination VARCHAR NOT NULL,
    duration INTEGER NOT NULL
);

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    code VARCHAR NOT NULL,
    name VARCHAR NOT NULL
);

CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    flight_id INTEGER REFERENCES flights
);

INSERT INTO passengers (name, flight_id) VALUES ('Alice', 1);
INSERT INTO passengers (name, flight_id) VALUES ('Bob', 2);
INSERT INTO passengers (name, flight_id) VALUES ('Charlie', 3);
INSERT INTO passengers (name, flight_id) VALUES ('David', 3);
INSERT INTO passengers (name, flight_id) VALUES ('Erin', 4);
INSERT INTO passengers (name, flight_id) VALUES ('Frank', 5);
INSERT INTO passengers (name, flight_id) VALUES ('Grace', 2);

INSERT INTO locations (code, name) VALUES ('JFK', 'New York');
INSERT INTO locations (code, name) VALUES ('NRT', 'Tokyo');
INSERT INTO locations (code, name) VALUES ('CDG', 'Paris');
INSERT INTO locations (code, name) VALUES ('LIM', 'Lima');
INSERT INTO locations (code, name) VALUES ('SVO', 'Moscow');
INSERT INTO locations (code, name) VALUES ('LHR', 'London');
INSERT INTO locations (code, name) VALUES ('IST', 'Istanbul');
INSERT INTO locations (code, name) VALUES ('PVG', 'Shanghai');


INSERT INTO flights (origin, destination, duration) VALUES ('New York', 'London', 415);
INSERT INTO flights (origin, destination, duration) VALUES ('Shanghai', 'Paris', 716);
INSERT INTO flights (origin, destination, duration) VALUES ('Istanbul', 'Tokyo', 700);
INSERT INTO flights (origin, destination, duration) VALUES ('New York', 'Paris', 435);
INSERT INTO flights (origin, destination, duration) VALUES ('Moscow', 'Paris', 245);
INSERT INTO flights (origin, destination, duration) VALUES ('Lima', 'New York', 455);


SELECT * FROM flights WHERE origin IN ('Lima', 'Istanbul');
SELECT MIN(duration) FROM flights;
SELECT COUNT(*) FROM flights WHERE origin = 'Moscow';
SELECT * FROM flights WHERE origin != 'Moscow' OR duration = 700;
ALTER TABLE fligts RENAME TO flights;
INSERT INTO flights (origin, destination, duration) VALUES ('New York', 'London', 415);
SELECT AVG(duration) FROM flights;
SELECT MAX(duration) FROM flights;
SELECT * FROM flights WHERE origin LIKE '%a%';


UPDATE flights
    SET duration = 430
    WHERE origin = 'New York'
    AND destination = 'London';

SELECT * FROM flights;

DELETE FROM flights WHERE origin = 'Lima';


SELECT * FROM flights LIMIT 2;

SELECT * FROM flights ORDER BY duration ASC;

SELECT * FROM flights ORDER BY duration ASC LIMIT 3;


SELECT * FROM flights ORDER BY duration DESC LIMIT 3;

SELECT origin, COUNT(*) FROM flights GROUP BY origin;

SELECT origin, COUNT(*) FROM flights GROUP BY origin HAVING COUNT(*) > 1;

SELECT origin, destination, name FROM flights JOIN passengers ON passengers.flight_id = flights.id;

SELECT origin, destination, name FROM flights JOIN passengers ON passengers.flight_id = flights.id WHERE name = 'Alice';

SELECT origin, destination, name FROM flights LEFT JOIN passengers ON passengers.flight_id = flights.id WHERE name = 'Alice';

SELECT flight_id FROM passengers GROUP BY flight_id HAVING COUNT(*) > 1;
