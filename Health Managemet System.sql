CREATE DATABASE PatientsDB;
USE PatientsDB;

CREATE TABLE Patients (
    patient_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender VARCHAR(10),
    contact VARCHAR(50),
    address TEXT,
    blood_type VARCHAR(5),
    emergency_contact VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Doctors (
    doctor_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    contact VARCHAR(50),
    availability_status BOOLEAN DEFAULT TRUE
);
CREATE TABLE Appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES Patients(patient_id),
    doctor_id INT REFERENCES Doctors(doctor_id),
    appointment_date TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Scheduled'
);
DROP TABLE IF EXISTS Maternal_Records;

CREATE TABLE Maternal_Records (
    maternal_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    patient_id BIGINT UNSIGNED NOT NULL,
    pregnancy_start DATE NOT NULL,
    expected_delivery DATE,
    actual_delivery DATE,
    outcome VARCHAR(50),
    follow_up_notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);


CREATE TABLE Lab_Tests (
    test_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES Patients(patient_id),
    doctor_id INT REFERENCES Doctors(doctor_id),
    test_type VARCHAR(100),
    result TEXT,
    test_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Pharmacy (
    medicine_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    stock_quantity INT,
    expiry_date DATE,
    price DECIMAL(10,2)
);
CREATE TABLE Billing (
    bill_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES Patients(patient_id),
    appointment_id INT REFERENCES Appointments(appointment_id),
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20) DEFAULT 'Unpaid',
    payment_date TIMESTAMP
);
USE PatientsDB;
SHOW TABLES LIKE 'Maternal_Records';

CREATE TABLE Prescription (
    prescription_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    maternal_id BIGINT UNSIGNED NOT NULL,
    medication VARCHAR(100),
    dosage VARCHAR(50),
    start_date DATE,
    end_date DATE
);
-- 1. Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS PatientsDB;

-- 2. Use the database
USE PatientsDB;

-- 3. Create Patients table
CREATE TABLE IF NOT EXISTS Patients (
    patient_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender VARCHAR(10),
    contact VARCHAR(50),
    address TEXT,
    blood_type VARCHAR(5),
    emergency_contact VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Create Doctors table
CREATE TABLE IF NOT EXISTS Doctors (
    doctor_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    contact VARCHAR(50),
    availability_status BOOLEAN DEFAULT TRUE
);

-- 5. Create Maternal_Records table
CREATE TABLE IF NOT EXISTS Maternal_Records (
    maternal_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    patient_id BIGINT UNSIGNED NOT NULL,
    pregnancy_start DATE NOT NULL,
    expected_delivery DATE,
    actual_delivery DATE,
    outcome VARCHAR(50),
    follow_up_notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- 6. Create Prescription table
CREATE TABLE IF NOT EXISTS Prescription (
    prescription_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    maternal_id BIGINT UNSIGNED NOT NULL,
    medication VARCHAR(100),
    dosage VARCHAR(50),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (maternal_id) REFERENCES Maternal_Records(maternal_id)
);

-- 7. (Optional) Create Appointments table
CREATE TABLE IF NOT EXISTS Appointments (
    appointment_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    patient_id BIGINT UNSIGNED NOT NULL,
    doctor_id BIGINT UNSIGNED NOT NULL,
    appointment_date DATETIME NOT NULL,
    notes TEXT,
    maternal_id BIGINT UNSIGNED,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (maternal_id) REFERENCES Maternal_Records(maternal_id)
);

-- 8. (Optional) Create Lab_Tests table
CREATE TABLE IF NOT EXISTS Lab_Tests (
    test_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    maternal_id BIGINT UNSIGNED NOT NULL,
    test_type VARCHAR(100),
    test_date DATE,
    results TEXT,
    FOREIGN KEY (maternal_id) REFERENCES Maternal_Records(maternal_id)
);

-- 9. (Optional) Create Billing table
CREATE TABLE IF NOT EXISTS Billing (
    bill_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    maternal_id BIGINT UNSIGNED NOT NULL,
    item VARCHAR(100),
    cost DECIMAL(10,2),
    bill_date DATE,
    FOREIGN KEY (maternal_id) REFERENCES Maternal_Records(maternal_id)
);

-- 1. Create database
CREATE DATABASE IF NOT EXISTS VetDB;
USE VetDB;

-- 2. Owners table
CREATE TABLE IF NOT EXISTS Owners (
    owner_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    contact VARCHAR(50),
    address TEXT
);

-- 3. Animals table
CREATE TABLE IF NOT EXISTS Animals (
    animal_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    species VARCHAR(50),  -- Dog, Cat, Cow, Elephant, etc.
    breed VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    owner_id BIGINT UNSIGNED NULL,
    medical_history TEXT,
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
);

-- 4. Veterinarians table
CREATE TABLE IF NOT EXISTS Veterinarians (
    vet_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100), -- Small animals, large animals, wildlife
    contact VARCHAR(50),
    availability_status BOOLEAN DEFAULT TRUE
);

-- 5. Appointments table
CREATE TABLE IF NOT EXISTS Appointments (
    appointment_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    animal_id BIGINT UNSIGNED NOT NULL,
    vet_id BIGINT UNSIGNED NOT NULL,
    appointment_date TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (animal_id) REFERENCES Animals(animal_id),
    FOREIGN KEY (vet_id) REFERENCES Veterinarians(vet_id)
);

-- 6. Treatments table
CREATE TABLE IF NOT EXISTS Treatments (
    treatment_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    animal_id BIGINT UNSIGNED NOT NULL,
    vet_id BIGINT UNSIGNED NOT NULL,
    diagnosis TEXT,
    medication TEXT,
    treatment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    follow_up_date TIMESTAMP,
    FOREIGN KEY (animal_id) REFERENCES Animals(animal_id),
    FOREIGN KEY (vet_id) REFERENCES Veterinarians(vet_id)
);

-- 7. Vaccinations table
CREATE TABLE IF NOT EXISTS Vaccinations (
    vaccination_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    animal_id BIGINT UNSIGNED NOT NULL,
    vaccine_name VARCHAR(100),
    vaccination_date TIMESTAMP,
    next_due_date TIMESTAMP,
    FOREIGN KEY (animal_id) REFERENCES Animals(animal_id)
);

-- 8. Pharmacy table
CREATE TABLE IF NOT EXISTS Pharmacy (
    medicine_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    stock_quantity INT,
    expiry_date DATE,
    price DECIMAL(10,2)
);

-- 9. Billing table
CREATE TABLE IF NOT EXISTS Billing (
    bill_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    animal_id BIGINT UNSIGNED NOT NULL,
    appointment_id BIGINT UNSIGNED,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20) DEFAULT 'Unpaid',
    payment_date TIMESTAMP,
    FOREIGN KEY (animal_id) REFERENCES Animals(animal_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);


CREATE DATABASE IF NOT EXISTS VetClinicDB;
USE VetClinicDB;

CREATE TABLE IF NOT EXISTS Owners (
    owner_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    contact VARCHAR(50) UNIQUE,
    address TEXT
);

CREATE TABLE IF NOT EXISTS Animals (
    animal_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    species VARCHAR(50),
    breed VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    owner_id BIGINT UNSIGNED,
    medical_history TEXT,
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
);

CREATE TABLE IF NOT EXISTS Veterinarians (
    vet_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    contact VARCHAR(50) UNIQUE,
    availability_status BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS Appointments (
    appointment_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    animal_id BIGINT UNSIGNED NOT NULL,
    vet_id BIGINT UNSIGNED NOT NULL,
    appointment_date TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (animal_id) REFERENCES Animals(animal_id),
    FOREIGN KEY (vet_id) REFERENCES Veterinarians(vet_id)
);

CREATE TABLE IF NOT EXISTS Treatments (
    treatment_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE IF NOT EXISTS Appointment_Treatments (
    appointment_id BIGINT UNSIGNED NOT NULL,
    treatment_id BIGINT UNSIGNED NOT NULL,
    notes TEXT,
    PRIMARY KEY (appointment_id, treatment_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

CREATE TABLE IF NOT EXISTS Medicines (
    medicine_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Inventory (
    inventory_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    medicine_id BIGINT UNSIGNED NOT NULL,
    stock_quantity INT,
    expiry_date DATE,
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);

CREATE TABLE IF NOT EXISTS Animal_Medications (
    animal_id BIGINT UNSIGNED NOT NULL,
    medicine_id BIGINT UNSIGNED NOT NULL,
    dosage VARCHAR(50),
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (animal_id, medicine_id),
    FOREIGN KEY (animal_id) REFERENCES Animals(animal_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);

CREATE TABLE IF NOT EXISTS Vaccinations (
    vaccination_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    animal_id BIGINT UNSIGNED NOT NULL,
    vaccine_name VARCHAR(100),
    vaccination_date TIMESTAMP,
    next_due_date TIMESTAMP,
    FOREIGN KEY (animal_id) REFERENCES Animals(animal_id)
);

CREATE TABLE IF NOT EXISTS Billing (
    bill_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    animal_id BIGINT UNSIGNED NOT NULL,
    appointment_id BIGINT UNSIGNED,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20) DEFAULT 'Unpaid',
    payment_date TIMESTAMP,
    FOREIGN KEY (animal_id) REFERENCES Animals(animal_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE INDEX idx_appointment_date ON Appointments(appointment_date);
CREATE INDEX idx_specialization ON Veterinarians(specialization);
CREATE INDEX idx_vaccine_name ON Vaccinations(vaccine_name);
CREATE INDEX idx_medicine_name ON Medicines(name);



