Health Management System – README
Project Overview
This project is a relational database system designed to manage healthcare records across two domains: maternity care and veterinary services. It supports data tracking for patients, animals, medical professionals, appointments, treatments, medications, billing, and vaccinations.

The system is built using MySQL and follows best practices in relational database design, including normalization, constraints, and indexing.

Database Structure
Maternity Care Tables
Patients Stores personal details of human patients, including contact info and emergency contacts.

Maternal_Records Tracks pregnancy-related data such as start dates, expected delivery, outcomes, and follow-up notes.

Prescription Records medications prescribed during maternity care, linked to maternal records.

Lab_Tests Stores lab test results for maternity patients.

Billing Tracks costs and payments related to maternity services.

Veterinary Care Tables
Owners Stores pet owner information.

Animals Stores details about animals, including species, breed, and medical history.

Veterinarians Stores vet information and specialization.

Appointments Tracks scheduled visits between animals and veterinarians.

Treatments Stores types of treatments offered at the clinic.

Appointment_Treatments Links multiple treatments to a single appointment (many-to-many).

Medicines Stores medicine details.

Inventory Tracks stock levels and expiry dates for each medicine.

Animal_Medications Links animals to the medicines they’ve received (many-to-many).

Vaccinations Tracks vaccines administered to animals.

Billing Records payments for veterinary appointments.

Constraints Used
PRIMARY KEY on all main tables

FOREIGN KEY to enforce relationships

UNIQUE on contact fields to prevent duplicates

DEFAULT values for fields like availability status and payment status

Indexes Added
To improve performance on frequent queries:

appointment_date in Appointments

specialization in Veterinarians

vaccine_name in Vaccinations

name in Medicines

How to Use
Run the .sql file in a MySQL environment such as MySQL Workbench or phpMyAdmin

The database will be created with all tables and relationships

You can insert sample data and begin querying or building applications on top of it