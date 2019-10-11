# Afficher les dates auxquelles Guillaume s'est rendu à la bibliothèque pour emprunter ou pour rendre un livre.
# On veut récupérer 3 informations : date de sortie, date de rendu, prénom de Guillaume
SELECT a.prenom, e.date_sortie, e.date_rendu
	FROM abonne a, emprunt e 
		WHERE a.id_abonne = e.id_abonne
			AND a.prenom = 'Guillaume';

# Afficher les dates auxquelles les livres écrits par Alphonse Daudet ont été empruntés ou rendus à la bibliothèque.
# date de sortie, date de rendu, auteur Guy de Maupassant
SELECT e.date_sortie, e.date_rendu
	FROM livre l, emprunt e
		WHERE l.id_livre = e.id_livre
			AND l.auteur = 'GUY DE MAUPASSANT';

# Qui a emprunté le livre 'Une Vie' sur l'année 2014 ?
SELECT a.prenom
	FROM abonne a, emprunt e, livre l
		WHERE l.id_livre = e.id_livre
			AND e.id_abonne = a.id_abonne
            AND l.titre = 'Une vie'
            AND e.date_sortie LIKE '2014%';

# Afficher le nombre de livres empruntés par chaque abonné
SELECT a.prenom, COUNT(e.id_livre) AS nb_livres_empruntes
	FROM abonne a, emprunt e 
		WHERE a.id_abonne = e.id_abonne
			GROUP BY e.id_abonne ;

# Qui a emprunté Quoi ? et Quand ?
SELECT a.prenom, l.titre, e.date_sortie
	FROM abonne a, livre l, emprunt e 
		WHERE a.id_abonne = e.id_abonne
			AND e.id_livre = l.id_livre;
            
# Afficher le prénom des abonnés avec le numéro des livres qu'ils ont emprunté
# LEFT JOIN : affiche les résultats même si toutes les conditions ne sont pas remplies
SELECT a.prenom, e.id_livre 
	FROM abonne a LEFT JOIN emprunt e 
		ON a.id_abonne = e.id_abonne;
    