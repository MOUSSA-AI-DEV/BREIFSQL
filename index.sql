create table `patient`(
patient_id int auto_increment primary key,
first_name varchar (50),
last_name varchar(50),
gender enum('Male','female','other'),
date_of_birthday date,
phone_number varchar(15),
email varchar(100),
address varchar(255)

)

 create table `departement` (
 departement_id int auto_increment primary key ,
 departement_name varchar(50),
 location varchar(100))


 
CREATE TABLE `doctors` (
  doctor_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  specialization VARCHAR(50),
  phone_number VARCHAR(15),
  email VARCHAR(100),
  department_id INT,
  foreign key (department_id) references departement(departement_id));

  CREATE TABLE `staff` (
  staff_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  job_title VARCHAR(50),
  phone_number VARCHAR(15),
  email VARCHAR(100),
  departement_id INT,
foreign key (departement_id) references departement(departement_id));


CREATE TABLE `rooms` (
  room_id INT AUTO_INCREMENT PRIMARY KEY,
  room_number VARCHAR(10),
  room_type ENUM('General','Private','ICU'),
  availability float 
);


CREATE table `admissions` (
  admission_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT,
  room_id INT,
  admission_date DATE,
  discharge_date DATE,
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
    ON DELETE CASCADE,
  FOREIGN KEY (room_id) REFERENCES rooms(room_id)
  
);

CREATE TABLE `appointments` (
  appointment_id INT AUTO_INCREMENT PRIMARY KEY,
  appointment_date DATE,
  appointment_time TIME,
  doctor_id INT,
  patient_id INT,
  reason VARCHAR(255),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);


CREATE TABLE `medications` (
  medication_id INT AUTO_INCREMENT PRIMARY KEY,
  medication_name VARCHAR(100),
  dosage VARCHAR(50)
);
CREATE TABLE `prescriptions` (
  prescription_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT,
  doctor_id INT,
  medication_id INT,
  prescription_date DATE,
  dosage_instructions VARCHAR(255),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
  FOREIGN KEY (medication_id) REFERENCES medications(medication_id)
);
-- implementation des tableaux

INSERT INTO `departement` ( departement_name, location) VALUES
( 'Cardiology', 'Building A'),
( 'Neurology', 'Building B'),
( 'Pediatrics', 'Building C'),
( 'Oncology', 'Building D'),
( 'Dermatology', 'Building E'),
( 'Orthopedics', 'Building F'),
( 'Radiology', 'Building G'),
( 'Emergency', 'Building H'),
( 'Urology', 'Building I'),
( 'Gastroenterology', 'Building J');

INSERT INTO `patient` (first_name, last_name, gender, date_of_birthday, phone_number, email, address) VALUES
('Jean', 'Dupont', 'Male', '1980-05-15', '0612345678', 'jean.dupont@email.com', '12 Rue de la Paix, Paris'),
('Marie', 'Martin', 'Female', '1992-08-22', '0623456789', 'marie.martin@email.com', '45 Avenue des Champs, Lyon'),
('Pierre', 'Durand', 'Male', '1975-11-30', '0634567890', 'pierre.durand@email.com', '78 Boulevard Voltaire, Marseille'),
('Sophie', 'Bernard', 'Female', '1988-03-10', '0645678901', 'sophie.bernard@email.com', '33 Rue du Commerce, Lille'),
('Thomas', 'Petit', 'Male', '1995-07-18', '0656789012', 'thomas.petit@email.com', '90 Avenue Foch, Toulouse'),
('Julie', 'Robert', 'Female', '1983-12-05', '0667890123', 'julie.robert@email.com', '56 Rue de la République, Bordeaux'),
('Nicolas', 'Richard', 'Male', '1970-09-25', '0678901234', 'nicolas.richard@email.com', '21 Place Bellecour, Lyon'),
('Isabelle', 'Moreau', 'Female', '1990-01-14', '0689012345', 'isabelle.moreau@email.com', '14 Rue de Rivoli, Paris'),
('David', 'Simon', 'Male', '1986-06-08', '0690123456', 'david.simon@email.com', '67 Avenue Victor Hugo, Nice'),
('Laura', 'Michel', 'Female', '1998-04-19', '0601234567', 'laura.michel@email.com', '89 Boulevard Saint-Michel, Montpellier');


INSERT INTO `doctors` (first_name, last_name, specialization, phone_number, email, department_id) VALUES
('Dr. Alain', 'Lefebvre', 'Cardiologue', '0712345678', 'a.lefebvre@hospital.com', 1),
('Dr. Claire', 'Dubois', 'Neurologue', '0723456789', 'c.dubois@hospital.com', 2),
('Dr. Paul', 'Rousseau', 'Pédiatre', '0734567890', 'p.rousseau@hospital.com', 3),
('Dr. Émilie', 'Fournier', 'Chirurgien', '0745678901', 'e.fournier@hospital.com', 4),
('Dr. Marc', 'Girard', 'Urgentiste', '0756789012', 'm.girard@hospital.com', 5),
('Dr. Nathalie', 'Mercier', 'Radiologue', '0767890123', 'n.mercier@hospital.com', 6),
('Dr. Laurent', 'Blanc', 'Oncologue', '0778901234', 'l.blanc@hospital.com', 7),
('Dr. Caroline', 'Chevalier', 'Psychiatre', '0789012345', 'c.chevalier@hospital.com', 8),
('Dr. Philippe', 'Perrin', 'Orthopédiste', '0790123456', 'p.perrin@hospital.com', 9),
('Dr. Valérie', 'Rivière', 'Médecin Interne', '0701234567', 'v.riviere@hospital.com', 10);


INSERT INTO `medications` (medication_name, dosage) VALUES
('Paracétamol', '500mg'),
('Ibuprofène', '400mg'),
('Amoxicilline', '1g'),
('Atorvastatine', '20mg'),
('Métoprolol', '50mg'),
('Lévothyroxine', '75mcg'),
('Oméprazole', '20mg'),
('Sertraline', '50mg'),
('Simvastatine', '40mg'),
('Losartan', '50mg');


INSERT INTO rooms (room_number, room_type, availability) VALUES
('101', 'General', TRUE),
('102', 'General', TRUE),
('201', 'Private', FALSE),
('202', 'Private', TRUE),
('301', 'ICU', FALSE),
('302', 'ICU', TRUE),
('103', 'General', TRUE),
('203', 'Private', FALSE),
('303', 'ICU', TRUE),
('104', 'General', TRUE);

INSERT INTO prescriptions (patient_id, doctor_id, medication_id, prescription_date, dosage_instructions) VALUES
(1, 1, 1, '2024-01-15', '1 comprimé toutes les 6 heures pendant 5 jours'),
(2, 2, 2, '2024-01-16', '1 comprimé matin et soir avec les repas'),
(3, 3, 3, '2024-01-17', '1 comprimé 3 fois par jour pendant 7 jours'),
(4, 4, 4, '2024-01-18', '1 comprimé le soir avant le coucher'),
(5, 5, 5, '2024-01-19', '1 comprimé matin et soir'),
(6, 6, 6, '2024-01-20', '1 comprimé à jeun le matin'),
(7, 7, 7, '2024-01-21', '1 comprimé 30 minutes avant le petit déjeuner'),
(8, 8, 8, '2024-01-22', '1 comprimé le matin'),
(9, 9, 9, '2024-01-23', '1 comprimé le soir'),
(10, 10, 10, '2024-01-24', '1 comprimé par jour');



INSERT INTO admissions (patient_id, room_id, admission_date, discharge_date) VALUES
(1, 1, '2024-01-10', '2024-01-15'),
(2, 2, '2024-01-11', '2024-01-16'),
(3, 3, '2024-01-12', '2024-01-20'),
(4, 4, '2024-01-13', NULL),
(5, 5, '2024-01-14', '2024-01-18'),
(6, 6, '2024-01-15', NULL),
(7, 7, '2024-01-16', '2024-01-22'),
(8, 8, '2024-01-17', '2024-01-25'),
(9, 9, '2024-01-18', NULL),
(10, 10, '2024-01-19', '2024-01-24');


INSERT INTO appointments (appointment_date, appointment_time, doctor_id, patient_id, reason) VALUES
('2024-02-01', '09:00:00', 1, 1, 'Consultation de routine cardiologie'),
('2024-02-02', '10:30:00', 2, 2, 'Suivi neurologique'),
('2024-02-03', '14:00:00', 3, 3, 'Consultation pédiatrique'),
('2024-02-04', '11:15:00', 4, 4, 'Pré-opératoire chirurgie'),
('2024-02-05', '16:45:00', 5, 5, 'Suivi post-urgences'),
('2024-02-06', '08:30:00', 6, 6, 'Examen radiologique'),
('2024-02-07', '13:20:00', 7, 7, 'Consultation oncologique'),
('2024-02-08', '15:10:00', 8, 8, 'Suivi psychiatrique'),
('2024-02-09', '10:00:00', 9, 9, 'Contrôle orthopédique'),
('2024-02-10', '17:30:00', 10, 10, 'Consultation médecine interne');

INSERT INTO staff (first_name, last_name, job_title, phone_number, email, departement_id) VALUES
('Sarah', 'Lemoine', 'Infirmière', '0812345678', 's.lemoine@hospital.com', 1),
('François', 'Caron', 'Infirmier', '0823456789', 'f.caron@hospital.com', 2),
('Élodie', 'Gauthier', 'Aide-soignante', '0834567890', 'e.gauthier@hospital.com', 3),
('Antoine', 'Barbier', 'Technicien de laboratoire', '0845678901', 'a.barbier@hospital.com', 4),
('Manon', 'Arnaud', 'Secrétaire médicale', '0856789012', 'm.arnaud@hospital.com', 5),
('Julien', 'Guillaume', 'Radiologue assistant', '0867890123', 'j.guillaume@hospital.com', 6),
('Céline', 'Boucher', 'Psychologue', '0878901234', 'c.boucher@hospital.com', 7),
('Rémi', 'Pons', 'Kinésithérapeute', '0889012345', 'r.pons@hospital.com', 8),
('Chloé', 'Guyot', 'Ergothérapeute', '0890123456', 'c.guyot@hospital.com', 9),
('Mathieu', 'Renard', 'Administrateur', '0801234567', 'm.renard@hospital.com', 10);