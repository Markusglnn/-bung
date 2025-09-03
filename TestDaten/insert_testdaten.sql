
INSERT INTO nutzer VALUES (seq_nutzer.NEXTVAL, 'Anna', 'Meier', 'anna.meier@example.com', 'IT');
INSERT INTO nutzer VALUES (seq_nutzer.NEXTVAL, 'Max', 'Müller', 'max.mueller@example.com', 'HR');


INSERT INTO medium VALUES (seq_medium.NEXTVAL, 'Der Herr der Ringe', 'Buch', 3, 3);
INSERT INTO medium VALUES (seq_medium.NEXTVAL, 'Inception', 'Blu-ray', 2, 2);


INSERT INTO bewertung VALUES (seq_bewertung.NEXTVAL, 1, 1, 5, 'Super Buch!', SYSDATE);
INSERT INTO bewertung VALUES (seq_bewertung.NEXTVAL, 2, 2, 4, 'Spannender Film!', SYSDATE);


INSERT INTO event VALUES (seq_event.NEXTVAL, 'Filmabend: Inception', 'Diskussion über den Film', 2, TO_DATE('2025-09-15 19:00', 'YYYY-MM-DD HH24:MI'), 'Meetingraum 1');

INSERT INTO teilnahme VALUES (seq_teilnahme.NEXTVAL, 1, 1);
-- seq... nextval braucht man um den nöchst verfügbaren Wert zu holen. (ID)