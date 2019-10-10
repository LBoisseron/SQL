# Afficher la profession de l'employé 5.
# SELECT service FROM employes WHERE id_employes = 5;

# Afficher la date d'embauche de : Melissa.
# SELECT date_embauche FROM employes WHERE prenom = 'Melissa';

# Afficher le nombre de commerciaux.
#SELECT COUNT(*) AS nb_commerciaux FROM employes WHERE service = 'commercial';

# Afficher le coût des commerciaux sur 1 année.
#SELECT SUM(salaire*12) FROM employes WHERE service = 'commercial';

# Afficher le salaire moyen par service.
#SELECT service, ROUND ( AVG( salaire ) ) AS moyenne_service FROM employes GROUP BY service;

# Afficher le nombre de recrutements sur l'année 2019.
#SELECT COUNT(*) FROM employes WHERE date_embauche BETWEEN '2019-01-01' AND curdate();
#SELECT COUNT(*) FROM employes WHERE date_embauche LIKE '2019%';

# Augmenter le salaire pour chaque employé de 100€.
#UPDATE employes SET salaire = salaire + 100;

# Afficher les informations de l'employé du service commercial gagnant le salaire le plus élevé
#SELECT prenom, nom, salaire, service FROM employes WHERE service = 'commercial' ORDER BY salaire DESC LIMIT 0,1;
#SELECT prenom, nom, salaire, service FROM employes WHERE service = 'commercial' AND salaire = ( SELECT MAX( salaire ) FROM employes WHERE service = 'commercial' );

# Afficher l'employé ayant été embauché en dernier.
#SELECT prenom, nom FROM employes ORDER BY date_embauche DESC LIMIT 0,1;
SELECT * FROM employes WHERE date_embauche = ( SELECT MAX( date_embauche ) FROM employes );