-- criação das tabelas
CREATE TABLE Pessoas(
id INT PRIMARY KEY,
nome_completo VARCHAR(50) NOT NULL,
endereco VARCHAR(50) NOT NULL,
tipo VARCHAR(10) NOT NULL
);

CREATE TABLE Registrar_Conhecido(
id_pessoa_conhecedor INT,
id_pessoa_conhecido INT
);

CREATE TABLE Bloqueados(
id_pessoa_bloqueador INT,
id_pessoa_bloqueado INT,
conteudo_abusivo VARCHAR(10),
spammer VARCHAR(10),
motivos_pessoais VARCHAR(10),
outos VARCHAR(50)
);

CREATE TABLE Curtir(
id_pessoa INT,
id_artistas INT,
id_filmes INT,
avaliacao_artistas INT,
avaliacao_filme INT
);

CREATE TABLE Filme(
id INT PRIMARY KEY,
nome VARCHAR(50),
data_de_lancamento VARCHAR(50),
categoria INT
);

CREATE TABLE Categorias(
id_filme INT,
nome_categoria VARCHAR(30)
);

CREATE TABLE Diretor(
id INT PRIMARY KEY,
nome VARCHAR(50),
telefone VARCHAR(50),
endereco VARCHAR(50)
);

CREATE TABLE Ator(
id INT PRIMARY KEY,
nome VARCHAR(50),
telefone VARCHAR(50),
endereco VARCHAR(50),
isDiretor VARCHAR(10)
);

CREATE TABLE Atores_Filmes(
id_ator INT,
id_filme INT
);

CREATE TABLE Diretores_Filmes(
id_diretor INT,
id_filme INT
);

CREATE TABLE Artistas_Musicais(
id INT PRIMARY KEY,
nome_artistico VARCHAR(50),
pais VARCHAR(50),
genero VARCHAR(20),
isband VARCHAR(10)
);

CREATE TABLE Bandas(
id_banda INT,
id_musico INT
);

CREATE TABLE Musicos(
id INT PRIMARY KEY,
nome_real VARCHAR(50),
estilo VARCHAR(20),
data_de_nascimento VARCHAR(20)
);

CREATE TABLE Cantores(
id_artista INT,
id_musico INT
);

-- criação das chaves externas
ALTER TABLE Registrar_Conhecido
ADD CONSTRAINT fk_pessoa_conhecedor
FOREIGN KEY (id_pessoa_conhecedor) REFERENCES Pessoas(id);

ALTER TABLE Registrar_Conhecido
ADD CONSTRAINT fk_pessoa_conhecido
FOREIGN KEY (id_pessoa_conhecido) REFERENCES Pessoas(id);

ALTER TABLE Bloqueados
ADD CONSTRAINT fk_pessoa_bloqueador
FOREIGN KEY (id_pessoa_bloqueador) REFERENCES Pessoas(id);

ALTER TABLE Bloqueados
ADD CONSTRAINT fk_pessoa_bloqueada
FOREIGN KEY (id_pessoa_bloqueado) REFERENCES Pessoas(id);

ALTER TABLE Curtir
ADD CONSTRAINT fk_pessoa_id
FOREIGN KEY (id_pessoa) REFERENCES Pessoas(id);

ALTER TABLE Curtir
ADD CONSTRAINT fk_pessoa_curtir_artista
FOREIGN KEY (id_artistas) REFERENCES Artistas_Musicais(id);

ALTER TABLE Curtir
ADD CONSTRAINT fk_pessoa_filme
FOREIGN KEY (id_filmes) REFERENCES Filme(id);

ALTER TABLE Categorias
ADD CONSTRAINT fk_filme_id
FOREIGN KEY (id_filme) REFERENCES Filme(id);

ALTER TABLE Atores_Filmes
ADD CONSTRAINT fk_atores_id
FOREIGN KEY (id_ator) REFERENCES Ator(id);

ALTER TABLE Atores_Filmes
ADD CONSTRAINT fk_atores_filme
FOREIGN KEY (id_filme) REFERENCES Filme(id);

ALTER TABLE Diretores_Filmes
ADD CONSTRAINT fk_diretores_id
FOREIGN KEY (id_diretor) REFERENCES Diretor(id);

ALTER TABLE Diretores_Filmes
ADD CONSTRAINT fk_diretores_filme
FOREIGN KEY (id_filme) REFERENCES Filme(id);

ALTER TABLE Bandas
ADD CONSTRAINT fk_banda_artistas
FOREIGN KEY (id_banda) REFERENCES Artistas_Musicais(id);

ALTER TABLE Bandas
ADD CONSTRAINT fk_banda_musicos
FOREIGN KEY (id_musico) REFERENCES Musicos(id);

ALTER TABLE Cantores
ADD CONSTRAINT fk_cantores_artistas
FOREIGN KEY (id_artista) REFERENCES Artistas_Musicais(id);

ALTER TABLE Cantores
ADD CONSTRAINT fk_cantores_musicos
FOREIGN KEY (id_musico) REFERENCES Musicos(id);

-- insert nas tabelas principais
INSERT INTO Pessoas(id, nome_completo, endereco, tipo)
VALUES (1, 'Batman', 'BatCaverna', 'Aluno');

INSERT INTO Pessoas(id, nome_completo, endereco, tipo)
VALUES (2, 'Joker', 'Arkham Asylum', 'Professor');

INSERT INTO Pessoas(id, nome_completo, endereco, tipo)
VALUES (3, 'SuperMan', 'Krypton', 'Aluno');

INSERT INTO Filme(id, nome, data_de_lancamento, categoria)
VALUES (1, 'Batman Begins', '2005', 1);

INSERT INTO Filme(id, nome, data_de_lancamento, categoria)
VALUES (2, 'The Dark Knight', '2008', 1);

INSERT INTO Filme(id, nome, data_de_lancamento, categoria)
VALUES (3, 'Batman vs Superman', '2016', 1);

INSERT INTO Diretor(id, nome, telefone, endereco)
VALUES (1, 'Christopher Nolan', '12345678', 'Hollywood');

INSERT INTO Diretor(id, nome, telefone, endereco)
VALUES (2, 'Charles Roven', '12345678', 'Hollywood');

INSERT INTO Diretor(id, nome, telefone, endereco)
VALUES (3, 'Zack Snyder', '12345678', 'Hollywood');

INSERT INTO Ator(id, nome, telefone, endereco, isDiretor)
VALUES (1, 'Heath Ledger', '12345678', 'Ceu', 'False');

INSERT INTO Ator(id, nome, telefone, endereco, isDiretor)
VALUES (2, 'Christian Bale', '12345678', 'Hollywood', 'True');

INSERT INTO Ator(id, nome, telefone, endereco, isDiretor)
VALUES (3, 'Henry Cavill', '12345678', 'Hollywood', 'False');

INSERT INTO Artistas_Musicais(id, nome_artistico, pais, genero, isband)
VALUES(1, 'Carreta Furacao', 'Brasil', 'Epico', 'True');

INSERT INTO Artistas_Musicais(id, nome_artistico, pais, genero, isband)
VALUES(2, 'John Mayer', 'Estados Unidos', 'Blues', 'False');

INSERT INTO Artistas_Musicais(id, nome_artistico, pais, genero, isband)
VALUES(3, 'Ed Sheeran', 'Inglaterra', 'Pop Acustico', 'False');

-- insert nas tabelas de relação
INSERT INTO Registrar_Conhecido(id_pessoa_conhecedor, id_pessoa_conhecido)
VALUES (1, 2);

INSERT INTO Registrar_Conhecido(id_pessoa_conhecedor, id_pessoa_conhecido)
VALUES (1, 3);

INSERT INTO Registrar_Conhecido(id_pessoa_conhecedor, id_pessoa_conhecido)
VALUES (2, 1);

INSERT INTO Registrar_Conhecido(id_pessoa_conhecedor, id_pessoa_conhecido)
VALUES (2, 3);

INSERT INTO Registrar_Conhecido(id_pessoa_conhecedor, id_pessoa_conhecido)
VALUES (3, 1);

INSERT INTO Registrar_Conhecido(id_pessoa_conhecedor, id_pessoa_conhecido)
VALUES (3, 2);

INSERT INTO Bloqueados(id_pessoa_bloqueador, id_pessoa_bloqueado, conteudo_abusivo, spammer, motivos_pessoais)
VALUES (1, 2, 'False', 'False', 'True');

INSERT INTO Bloqueados(id_pessoa_bloqueador, id_pessoa_bloqueado, conteudo_abusivo, spammer, motivos_pessoais)
VALUES (1, 3, 'False', 'False', 'True');

INSERT INTO Bloqueados(id_pessoa_bloqueador, id_pessoa_bloqueado, conteudo_abusivo, spammer, motivos_pessoais)
VALUES (2, 1, 'False', 'False', 'True');

INSERT INTO Bloqueados(id_pessoa_bloqueador, id_pessoa_bloqueado, conteudo_abusivo, spammer, motivos_pessoais)
VALUES (2, 3, 'False', 'False', 'True');

INSERT INTO Bloqueados(id_pessoa_bloqueador, id_pessoa_bloqueado, conteudo_abusivo, spammer, motivos_pessoais)
VALUES (3, 1, 'False', 'False', 'True');

INSERT INTO Bloqueados(id_pessoa_bloqueador, id_pessoa_bloqueado, conteudo_abusivo, spammer, motivos_pessoais)
VALUES (3, 2, 'False', 'False', 'True');

INSERT INTO Curtir(id_pessoa, id_artistas, id_filmes, avaliacao_artistas, avaliacao_filme)
VALUES (1, 1, 1, 5, 3);

INSERT INTO Curtir(id_pessoa, id_artistas, id_filmes, avaliacao_artistas, avaliacao_filme)
VALUES (1, 2, 2, 1, 2);

INSERT INTO Curtir(id_pessoa, id_artistas, id_filmes, avaliacao_artistas, avaliacao_filme)
VALUES (2, 3, 3, 4, 4);

INSERT INTO Curtir(id_pessoa, id_artistas, id_filmes, avaliacao_artistas, avaliacao_filme)
VALUES (2, 1, 1, 3, 1);

INSERT INTO Curtir(id_pessoa, id_artistas, id_filmes, avaliacao_artistas, avaliacao_filme)
VALUES (3, 2, 2, 2, 5);

INSERT INTO Curtir(id_pessoa, id_artistas, id_filmes, avaliacao_artistas, avaliacao_filme)
VALUES (3, 3, 3, 5, 5);

INSERT INTO Categorias(id_filme, nome_categoria)
VALUES (1, 'Acao');

INSERT INTO Categorias(id_filme, nome_categoria)
VALUES (2, 'Acao');

INSERT INTO Categorias(id_filme, nome_categoria)
VALUES (3, 'Acao');

INSERT INTO Atores_Filmes(id_ator, id_filme)
VALUES (1, 2);

INSERT INTO Atores_Filmes(id_ator, id_filme)
VALUES (2, 3);

INSERT INTO Atores_Filmes(id_ator, id_filme)
VALUES (3, 1);

INSERT INTO Atores_Filmes(id_ator, id_filme)
VALUES (1, 3);

INSERT INTO Atores_Filmes(id_ator, id_filme)
VALUES (2, 2);

INSERT INTO Atores_Filmes(id_ator, id_filme)
VALUES (3, 3);

INSERT INTO Diretores_Filmes(id_diretor, id_filme)
VALUES (1, 1);

INSERT INTO Diretores_Filmes(id_diretor, id_filme)
VALUES (1, 2);

INSERT INTO Diretores_Filmes(id_diretor, id_filme)
VALUES (2, 1);

INSERT INTO Diretores_Filmes(id_diretor, id_filme)
VALUES (2, 2);

INSERT INTO Diretores_Filmes(id_diretor, id_filme)
VALUES (3, 3);

INSERT INTO Diretores_Filmes(id_diretor, id_filme)
VALUES (3, 1);

INSERT INTO Musicos(id, nome_real, estilo, data_de_nascimento)
VALUES (1, 'John Clayton Mayer', 'Blues', '16/outubro/1977');

INSERT INTO Musicos(id, nome_real, estilo, data_de_nascimento)
VALUES (2, 'Edward Christopher Sheeran', 'Pop Acustico', '17/fevereiro/1991');

INSERT INTO Musicos(id, nome_real, estilo, data_de_nascimento)
VALUES (3, 'Capitao America', 'Danca', '1/1/1');

INSERT INTO Musicos(id, nome_real, estilo, data_de_nascimento)
VALUES (4, 'Fofao', 'Parkour', '1/1/1');

INSERT INTO Musicos(id, nome_real, estilo, data_de_nascimento)
VALUES (5, 'Popeye', 'Danca', '1/1/1');

INSERT INTO Musicos(id, nome_real, estilo, data_de_nascimento)
VALUES (6, 'Mickey', 'Danca', '1/1/1');

INSERT INTO Musicos(id, nome_real, estilo, data_de_nascimento)
VALUES (7, 'Bozo', 'Danca', '1/1/1');

INSERT INTO Bandas(id_banda, id_musico)
VALUES (1, 3);

INSERT INTO Bandas(id_banda, id_musico)
VALUES (1, 4);

INSERT INTO Bandas(id_banda, id_musico)
VALUES (1, 5);

INSERT INTO Bandas(id_banda, id_musico)
VALUES (1, 6);

INSERT INTO Bandas(id_banda, id_musico)
VALUES (1, 7);

INSERT INTO Bandas(id_banda, id_musico)
VALUES (2, 1);

INSERT INTO Bandas(id_banda, id_musico)
VALUES (3,2);

INSERT INTO Cantores(id_artista, id_musico)
VALUES (2, 1);

INSERT INTO Cantores(id_artista, id_musico)
VALUES (3, 2);
