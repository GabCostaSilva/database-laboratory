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

