# Plateforme de streaming

Concevoir une BDD. Stocker des données, les manipuler.
![img_svg](./img/movies.svg)

## Installation d'une base de données avec Docker

#1: Création d'un conteneur Docker

- Définir le nom du conteneur
sudo docker run --name streaming_container -e MYSQL_ROOT_PASSWORD=1234 -d mysql

 -Lancer le conteneur
 docker compose up -d

-Accèder à la liste des conteneurs
sudo docker ps -a

- Copier les fichiers dans le contener
sudo docker cp [chemin du fichier à copier] [container]:[nom du fichier dans l'image]

-Accès au conteneur
sudo docker exec -it (id du contener) mysql -u root -p
USE nom de la base de donnée
source (nom d'un fichier copié dans le conteneur ):exemple creation_table.sql)

## Création d'une base de données stockée dans Docker

# Création de la base de données

-CREATE DATABASE streaming-db;

# Création des tables

CREATE TABLE
    IF NOT EXISTS actor (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        first_name VARCHAR(150) NOT NULL,
        date_of_birth DATE
    );

CREATE TABLE
    IF NOT EXISTS director (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        first_name VARCHAR(150) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS movie (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(150) NOT NULL,
        duration INT NOT NULL,
        year_of_release DATE,
         director_id INT NOT NULL,
        FOREIGN KEY (director_id) REFERENCES director(id) ON DELETE CASCADE
    );

CREATE TABLE
    IF NOT EXISTS role (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        actor_id INT NOT NULL,
        movie_id INT NOT NULL,
        FOREIGN KEY (actor_id) REFERENCES actor(id) ON DELETE CASCADE,
        FOREIGN KEY (movie_id) REFERENCES movie(id) ON DELETE CASCADE
    );

  CREATE TABLE
    IF NOT EXISTS user (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        first_name VARCHAR(150),
        email VARCHAR(150),
        password VARCHAR(150),
        favorite_movie VARCHAR(150),
        movie_id INT NOT NULL,
        FOREIGN KEY (movie_id) REFERENCES movie(id) ON DELETE CASCADE
    );

CREATE TABLE
    IF NOT EXISTS archive (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        old_value VARCHAR(150),
        new_value VARCHAR(150),
        user_id INT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
    );
# Valeurs des tables
INSERT INTO
    actor (
        last_name,
        first_name,
        date_of_birth
    )
VALUES
(
        'Dicaprio',
        'Léonardo',
        '1974-11-11'
),(
        'Murphy',
        'Cillian',
        '1976-05-25'
),(
        'Pascal',
        'Pedro',
        '1975-04-02'
);

INSERT INTO
    director (
        last_name,
        first_name

    )
VALUES
(
        'Scorsese',
        'Martin'
),(
        'Druckmann,',
        'Neil'
),(
        'Nolan,',
        'Christopher'
);


INSERT INTO
    movie (
        title,
        duration,
        year_of_release,
        id_director
    )
VALUES
(
        'Shutter Island',
        150,
        '2010-02-24',
        (SELECT id
        FROM director
        WHERE name = "Scorsese")
    ),(
        'Oppenheimer',
        180,
        '2023-07-19',
        (SELECT id
        FROM director
        WHERE name = "Nolan")
    ), (
        'Last of us',
        60,
        '2023-01-15',
        (SELECT id
        FROM director
        WHERE name = "Druckmann")
    );

INSERT INTO
    role (
        name,
        actor_id,
        movie_id
)
VALUES
(
        'Teddy',
        (SELECT id
        FROM actor
        WHERE name = "Dicaprio")
    )
         (SELECT id
        FROM movie
        WHERE name = "Shutter Island")
    ),(
        ' Robert Oppenheimer',
        (SELECT id
        FROM actor
        WHERE name = "Murphy")
    )
        (SELECT id
        FROM movie
        WHERE name = "Oppenheimer")
    ), (
        'Last of us',
        (SELECT id
        FROM actor
        WHERE name = "Pascal")

        (SELECT id
        FROM movie
        WHERE name = "Last of us")
    )
    );
INSERT INTO
    user (
        name,
        first_name,
        email,
        password,
        favorite_movie,
        movie_id
)
VALUES
(
        'Dupont',
        'Paul',
        'dupont.paul@hotmail.com',
        '123456'
        'Oppenheimer',
        (SELECT id
        FROM movie
        WHERE name = "Oppenheimer")
    ),

(
        'Durant',
        'Marie',
        'durant.marie@hotmail.com',
        '123456'
        'Shutter Island',
        (SELECT id
        FROM movie
        WHERE name = "Shutter Island")
    ),
(
        'Dubois',
        'Isabelle',
        'dubois.isabelle@hotmail.com',
        '123456'
        'Last of us',
        (SELECT id
        FROM movie
        WHERE name = "Last of us")
    );
INSERT INTO
    archive (
        update_date,
        old_value,
        new_value,
        password,
        favorite_movie,
        user_id
)
(
        '2010-02-24',
        '2023-10-10',
        'Shutter Island',
        (SELECT id
        FROM user
        WHERE name = "Marie")
    );

INSERT INTO
    archive (
        update_date,
        old_value,
        new_value,
        password,
        favorite_movie,
        user_id
)
(
        '2010-02-24',
        '2023-10-10',
        'Last of us',
        (SELECT id
        FROM user
        WHERE name = "Isabelle")
    );
INSERT INTO
    archive (
        update_date,
        old_value,
        new_value,
        password,
        favorite_movie,
        user_id
)
(
        '2010-02-24',
        '2023-10-10',
        'Openheimer',
        (SELECT id
        FROM user
        WHERE name = "Paul")
    );
# Requêtes

- Ajouter un film
INSERT INTO
    movie (
        title,
        duration,
        year_of_release,
        id_director
    )
VALUES
(
        'Inception',
        180,
        '2010-02-08',
        (SELECT id
        FROM director
        WHERE last_name = "Scorsese")
    );
- modification d'un film

UPDATE movie
SET title = 'Shutter Island',
    duration = 150,
    year_of_release = 2010-02-02,
    id_director = (SELECT id
                  FROM director
                  WHERE last_name = "Scorsese")
WHERE id = 3;
  -les titres et dates de sortie des films du plus récent au plus ancien
SELECT title, year_of_release
FROM movie
ORDER BY year_of_release DESC;

- Ajouter un acteur

INSERT INTO
    actor (
        last_name,
        first_name,
        date_of_birth
    )
- Supprimer un acteur

DELETE FROM actor
WHERE id = 2;

- Lister les 3 derniers acteurs
SELECT *, TIMESTAMPDIFF(YEAR, date_of_birth, NOW()) AS age
FROM actor
ORDER BY id DESC
LIMIT 3;

- Liste d'acteur âgés depuis plus de 30 ans
SELECT
    name,
    first_name,
    TIMESTAMPDIFF(YEAR, date_of_birth, NOW()) AS age
FROM actor
ORDER BY name ASC;



## Contexte du projet

En tant que développeur passionné par le cinéma, vous avez toujours été fasciné par la magie du grand écran. Cette passion ne se limite pas seulement à regarder des films. Vous avez toujours été curieux de connaître les coulisses, d'étudier qui a joué dans tel film, qui l'a réalisé, et comment ces chefs-d'œuvre ont été créés. Vous trouvez aussi que les plateformes de streaming sont un formidable accès à un catalogue d'oeuvres de toute sorte à découvrir.

Vous avez donc envie de créer, vous aussi, votre propre plateforme de streaming sur votre temps libre.

Mais comme Rome ne s'est pas construite en un jour, vous voulez commencer par la mise en place d'un site web permettant de procéder à différentes opérations de recherches à propos de films, d'acteurs/actrices ou de réalisateurs.

Sauf que. La partie site web n'est pas pour tout de suite 😃

Avant celà, vous avez besoin d'une base de données pour le stockage. Et donc de la concevoir et la mettre en place!

A vous de jouer 🙂

## Modalités pédagogiques

**Activité individuelle en mode collaboratif.**

### Structure de la base de donnée

*Les films*
Un film comporte un titre, un ou plusieurs acteurs, un réalisateur, une durée et l'année de sa sortie.

*Les acteurs, actrices*
Nom, prénom, rôle et date de naissance.

*Les réalisateurs*
Nom et prénom.

*Les utilisateurs*
Nom, prénom, email, mot de passe, rôle et liste des films préférés.

### Les requêtes

Voici un jeu de requêtes minimal à fournir pour tester votre bdd :
- les titres et dates de sortie des films du plus récent au plus ancien
- les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique
- la liste des acteurs/actrices principaux pour un film donné
- la liste des films pour un acteur/actrice donné
- ajouter un film
- ajouter un acteur/actrice
- modifier un film
- supprimer un acteur/actrice
- afficher les 3 derniers acteurs/actrices ajouté(e)s

Nous avons aussi besoin de manipulations avancées:
- Lister grâce à une procédure stockée les films d'un réalisateur donné en paramètre
- Garder grâce à un trigger une trace de toutes les modifications apportées à la table des utilisateurs. Ainsi, une table d'archive conservera la date de la mise à jour, l'identifiant de l'utilisateur concerné, l'ancienne valeur ainsi que la nouvelle.

​
### Contraintes

- Le noSQL (MongoDB...) n'est pas autorisé
- Vous devez créer votre propre environnement Docker
- Un *trigger* doit être mis en place, également appelé déclencheur

- Seul l'administrateur de la BDD pourra ajouter, modifier ou supprimer des données.
- Pour chaque entrée dans la base de données, il y aura la date de création et de modification.


### Deadline

4 jours.

## Modalités d'évaluation

Correction entre pairs.
Vos requêtes seront testées en local après l'importation de votre environnemnt docker.

## Livrables

Un dépôt GitHub contenant :
- l'environnement docker
- le dictionnaire de données
- MCD
- MPD
- MLD
- un fichier permettant de générer la bdd (incluant quelques données)
- le jeu de requêtes dans le *README.md*

## Critères de performance

- Récupération facile de votre environnement
- Exactitude des relations entre les tables
- *Trigger* mis en place
- Bonne présentation des requêtes sur le *README.md*
- Exécution des requêtes sans erreur

## Ressources

- [Comprendre les bases de données](https://www.base-de-donnees.com/comprendre-bases-de-donnees)
- [Modèle Conceptuel des Données](https://www.base-de-donnees.com/mcd)
- [Langage SQL](https://sql.sh)

## Auteurs, contributeurs

* [Nicolas Herbez](https://github.com/nicolas-herbez)
* [Jean-Baptiste Lavisse](https://github.com/jblavisse)
* [Cyril Marcq](https://github.com/CyrilMarcq)
