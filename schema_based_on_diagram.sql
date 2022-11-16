--Creating a clinic Database
CREATE DATABASE clinic_db;

-- Patient table
CREATE TABLE patients(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    PRIMARY KEY(id)
);

--Medical_History table
CREATE TABLE medical_history(
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(20),
    PRIMARY KEY(id)
    );

--Invoices table
CREATE TABLE invoices(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    paid_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_history(id),
    PRIMARY KEY(id)
    );
--treatment table.
CREATE TABLE treatments(
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(30),
    name VARCHAR(50),
    PRIMARY KEY(id)
);

--Invoice_items table
    CREATE TABLE invoice_items(
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY(id)
    );
--All joined table for many to many realtionship
  CREATE TABLE medical_histories_has_treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    medical_id INT REFERENCES medical_history(id),
    treatment_id INT REFERENCES treatments(id),
    description VARCHAR(255) not null
    );

-- Foreign keys indexs
    CREATE INDEX ON medical_history (patient_id);
    CREATE INDEX ON invoices (medical_history_id);
    CREATE INDEX ON invoice_items(invoice_id); 
    CREATE INDEX ON invoice_items(treatment_id);
    CREATE INDEX ON medical_histories_has_treatments(medical_id);
