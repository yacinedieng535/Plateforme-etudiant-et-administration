-- Crée la base de données
CREATE DATABASE IF NOT EXISTS gestion_notes;
USE gestion_notes;

-- Table des utilisateurs (admin et étudiants)
CREATE TABLE utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(50) NOT NULL,
    mot_de_passe VARCHAR(100) NOT NULL,
    type ENUM('admin','etudiant') NOT NULL
);

-- Table des étudiants
CREATE TABLE etudiants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    matricule VARCHAR(20) NOT NULL UNIQUE,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    adresse VARCHAR(100),
    telephone VARCHAR(20),
    id_utilisateur INT,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id)
);

-- Table des formations
CREATE TABLE formations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(100)
);

-- Table des matières
CREATE TABLE matieres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20),
    libelle VARCHAR(100),
    id_formation INT,
    FOREIGN KEY (id_formation) REFERENCES formations(id)
);

-- Table des notes
CREATE TABLE notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_etudiant INT,
    id_matiere INT,
    note FLOAT,
    FOREIGN KEY (id_etudiant) REFERENCES etudiants(id),
    FOREIGN KEY (id_matiere) REFERENCES matieres(id)
);

-- Données d'exemple

-- Administrateur par défaut
INSERT INTO utilisateurs (login, mot_de_passe, type)
VALUES ('admin@site.com', 'admin123', 'admin');

-- Étudiant par défaut
INSERT INTO utilisateurs (login, mot_de_passe, type)
VALUES ('ETU001', 'etu123', 'etudiant');

-- Informations liées à l'étudiant
INSERT INTO etudiants (matricule, nom, prenom, adresse, telephone, id_utilisateur)
VALUES ('ETU001', 'Doe', 'John', '123 rue exemple', '0102030405', LAST_INSERT_ID());

-- Formation et matière
INSERT INTO formations (libelle)
VALUES ('Informatique');

INSERT INTO matieres (code, libelle, id_formation)
VALUES ('MAT001', 'Programmation Web', 1);

-- Note pour l'étudiant
INSERT INTO notes (id_etudiant, id_matiere, note)
VALUES (1, 1, 15.5);