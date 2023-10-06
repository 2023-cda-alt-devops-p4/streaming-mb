DROP DATABASE IF EXISTS streaming_db;
CREATE DATABASE streaming_db;
USE streaming_db;




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
