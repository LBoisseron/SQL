CREATE TABLE IF NOT EXISTS employes (
  id_employes int(3) NOT NULL AUTO_INCREMENT,
  prenom varchar(20) DEFAULT NULL,
  nom varchar(20) DEFAULT NULL,
  sexe enum('h','f') NOT NULL,
  service varchar(30) DEFAULT NULL,
  date_embauche date DEFAULT NULL,
  salaire float DEFAULT NULL,
  PRIMARY KEY (id_employes)
  # InnoDB permet de bénéficier des relations avec les FK
    # MyISAM n'inclut pas la gestion des FK.
    # Chercher sur Google MyISAM vs InnoDB
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 ;
