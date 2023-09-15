-- Fait par Mélissa, Françis et Yani.
-- Remplacez 'JP' par l'ID du pays que vous recherchez.
SET @pays_id := 'CA';

-- Sélectionnez les informations sur les bureaux pour le pays donné.
SELECT bureau.*, pays.NOM_PAYS
FROM bureau
JOIN pays ON bureau.ID_PAYS = pays.ID_PAYS
WHERE pays.ID_PAYS = @pays_id;

SELECT * from bureau;
