DROP SCHEMA taxicompanyschema IF EXISTS;
DROP DATABASE taxicompanyschema.taxicompany IF EXISTS;

CREATE SCHEMA taxicompanyschema;
CREATE DATABASE taxicompanyschema.taxicompany;

CREATE TABLE customer(
	id RECORD,
	name VARCHAR(255) NOT NULL,
	cpf VARCHAR(255) NOT NULL UNIQUE,
);

CREATE TABLE trip(
	trip_date DATE NOT NULL,
	client_id INTEGER,
	taxi_id INTEGER
);

CREATE TABLE taxi(
	plate VARCHAR(255),
	brand VARCHAR(255) NOT NULL,
	model VARCHAR(255) NOT NULL,
	manufacture_year DATE NOT NULL
);


-- constraints --
ALTER TABLE ONLY taxicompanyschema.customer
	ADD CONSTRAINT customer_id PRIMARY KEY(id);

ALTER TABLE ONLY taxicompanyschema.trip
	ADD CONSTRAINT trip_pk PRIMARY KEY(client_id, taxi_id);

ALTER TABLE ONLY taxicompanyschema.trip
	ADD CONSTRAINT trip_customer_id FOREIGN KEY(client_id)
	REFERENCES taxicompanyschema.customer(id);

ALTER TABLE ONLY taxicompanyschema.trip
	ADD CONSTRAINT trip_taxi_id FOREIGN KEY(taxi_id)
	REFERENCES taxicompanyschema.taxi(id);

ALTER TABLE ONLY taxicompanyschema.taxi
	ADD CONSTRAINT taxi_pk PRIMARY KEY(plate);