CREATE TABLE IF NOT EXISTS abonne (
id_abonne int(3) NOT NULL AUTO_INCREMENT,
prenom varchar(20) NOT NULL,
PRIMARY KEY (id_abonne)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
 CREATE TABLE IF NOT EXISTS livre (
 id_livre int(3) NOT NULL AUTO_INCREMENT,
 auteur varchar(30) NOT NULL,
 titre varchar(30) NOT NULL,
 PRIMARY KEY (id_livre)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
 CREATE TABLE IF NOT EXISTS emprunt (
 id_emprunt int(3) NOT NULL AUTO_INCREMENT,
 id_livre int(3) DEFAULT NULL,
 id_abonne int(3) DEFAULT NULL,
 date_sortie date NOT NULL,
 date_rendu date DEFAULT NULL,
 PRIMARY KEY (id_emprunt)
 )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
  # La création des contraintes se fait après la création des tables
  # Vu que que les tables sont déjà créées on va devoir les modifier
ALTER TABLE emprunt ADD FOREIGN KEY (`id_livre`) REFERENCES bibliotheque.livre (`id_livre`);
ALTER TABLE emprunt ADD FOREIGN KEY (`id_abonne`) REFERENCES bibliotheque.abonne (`id_abonne`);