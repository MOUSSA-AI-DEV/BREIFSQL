-- CRUD Operations : Insérer un nouveau patient nommé "Alex Johnson", né le 15 juillet 1990, de sexe masculin, avec le numéro de téléphone "1234567890".


insert into patient (first_name ,last_name,gender, date_of_birthday,phone_number) values( 'alex' ,'johnos','male','1990-07-15','1234567890')

  -- SELECT Statement : Récupérez tous les départements avec leurs emplacements.
  select *from departement

-- ORDER BY Clause : Trier les patients par date de naissance Listez tous les patients, triés par date de naissance dans l'ordre croissant.
      select * from patient order by date_of_birthday ASC;
-- Filtrer les patients uniques par sexe (DISTINCT) Récupérez tous les sexes des patients enregistrés, sans doublons.
SELECT DISTINCT (gender) FROM patient;


-- LIMIT Clause : Obtenir les 3 premiers médecins Récupérez les trois premiers médecins dans la table doctors.
   select*from doctors limit 2
-- WHERE Clause : Patients nés après 2000 Récupérez les informations des patients nés après l'année 2000.
select *from patient  where date_of_birthday >='1990-01-01'

-- Logical Operators : Médecins dans des départements spécifiques Récupérez les médecins des départements "Cardiology" et "Neurology".
-- where in ('neurologie ,cardiologie')
select  *from doctors where specialization = 'Neurologue'and'cardiologue'


-- Special Operators : Vérifier des plages de dates Listez les admissions entre le 1er décembre et le 7 décembre 2024.
select *from admissions where admission_date between '2024-01-10'and'2024-01-15'

-- Conditional Expressions : Nommer les catégories d'âge des patients Ajoutez une colonne catégorisant les patients en "Enfant", "Adulte", ou "Senior" selon leur âge.

-- Fonction	Retourne	Type	Exemple	Usage typique

-- CURDATE()	Date seulement	DATE	'2024-01-15'	Filtres par jour
-- CURRENT_TIMESTAMP	Date + Heure	TIMESTAMP	'2024-01-15 14:30:45'	Horodatage précis
-- NOW()	Date + Heure	TIMESTAMP	'2024-01-15 14:30:45'	Identique à CURRENT_TIMESTAMP
-- CURRENT_TIME	Heure seulement	TIME	'14:30:45'	Heure actuelle

select  first_name,last_name , case 
 	when timestampdiff(year,date_of_birthday,curdate()) <18 then 'enfant'
 	when timestampdiff(year,date_of_birthday,curdate()) between 18 and 60 then 'adult'
 	else 'senior'
 end from patient
-- Aggregate Functions : Nombre total de rendez-vous Comptez le nombre total de rendez-vous enregistrés.

-- COUNT avec GROUP BY : Comptez le nombre de médecins dans chaque département.
select department_id,count(*) as docotor_number from doctors
group by department_id 

-- AVG : Calculez l'âge moyen des patients.

select avg(TIMESTAMPDIFF(year, date_of_birthday,curdate())) from patient
-- MAX : Dernier rendez-vous Trouvez la date et l'heure du dernier rendez-vous enregistré.
select max(CONCAT(appointment_date,' ',appointment_time)) from appointments

-- SUM : Total des admissions par chambre Calculez le total des admissions pour chaque chambre.
select room_id, sum(admission_id) as  some from admissions group by room_id
select room_id, count(*) as somme from admissions group by room_id
-- Constraints : Vérifier les patients sans e-mail Récupérez tous les patients dont le champ email est vide.

select* from patient where email is null  

-- Jointure : Liste des rendez-vous avec noms des médecins et patients Récupérez les rendez-vous avec les noms des médecins et des patients.

select doctors.first_name, patient.first_name,appointments.appointment_id from appointments inner join patient on appointments.appointment_id=patient.patient_id  join doctors on doctors.doctor_id=appointments.appointment_id    
-- DELETE : Supprimez tous les rendez-vous programmés avant 2024.

delete from appointments WHERE appointment_date < '2024-01-01';


-- UPDATE : Changez le nom du département "Oncology" en "Cancer Treatment".
update departement
set departement_name='buggs'
where departement_name='Oncology'

-- HAVING Clause : Patients par sexe avec au moins 2 entrées Listez les genres ayant au moins deux patients.

select  gender ,count(*) from patient group by gender having count(*) >=2


-- Créer une vue : Admissions actives Créez une vue listant toutes les admissions en cours.

CREATE VIEW active_admissions AS
SELECT * FROM admissions
WHERE room_id =2;

-- Questions bonus pour les jointures:

-- Bonus 1: Patients et leurs médecins traitants

-- Récupérez les noms des patients et les noms de leurs médecins traitants à partir des tables patients, admissions, et doctors.
-- Bonus 2: Liste des rendez-vous par département

-- Récupérez la liste des rendez-vous avec les départements associés.
-- Bonus 3: Médicaments prescrits par médecin

-- Listez les médicaments prescrits par chaque médecin.
-- Bonus 4: Admissions et leurs chambres associées

-- Récupérez les informations des admissions et des chambres où les patients sont placés.
-- Bonus 5: Statistiques des patients par département

-- Comptez le nombre de patients associés à chaque département via leurs admissions.