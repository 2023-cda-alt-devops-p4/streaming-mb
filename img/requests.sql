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
);
INSERT INTO
    actor (
        last_name,
        first_name,
        date_of_birth
    )
VALUES
(
        'Murphy',
        'Cillian',
        '1976-05-25'
);
INSERT INTO
    actor (
        last_name,
        first_name,
        date_of_birth
    )
VALUES
(
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
);
INSERT INTO
    director (
        last_name,
        first_name

    )
VALUES
(
        'Druckmann,',
        'Neil'
);
INSERT INTO
    director (
        last_name,
        first_name

    )
VALUES
(
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
        'Oppenheimer',
        180,
        '2023-07-19',
        (SELECT id
        FROM director
        WHERE name = "Nolan")
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
        'Last of us',
        60,
        '2023-01-15',
        (SELECT id
        FROM director
        WHERE name = "Druckmann")
    );
