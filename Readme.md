Vet Clinic Database – README
Project Overview
This project is a relational database system designed to manage the operations of a veterinary clinic. It handles data related to pet owners, animals, veterinarians, appointments, treatments, medications, billing, and vaccinations.

The database is built using MySQL and follows best practices in relational design, including normalization, constraints, and indexing.

Database Structure
Owners Stores pet owner information, including contact details.

owner_id is the primary key

contact is marked as UNIQUE to prevent duplicates

Animals Stores details about each animal, including species, breed, and medical history.

Linked to Owners via owner_id

Veterinarians Stores vet information and their specialization.

contact is marked as UNIQUE

Appointments Tracks scheduled visits between animals and veterinarians.

Includes appointment date and status

Linked to both Animals and Veterinarians

Treatments Stores types of treatments offered at the clinic

Appointment_Treatments A junction table that links multiple treatments to a single appointment (many-to-many)

Medicines Stores medicine details, separated from inventory for better organization

Inventory Tracks stock levels and expiry dates for each medicine

Linked to Medicines

Animal_Medications Links animals to the medicines they have received (many-to-many)

Includes dosage and treatment duration

Vaccinations Tracks vaccines administered to animals and their next due dates

Billing Records payments for appointments

Linked to both Animals and Appointments

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

The database VetClinicDB will be created with all tables and relationships

You can insert sample data and begin querying or building applications on top of it