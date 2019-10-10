# J'augmente à 5500€ le salaire de l'employé ID 10
# 1. UPDATE : mise à jour
# 2. Suivi de la table à mettre à jour 
# 3. SET suiv ide la colonne à modifier
# 4. (OPTION) une condition WHERE
#UPDATE employes SET salaire = 5500 WHERE id_employes = 10;

# Augmenter tous les salaires de 20% sauf celui de la direction
# UPDATE employes SET salaire = salaire*(1+20/100) WHERE id_employes != 1;

UPDATE employes SET salaire = salaire * ( 1 + 20 / 100 ) WHERE service != 'direction';

# Augmenter de 20%  les 5 salaires qui ont le plus d'ancienneté
