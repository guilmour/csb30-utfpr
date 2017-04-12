/* pset04 by Guilmour */
CREATE TABLE Pessoa
(
    login     VARCHAR(15) NOT NULL,
    nome      VARCHAR(30) NOT NULL,
    cid_natal VARCHAR(15) NOT NULL,
    PRIMARY KEY (login)
);

CREATE TABLE Conhece
(
    login     VARCHAR(15) NOT NULL,
    login2      VARCHAR(30) NOT NULL,
    PRIMARY KEY (login, login2),
    FOREIGN KEY(login)
      REFERENCES Pessoa(login),
    FOREIGN KEY(login2)
      REFERENCES Pessoa(login)
);

CREATE TABLE Conhece
(
    login     VARCHAR(15) NOT NULL,
    login2      VARCHAR(30) NOT NULL,
    PRIMARY KEY (login, login2)
);

CREATE TABLE Bloqueia
(
    login     VARCHAR(15) NOT NULL,
    login2    VARCHAR(30) NOT NULL,
    PRIMARY KEY (login, login2)
);

CREATE TABLE ArtistaMusical
(
  id  INTEGER,
  nome_artistico  VARCHAR(30) NOT NULL,
  pais VARCHAR(15) NOT NULL,
  genero_mus VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE CurtirAstista
(
    login VARCHAR(15) NOT NULL,
    ArtistaID INTEGER NOT NULL,
    Nota INTEGER,

    FOREIGN KEY(Placa)
      REFERENCES Taxi(Placa)
)
