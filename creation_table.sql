----------Creation of tables----------------
---------- Creation actor table-------------

CREATE TABLE actors (
        Id_actors INT AUTO_INCREMENT,
        name VARCHAR(50) NOT NULL,
        firstName VARCHAR(50) NOT NULL,
         dateOfBirth DATE NOT NULL,
         PRIMARY KEY(Id_actors)
    );

    ---------- Creation director table-----------
CREATE TABLE directors (
        Id_directors INT AUTO_INCREMENT,
        name VARCHAR(50) NOT NULL,
        firstName VARCHAR(50) NOT NULL,
        PRIMARY KEY(Id_directors)
    );


    ----------- Creation movie table -----------
CREATE TABLE movies (
        Id_movies INT AUTO_INCREMENT,
        title VARCHAR(50) NOT NULL,
        duration INTEGER(50) NOT NULL,
        yearOfRelease DATE NOT NULL,
         Id_directors INT NOT NULL,
        PRIMARY KEY(Id_movies)
        FOREIGN KEY (Id_directors) REFERENCES directors(id) ON DELETE CASCADE
    );


    ----------- Creation role table -----------
CREATE TABLE
    IF NOT EXISTS roles (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        actor_id INT NOT NULL,
        movie_id INT NOT NULL,
        FOREIGN KEY (actor_id) REFERENCES actor(id) ON DELETE CASCADE,
        FOREIGN KEY (movie_id) REFERENCES movie(id) ON DELETE CASCADE
    );
    ----------- Creation user table -----------
  CREATE TABLE
    IF NOT EXISTS users (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        first_name VARCHAR(150)
        email VARCHAR(150)
        password VARCHAR(150)
        favorite_movie VARCHAR(150)
        movie_id INT NOT NULL,
        FOREIGN KEY (movie_id) REFERENCES movie(id) ON DELETE CASCADE
    );
----------- Creation archive table -----------
CREATE TABLE
    IF NOT EXISTS archives (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        update_date CURRENT_TIMESTAMP(150),
        old_value VARCHAR(150)
        new_value VARCHAR(150),
        user_id INT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
    );
