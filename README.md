

### Création d'un conteneur Docker

- Définir le nom du conteneur
sudo docker run --name streaming_container -e MYSQL_ROOT_PASSWORD=1234 -d mysql

 - Lancer le conteneur
 docker compose up -d

- Accèder à la liste des conteneurs
sudo docker ps -a

- Copier les fichiers dans le contener
sudo docker cp [chemin du fichier à copier] [container]:[nom du fichier dans l'image]

- Accès au conteneur
sudo docker exec -it (id du contener) mysql -u root -p

- Accès à la base de donnée
USE nom de la base de donnée
source (nom d'un fichier copié dans le conteneur ):exemple creation_table.sql)

- Connection avec un client
mysql -h localhost -P 4406 --protocol=tcp -u root -p



### Création de la base de données

- CREATE DATABASE streaming-db;

#### Création des tables
```sql
CREATE TABLE
    IF NOT EXISTS actor (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        first_name VARCHAR(150) NOT NULL,
        date_of_birth DATE
    );
```
```sql
CREATE TABLE
    IF NOT EXISTS director (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        first_name VARCHAR(150) NOT NULL
    );
```
```sql
CREATE TABLE
    IF NOT EXISTS movie (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(150) NOT NULL,
        duration INT NOT NULL,
        year_of_release DATE,
         director_id INT NOT NULL,
        FOREIGN KEY (director_id) REFERENCES director(id) ON DELETE CASCADE
    );
```
```sql
CREATE TABLE
    IF NOT EXISTS role (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        actor_id INT NOT NULL,
        movie_id INT NOT NULL,
        FOREIGN KEY (actor_id) REFERENCES actor(id) ON DELETE CASCADE,
        FOREIGN KEY (movie_id) REFERENCES movie(id) ON DELETE CASCADE
    );
```
```sql
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
```
```sql
CREATE TABLE
    IF NOT EXISTS archive (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        old_value VARCHAR(150),
        new_value VARCHAR(150),
        user_id INT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
    );
```
### Valeurs des tables
```sql
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
```
```sql
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
```
```sql
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
```
```sql
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
```
```sql
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
```
```sql
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
```
```sql
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
```
```sql
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
```
### Requêtes

- Ajouter un film
  ```sql
INSERT INTO
    movie (
        title,
        duration,
        year_of_release,
        director_id
    )
VALUES
(
        'Inception',
        180,
        '2010-02-08',
        (SELECT id
        FROM director
        WHERE name = 'Scorsese')
    );
    ```
  
- modification d'un film
  
  ```sql
UPDATE movie
SET title = 'Shutter Island',
    duration = 150,
    year_of_release = 2010-02-02,
    director_id = (SELECT id
                  FROM director
                  WHERE name = 'Scorsese')
                  WHERE id = 3;
                  ```
  -les titres et dates de sortie des films du plus récent au plus ancien
  ```sql
SELECT title, year_of_release
FROM movie
ORDER BY year_of_release DESC;
 ```

- Ajouter un acteur
  
  ```sql
INSERT INTO
    actor (
        name,
        first_name,
        date_of_birth
        )
    Values
    (
        'Margot',
        'Robbie',
        '1990-07-02'
        );
 ```
    
- Supprimer un acteur

```sql

DELETE FROM actor
WHERE id = 2;
 ```

- Lister les 3 derniers acteurs
  
  ```sql
SELECT *, TIMESTAMPDIFF(YEAR, date_of_birth, NOW()) AS age
FROM actor
ORDER BY id DESC
LIMIT 3;
 ```

- Liste d'acteur âgés depuis plus de 30 ans

```sql
SELECT
    name,
    first_name,
    TIMESTAMPDIFF(YEAR, date_of_birth, NOW()) AS age
FROM actor
ORDER BY name ASC;
 ```



# Critères d'évaluation

- [✔️] OK
- [:x:] NOT OK

*replace check markdown after evaluation*



## Livrables

Un dépôt GitHub contenant :

- [✔️] L'environnement docker
- [✔️] Le dictionnaire de données
- [✔️] MCD
- [✔️] MPD
- [✔️] MLD
- [✔️] Un fichier permettant de générer la bdd (incluant quelques données)
- [✔️] Le jeu de requêtes dans le _README.md_

## Critères de performance

- [✔️] Récupération facile de votre environnement
- [✔️] Exactitude des relations entre les tables
- [ ] Trigger\* mis en place
- [✔️] Bonne présentation des requêtes sur le _README.md_
- [✔️] Exécution des requêtes sans erreur

### Les requêtes

- [✔️] Les titres et dates de sortie des films du plus récent au plus ancien
- [✔️] Les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique
- [✔️] La liste des acteurs/actrices principaux pour un film donné
- [✔️] La liste des films pour un acteur/actrice donné
- [✔️] Ajouter un film
- [✔️] Ajouter un acteur/actrice
- [✔️] Modifier un film
- [✔️] Supprimer un acteur/actrice
- [✔️] Afficher les 3 derniers acteurs/actrices ajouté(e)s

### Procédures

- [ ] Lister grâce à une procédure stockée les films d'un réalisateur donné en paramètre

### Triggers

- [ ] Garder grâce à un trigger une trace de toutes les modifications apportées à la table des utilisateurs. Ainsi, une table d'archive conservera la date de la mise à jour, l'identifiant de l'utilisateur concerné, l'ancienne valeur ainsi que la nouvelle.
- [ ] Pour chaque entrée dans la base de données, il y aura la date de création et de modification.
