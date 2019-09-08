DROP SCHEMA IF EXISTS taxicompanyschema CASCADE;

CREATE SCHEMA taxicompanyschema;

CREATE TABLE taxicompanyschema.customer(
	id INTEGER,
	name VARCHAR(255) NOT NULL,
	cpf VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE taxicompanyschema.trip(
	client_id INTEGER,
	taxi_fk VARCHAR(255),
	trip_date DATE NOT NULL
);

CREATE TABLE taxicompanyschema.taxi(
	plate VARCHAR(255),
	brand VARCHAR(255) NOT NULL,
	model VARCHAR(255) NOT NULL,
	manufacture_year INTEGER NOT NULL,
	license VARCHAR(255) NOT NULL
);


-- constraints --
ALTER TABLE ONLY taxicompanyschema.customer
	ADD CONSTRAINT customer_id PRIMARY KEY(id);

ALTER TABLE ONLY taxicompanyschema.trip
	ADD CONSTRAINT trip_pk PRIMARY KEY(client_id, taxi_fk);

ALTER TABLE ONLY taxicompanyschema.taxi
	ADD CONSTRAINT taxi_pk PRIMARY KEY(plate);

ALTER TABLE ONLY taxicompanyschema.trip
	ADD CONSTRAINT trip_customer_id FOREIGN KEY(client_id)
	REFERENCES taxicompanyschema.customer(id);

ALTER TABLE ONLY taxicompanyschema.trip
	ADD CONSTRAINT trip_taxi_fk FOREIGN KEY(taxi_fk)
	REFERENCES taxicompanyschema.taxi(plate);
	
-- ********************************************************************************

INSERT INTO taxicompanyschema.customer VALUES
(1532, 'Asdrúbal', '448.754.253-65'),
(1755, 'Doriana', '567.387.387-44'),
(1780, 'Quincas', '546.373.762-02');

INSERT INTO taxicompanyschema.taxi VALUES
('DAE6534', 'Ford', 'Fiesta', 1999, 'MN572345'),
('DKL4598', 'Volkswagen', 'Gol', 2001, 'AU876543'),
('DKL7878', 'Ford', 'Fiesta', 2001, 'OP102938'),
('JDM8776', 'Volkswagen', 'Santana', 2002, 'QM365923'),
('JJM3692', 'Chevrolet', 'Corsa', 1999, 'UU335577'),
('DXF5263', 'Nissan', 'Tiida', 2010, 'UU311577'),
('DXA7878', 'Nissan', 'Versa', 1997, 'UU322227');

INSERT INTO taxicompanyschema.trip VALUES
(1755, 'DAE6534', '2003-02-15'),
(1780, 'JDM8776', '2003-02-18'),
(1755, 'DKL7878', '2003-02-16'),
(1780, 'DKL4598', '2003-02-17'),
(1532, 'DKL4598', '2003-02-16');

