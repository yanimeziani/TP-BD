SELECT * FROM bureau WHERE ID_PAYS = 'JP';

SELECT * FROM bureau ORDER BY ID_PAYS;

SELECT p.ID_PAYS, p.NOM_PAYS, COUNT(b.ID_BUREAU) 
FROM pays p 
JOIN bureau b ON p.ID_PAYS = b.ID_PAYS 
GROUP BY p.ID_PAYS;

SELECT ID_EMPLOI, TITRE_EMPLOI FROM emploi ORDER BY SALAIRE_MAXIMUM DESC LIMIT 1;

SELECT ID_EMPLOI, TITRE_EMPLOI FROM emploi ORDER BY SALAIRE_MAXIMUM DESC LIMIT 1;

SELECT AVG(SALAIRE_MINIMUM) as AVG_MIN_SALARY, AVG(SALAIRE_MAXIMUM) as AVG_MAX_SALARY FROM emploi;

SELECT ID_REGION, COUNT(ID_PAYS) 
FROM pays 
GROUP BY ID_REGION;

SELECT r.NOM_REGION, COUNT(p.ID_PAYS) 
FROM region r 
JOIN pays p ON r.ID_REGION = p.ID_REGION 
GROUP BY r.ID_REGION;

SELECT p.NOM_PAYS, COUNT(b.ID_BUREAU) 
FROM pays p 
JOIN bureau b ON p.ID_PAYS = b.ID_PAYS 
GROUP BY p.ID_PAYS;

CREATE VIEW Vue1 AS 
SELECT r.NOM_REGION, GROUP_CONCAT(p.NOM_PAYS) AS PAYS 
FROM region r 
JOIN pays p ON r.ID_REGION = p.ID_REGION 
GROUP BY r.NOM_REGION;

CREATE VIEW Vue2 AS 
SELECT r.NOM_REGION 
FROM region r 
JOIN pays p ON r.ID_REGION = p.ID_REGION 
GROUP BY r.NOM_REGION 
HAVING COUNT(p.ID_PAYS) > 3;

CREATE VIEW Vue3 AS 
SELECT e.NOM_EMPLOYE, e.PRENOM_EMPLOYE, em.TITRE_EMPLOI, d.NOM_DEPARTEMENT, he.SALAIRE, he.DATE_DEBUT_EMPLOI
FROM employe e 
JOIN historique_emploi he ON e.ID_EMPLOYE = he.ID_EMPLOYE
JOIN emploi em ON he.ID_EMPLOI = em.ID_EMPLOI
JOIN departement d ON he.ID_DEPARTEMENT = d.ID_DEPARTEMENT
WHERE he.DATE_FIN_EMPLOI IS NULL OR he.DATE_FIN_EMPLOI > CURRENT_DATE;

CREATE VIEW Vue4 AS 
SELECT d.NOM_DEPARTEMENT, AVG(he.SALAIRE) AS SALAIRE_MOYEN
FROM departement d 
JOIN historique_emploi he ON d.ID_DEPARTEMENT = he.ID_DEPARTEMENT
WHERE he.DATE_FIN_EMPLOI IS NULL OR he.DATE_FIN_EMPLOI > CURRENT_DATE
GROUP BY d.NOM_DEPARTEMENT;

CREATE VIEW Vue5 AS 
SELECT d.NOM_DEPARTEMENT, SUM(he.SALAIRE) AS MASSE_SALARIALE
FROM departement d 
JOIN historique_emploi he ON d.ID_DEPARTEMENT = he.ID_DEPARTEMENT
WHERE he.DATE_FIN_EMPLOI IS NULL OR he.DATE_FIN_EMPLOI > CURRENT_DATE
GROUP BY d.NOM_DEPARTEMENT;

CREATE VIEW Vue6 AS 
SELECT b.NOM_VILLE_BUREAU, SUM(he.SALAIRE) AS MASSE_SALARIALE
FROM bureau b 
JOIN departement d ON b.ID_BUREAU = d.ID_BUREAU
JOIN historique_emploi he ON d.ID_DEPARTEMENT = he.ID_DEPARTEMENT
WHERE he.DATE_FIN_EMPLOI IS NULL OR he.DATE_FIN_EMPLOI > CURRENT_DATE
GROUP BY b.NOM_VILLE_BUREAU;

CREATE VIEW Vue7 AS 
SELECT e.NOM_EMPLOYE, e.PRENOM_EMPLOYE
FROM employe e 
JOIN historique_emploi he ON e.ID_EMPLOYE = he.ID_EMPLOYE
WHERE he.DATE_FIN_EMPLOI IS NULL OR he.DATE_FIN_EMPLOI > CURRENT_DATE
GROUP BY e.ID_EMPLOYE, e.NOM_EMPLOYE, e.PRENOM_EMPLOYE
HAVING COUNT(he.ID_EMPLOI) = 3;

CREATE VIEW Vue8 AS
SELECT e.NOM_EMPLOYE, e.PRENOM_EMPLOYE
FROM employe e
JOIN historique_emploi he ON e.ID_EMPLOYE = he.ID_EMPLOYE
GROUP BY e.ID_EMPLOYE, e.NOM_EMPLOYE, e.PRENOM_EMPLOYE
ORDER BY COUNT(he.ID_EMPLOI) DESC LIMIT 1;

CREATE VIEW Vue9 AS 
SELECT CONCAT(e1.NOM_EMPLOYE, ', ', e1.PRENOM_EMPLOYE) AS EMPLOYE_NOM_PRENOM,
CASE WHEN e2.ID_EMPLOYE IS NOT NULL THEN CONCAT(e2.NOM_EMPLOYE, ', ', e2.PRENOM_EMPLOYE) ELSE NULL END AS RESPONSABLE_NOM_PRENOM
FROM employe e1 
LEFT JOIN employe e2 ON e1.RESPONSABLE_EMPLOYE = e2.ID_EMPLOYE;


