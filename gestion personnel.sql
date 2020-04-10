-- Script généré par WinDev le 10/04/2020 23:02:17
-- Tables de l'analyse gestion personnel.wda
-- pour SQL générique (ANSI 92)

-- Création de la table competences
CREATE TABLE "competences" (
    "IDcompetences" NUMERIC(19,0)  PRIMARY KEY ,
    "libelle" VARCHAR(255) ,
    "IDpostes" NUMERIC(19,0) );
CREATE INDEX "WDIDX_competences_IDpostes" ON "competences" ("IDpostes");

-- Création de la table compte
CREATE TABLE "compte" (
    "IDcompte" NUMERIC(19,0)  PRIMARY KEY ,
    "nomUtilisateur" VARCHAR(255) ,
    "motPasse" VARCHAR(255) ,
    "IDemploye" NUMERIC(19,0) );
CREATE INDEX "WDIDX_compte_IDemploye" ON "compte" ("IDemploye");

-- Création de la table demandeFormation
CREATE TABLE "demandeFormation" (
    "IDdemandeFormation" NUMERIC(19,0)  PRIMARY KEY ,
    "dateDemande" DATE ,
    "accord" VARCHAR(1) ,
    "refus" VARCHAR(1) ,
    "raisonRefus" VARCHAR(255) ,
    "IDemploye" NUMERIC(19,0) ,
    "IDformations" NUMERIC(19,0) );
CREATE INDEX "WDIDX_demandeFormation_IDemploye" ON "demandeFormation" ("IDemploye");
CREATE INDEX "WDIDX_demandeFormation_IDformations" ON "demandeFormation" ("IDformations");

-- Création de la table dossiers
CREATE TABLE "dossiers" (
    "IDdossiers" NUMERIC(19,0)  PRIMARY KEY ,
    "nom" VARCHAR(255) ,
    "contenu" LONGVARBINARY ,
    "IDemploye" NUMERIC(19,0) );
CREATE INDEX "WDIDX_dossiers_IDemploye" ON "dossiers" ("IDemploye");

-- Création de la table employe
CREATE TABLE "employe" (
    "IDemploye" NUMERIC(19,0)  PRIMARY KEY ,
    "nomPrenom" VARCHAR(255) ,
    "dateNaissance" DATE ,
    "adresse" VARCHAR(255) ,
    "sexe" VARCHAR(1) ,
    "email" VARCHAR(255) ,
    "telephone" VARCHAR(255) ,
    "photo" LONGVARBINARY ,
    "IDpostes" NUMERIC(19,0) );
CREATE INDEX "WDIDX_employe_IDpostes" ON "employe" ("IDpostes");

-- Création de la table formations
CREATE TABLE "formations" (
    "IDformations" NUMERIC(19,0)  PRIMARY KEY ,
    "libelle" VARCHAR(255) ,
    "nbreJour" INTEGER );

-- Création de la table postes
CREATE TABLE "postes" (
    "IDpostes" NUMERIC(19,0)  PRIMARY KEY ,
    "libelle" VARCHAR(255) );

-- Création de la table selection
CREATE TABLE "selection" (
    "IDselection" NUMERIC(19,0)  PRIMARY KEY ,
    "dateSelection" VARCHAR(50) ,
    "IDemploye" NUMERIC(19,0) );
CREATE INDEX "WDIDX_selection_IDemploye" ON "selection" ("IDemploye");

-- Création de la table tests
CREATE TABLE "tests" (
    "IDtests" NUMERIC(19,0)  PRIMARY KEY ,
    "dateTeste" DATE ,
    "etat" VARCHAR(50) ,
    "IDemploye" NUMERIC(19,0) ,
    "IDcompetences" NUMERIC(19,0) );
CREATE INDEX "WDIDX_tests_IDemploye" ON "tests" ("IDemploye");
CREATE INDEX "WDIDX_tests_IDcompetences" ON "tests" ("IDcompetences");
-- Contraintes d'intégrité
ALTER TABLE "employe" ADD FOREIGN KEY ("IDpostes") REFERENCES "postes" ("IDpostes");
ALTER TABLE "compte" ADD FOREIGN KEY ("IDemploye") REFERENCES "employe" ("IDemploye");
ALTER TABLE "dossiers" ADD FOREIGN KEY ("IDemploye") REFERENCES "employe" ("IDemploye");
ALTER TABLE "competences" ADD FOREIGN KEY ("IDpostes") REFERENCES "postes" ("IDpostes");
ALTER TABLE "tests" ADD FOREIGN KEY ("IDemploye") REFERENCES "employe" ("IDemploye");
ALTER TABLE "tests" ADD FOREIGN KEY ("IDcompetences") REFERENCES "competences" ("IDcompetences");
ALTER TABLE "selection" ADD FOREIGN KEY ("IDemploye") REFERENCES "employe" ("IDemploye");
ALTER TABLE "demandeFormation" ADD FOREIGN KEY ("IDemploye") REFERENCES "employe" ("IDemploye");
ALTER TABLE "demandeFormation" ADD FOREIGN KEY ("IDformations") REFERENCES "formations" ("IDformations");
