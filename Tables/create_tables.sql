-- Nutzer-Tabelle
CREATE TABLE nutzer (
    nutzer_id      NUMBER PRIMARY KEY,
    vorname        VARCHAR2(50) NOT NULL,
    nachname       VARCHAR2(50) NOT NULL,
    email          VARCHAR2(100) UNIQUE NOT NULL,
    abteilung      VARCHAR2(50)
);

-- Medium-Tabelle
CREATE TABLE medium (
    medium_id        NUMBER PRIMARY KEY,
    titel            VARCHAR2(100) NOT NULL,
    typ              VARCHAR2(20) CHECK (typ IN ('Buch', 'DVD', 'CD', 'Blu-ray')),
    verfuegbar_anzahl NUMBER NOT NULL,
    gesamt_anzahl     NUMBER NOT NULL CHECK (gesamt_anzahl >= 0)
);

-- Ausleihe-Tabelle
CREATE TABLE ausleihe (
    ausleihe_id     NUMBER PRIMARY KEY,
    nutzer_id       NUMBER REFERENCES nutzer(nutzer_id),
    medium_id       NUMBER REFERENCES medium(medium_id),
    ausleihdatum    DATE DEFAULT SYSDATE,
    rueckgabedatum  DATE,
    status          VARCHAR2(20) DEFAULT 'aktiv' CHECK (status IN ('aktiv', 'zurückgegeben'))
);

-- Bewertung-Tabelle
CREATE TABLE bewertung (
    bewertung_id    NUMBER PRIMARY KEY,
    nutzer_id       NUMBER REFERENCES nutzer(nutzer_id),
    medium_id       NUMBER REFERENCES medium(medium_id),
    sterne          NUMBER CHECK (sterne BETWEEN 1 AND 5),
    kommentar       VARCHAR2(500),
    datum           DATE DEFAULT SYSDATE
);

-- Event-Tabelle
CREATE TABLE event (
    event_id        NUMBER PRIMARY KEY,
    titel           VARCHAR2(100) NOT NULL,
    beschreibung    VARCHAR2(1000),
    medium_id       NUMBER REFERENCES medium(medium_id),
    startzeit       DATE NOT NULL,
    ort             VARCHAR2(100)
);

-- Teilnahme-Tabelle
CREATE TABLE teilnahme (
    teilnahme_id    NUMBER PRIMARY KEY,
    event_id        NUMBER REFERENCES event(event_id),
    nutzer_id       NUMBER REFERENCES nutzer(nutzer_id)
);


CREATE SEQUENCE seq_nutzer START WITH 1;
CREATE SEQUENCE seq_medium START WITH 1;
CREATE SEQUENCE seq_ausleihe START WITH 1;
CREATE SEQUENCE seq_bewertung START WITH 1;
CREATE SEQUENCE seq_event START WITH 1;
CREATE SEQUENCE seq_teilnahme START WITH 1;
