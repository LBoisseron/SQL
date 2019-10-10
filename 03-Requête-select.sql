# Récupère les prenoms et noms de tous les employes
# 1. SELECT pour effectuer une requète de SELECTion
# 2. On précise les colonnes qu'on souhaite récupérer
# 3. FROM pour indiquer la table concernée.
# SELECT prenom, nom FROM employes

# Afficher les services occupés dans l'entreprise
# On remarque la présence de doublon
# SELECT service FROM employes ;

# Afficher les services occupés dans l'entreprise (sans doublons)
# Le mot clé 'DISTINCT' permet d'éviter les doublons
# SELECT DISTINCT service FROM employes ;

# Afficher toutes les données de la table employés
# SELECT prenom, nom, sexe, service, date_embauche, salaire FROM employes
# '*' permet de cibler toutes les colonnes.
# SELECT * FROM employes;

# Récupérer le prénom et le nom des employés du service 'commercial'
# SELECT prenom, nom FROM employes WHERE service = 'communication';

# Récupérer les employés ayant été recrutés entre janvier et mars 2019
# SELECT prenom, nom FROM employes WHERE date_embauche BETWEEN '2019-01-01' AND '2019-03-31';

# Récuperer les employés ayant un salaire compris entre 2000 et 3500 € 
# SELECT prenom, nom, salaire FROM employes WHERE salaire BETWEEN '2000' AND '3500';

# Connaître la date du jour
# SELECT curdate();

# Récupérer les employés ayant été recrutés entre Mars 2019 et aujourd'hui
# SELECT prenom, nom, date_embauche FROM employes WHERE date_embauche BETWEEN '2019-03-01' AND curdate();

# Récupérer tous les employés ayant un prénom commençant par la lettre 'L'
SELECT prenom FROM employes WHERE prenom LIKE 'l%';

# Récupérer tous les employés ayant un prénom contenant la lettre 'I'
SELECT prenom FROM employes WHERE prenom LIKE '%i%';

# Afficher tous les employés sauf ceux du service production
SELECT prenom, nom, service FROM employes WHERE service != 'production';

# Afficher tous les emplyoés ayant un salaire supérieur à 3000€ 
SELECT prenom, nom, salaire FROM employes WHERE salaire > 3000 ;

# Afficher tous les employés par ordre alphabétique de leur prénom
# On utilise le mot clé ORDER BY suivi de ASC pour ascendant et DESC pour descendant
SELECT prenom, nom FROM employes ORDER BY prenom ASC;
SELECT prenom, nom FROM employes ORDER BY prenom DESC;

# Quels sont les 3 salariés ayant le meilleur salaire
# Grâce à LIMIT, je peux limiter les résultats et introduire de la pagination
# LIMIT (possition de départ) , (nb de résultats)
SELECT prenom, nom, salaire FROM employes ORDER BY salaire DESC LIMIT 0,3;

# Afficher les salaires annuels des employés
SELECT prenom, nom, salaire*12 FROM employes ORDER BY salaire DESC;

# Le mot-clé AS permet de (re)nommer une colonne
SELECT prenom, nom, salaire*12 AS salaire_annuel FROM employes ORDER BY salaire DESC;

# Connaître le montant de la charge salariale 
SELECT SUM(salaire*12) AS charge_salariale_annuelle FROM employes;

# Le salaire moyen
SELECT AVG(salaire) AS moyenne_salaire FROM employes;

# Résultat arrondi
SELECT ROUND( AVG(salaire) ) AS moyenne_salaire FROM employes;
SELECT ROUND( AVG(salaire), 2 ) AS moyenne_salaire FROM employes; # 2 chiffres après la virgule

# Nombre d'hommes et de femmes dans l'entreprise
SELECT COUNT(*) AS nb_homme FROM employes WHERE sexe = 'm';
SELECT COUNT(*) AS nb_femme FROM employes WHERE sexe = 'f';

# Le salaire le plus bas
SELECT prenom, nom, salaire FROM employes ORDER BY salaire ASC LIMIT 0,1;
SELECT MIN(salaire) FROM employes; #ici nous ne pouvons pas connaître l'identité
# il faut itiliser une requête imbriquée
# Quel est le salaire minimum ?
# A qui il appartient ?
SELECT prenom, nom, salaire FROM employes WHERE salaire = ( SELECT MIN( salaire ) FROM employes );

# Récupérer les employés des services 'comptabilité' et 'informatique'
SELECT prenom, nom, service FROM employes WHERE service IN('comptabilite', 'informatique');

# Récupérer tous les employés qui ne sont pas dans 'comptabilité', 'informatique', et 'production'
SELECT prenom, nom, service FROM employes WHERE service NOT IN('comptabilite', 'informatique', 'production');

# Récupérer les employés du service commercial qui gagnent un salaire >= 2000€ 
# Ici nous avons 2 conditions
# 1. Appartenir au service commercial
# 2. Avoir un salaire supérieur ou égal à 2000€
#SELECT prenom, nom, salaire, service FROM employes WHERE service='commercial' AND salaire >= 2000

# Récupérer les employés du service commercial qui gagnent un salaire de 2700 ou 3200€ 
# Ici nous avons 3 conditions
# 1. Appartenir au service commercial
# 2. Avoir un salaire de 2700€
# 3. Avoir un salaire de 3200€
SELECT prenom, nom, salaire, service FROM employes WHERE service = 'commercial' AND ( salaire = 2700 OR salaire = 3200 );

# Connaître le nombre d'employés par service
SELECT service, COUNT(*) AS nb_employes FROM employes GROUP BY service;
# Connaître les services ayant plus de 2 employés
SELECT service, COUNT(*) AS nb_employes FROM employes GROUP BY service HAVING COUNT(*) >= 2;

# Afficher pour chaque service l'employé ayant le meilleur salaire
# Afficher pour chaque service l'employé ayant le plus d'ancienneté