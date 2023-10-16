INSERT INTO
    actor (
        name,
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
        name,
        first_name

    )
VALUES
(
        'Scorsese',
        'Martin'
),(
        'Druckmann',
        'Neil'
),(
        'Nolan',
        'Christopher'
);


INSERT INTO
    movie (
        title,
        duration,
        year_of_release,
        director_id
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
        WHERE name = 'Dicaprio')
    ,
        (SELECT id
        FROM movie
        WHERE title = 'Shutter Island')
    );

INSERT INTO
    role (
        name,
        actor_id,
        movie_id
)
VALUES
    (
        ' Robert Oppenheimer',
        (SELECT id
        FROM actor
        WHERE name = 'Murphy')
    ,
        (SELECT id
        FROM movie
        WHERE title = 'Oppenheimer')
    );
INSERT INTO
    role (
        name,
        actor_id,
        movie_id
)
VALUES
     (
        'Last of us',
        (SELECT id
        FROM actor
        WHERE name = 'Pascal')
    ,

        (SELECT id
        FROM movie
        WHERE title = 'Last of us')
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
        '123456',
        'Oppenheimer',
        (SELECT id
        FROM movie
        WHERE title = 'Oppenheimer')
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
        'Durant',
        'Marie',
        'durant.marie@hotmail.com',
        '123456',
        'Shutter Island',
        (SELECT id
        FROM movie
        WHERE title = 'Shutter Island')
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
        'Dubois',
        'Isabelle',
        'dubois.isabelle@hotmail.com',
        '123456',
        'Last of us',
        (SELECT id
        FROM movie
        WHERE title = 'Last of us')
    );
-- INSERT INTO
--     archive (
--         update_date,
--         old_value,
--         new_value,
--         password,
--         favorite_movie,
--         user_id
-- )
-- VALUES
-- (
--         '2010-02-24',

--         'Shutter Island',
--         (SELECT id
--         FROM user
--         WHERE name = "Marie")
--     );

-- INSERT INTO
--     archive (
--         update_date,
--         old_value,
--         new_value,
--         password,
--         favorite_movie,
--         user_id
-- )
-- VALUES
-- (
--         '2010-02-24',
--         '2023-10-10',
--         'Last of us',
--         (SELECT id
--         FROM user
--         WHERE name = "Isabelle")
--     );
-- INSERT INTO
--     archive (
--         update_date,
--         old_value,
--         new_value,
--         password,
--         favorite_movie,
--         user_id
-- )
-- VALUES
-- (
--         '2010-02-24',
--         '2023-10-10',
--         'Openheimer',
--         (SELECT id
--         FROM user
--         WHERE name = "Paul")
--     );
