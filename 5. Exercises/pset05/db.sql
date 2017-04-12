CREATE TABLE Persons
(
    login     VARCHAR(30) NOT NULL,
    nome      VARCHAR(50) NOT NULL,
    hometown  VARCHAR(30),
    PRIMARY KEY (login)
);

CREATE TABLE AllKnows
(
    login     VARCHAR(30) NOT NULL,
    colleague VARCHAR(30) NOT NULL,
    PRIMARY KEY (login, colleague),
    FOREIGN KEY(login) REFERENCES Persons(login),
    FOREIGN KEY(colleague) REFERENCES Persons(login)
);

CREATE TABLE AllLikesMusic
(
    login     VARCHAR(30) NOT NULL,
    rating    INTEGER NOT NULL,
    bandurl VARCHAR(100) NOT NULL,
    PRIMARY KEY (login, bandurl),
    FOREIGN KEY(login)
      REFERENCES Persons(login)
);

CREATE TABLE AllLikesMovies
(
    login     VARCHAR(30) NOT NULL,
    rating    INTEGER NOT NULL,
    movieurl  VARCHAR(100) NOT NULL,
    PRIMARY KEY (login, movieurl),
    FOREIGN KEY(login)
      REFERENCES Persons(login)
);
