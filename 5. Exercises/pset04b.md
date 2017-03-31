### Tarefa: Prática de SQL
  - [ ] Feito

#### Descrição do mini-mundo

Nosso sistema organiza filas de táxis para atendimento de clientes. Um táxi pode ter motoristas diferentes. Uma corrida é realizada por um táxi com um cliente numa determinada data. Filas organizam a prioridade dos motoristas para atendimento dos clientes. Quando um motorista entra numa área, o sistema o registra na fila, com hora de entrada e a quantidade de quilômetros rodados no dia. Quando um motorista sai da fila, o sistema registra a hora de saída. Os demais atributos são de acordo com o esquema abaixo.

![](índice.png)

#### Código para criação das tabelas

```sql
CREATE TABLE Taxi (
Placa VARCHAR(7) NOT NULL,
Marca VARCHAR(30) NOT NULL,
Modelo VARCHAR(30) NOT NULL,
AnoFab INTEGER,
Licenca VARCHAR(9),
PRIMARY KEY(Placa)
);


CREATE TABLE Cliente (
CliId VARCHAR(4) NOT NULL,
Nome VARCHAR(80) NOT NULL,
CPF VARCHAR(14) NOT NULL,
PRIMARY KEY(CliId)
);


CREATE TABLE Corrida (
CliId VARCHAR(4) NOT NULL,
Placa VARCHAR(7) NOT NULL,
DataPedido DATE NOT NULL,
PRIMARY KEY(CliId, Placa, DataPedido),
FOREIGN KEY(CliId)
REFERENCES Cliente(CliId)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
FOREIGN KEY(Placa)
REFERENCES Taxi(Placa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);


CREATE TABLE Motorista (
CNH VARCHAR(6) NOT NULL,
Nome VARCHAR(80) NOT NULL,
CNHValid INTEGER,
Placa VARCHAR(7) NOT NULL,
PRIMARY KEY(CNH),
FOREIGN KEY(Placa)
REFERENCES Taxi(Placa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);


CREATE TABLE Zona (
Zona VARCHAR(40) NOT NULL,
PRIMARY KEY(Zona)
);

CREATE TABLE Fila (
Zona VARCHAR(40) NOT NULL,
CNH VARCHAR(6) NOT NULL,
DataHoraIn TIMESTAMP,
DataHoraOut TIMESTAMP,
KmIn INTEGER,
PRIMARY KEY (Zona, CNH),
FOREIGN KEY(Zona)
REFERENCES Zona(Zona)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
FOREIGN KEY(CNH)
REFERENCES Motorista(CNH)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
```

#### Código para inserção de tuplas

```sql
INSERT INTO Cliente VALUES ('1532', 'Asdrúbal', '448.754.253-65');
INSERT INTO Cliente VALUES ('1755', 'Doriana', '567.387.387-44');
INSERT INTO Cliente VALUES ('1780', 'Quincas', '546.373.762-02');


INSERT INTO Taxi VALUES ('DAE6534', 'Ford', 'Fiesta', 1999, 'MN572345');
INSERT INTO Taxi VALUES ('DKL4598', 'Wolkswagen', 'Gol', 2001, 'AU876543');
INSERT INTO Taxi VALUES ('DKL7878', 'Ford', 'Fiesta', 2001, 'OP102938');
INSERT INTO Taxi VALUES ('JDM8776', 'Wolkswagen', 'Santana', 2002, 'QM365923');
INSERT INTO Taxi VALUES ('JJM3692', 'Chevrolet', 'Corsa', 1999, 'UU335577');
INSERT INTO Taxi VALUES ('DXF5263', 'Ford', 'Escort', 2001, 'GG5263526');
INSERT INTO Taxi VALUES ('MJN6578', 'Wolkswagen', 'Santana', 1998, 'KL856326');
INSERT INTO Taxi VALUES ('MLA4545', 'Wolkswagen', 'Gol', 2000, 'YK6574837');
INSERT INTO Taxi VALUES ('DXA7878', 'Ford', 'Escort', 2000, 'GG5263526');
INSERT INTO Taxi VALUES ('DXF6767', 'Wolkswagen', 'Santana', 1998, 'YK7890081');

INSERT INTO Corrida VALUES ('1755', 'DAE6534', '2003-02-15');
INSERT INTO Corrida VALUES ('1780', 'JDM8776', '2003-02-18');
INSERT INTO Corrida VALUES ('1755', 'DKL7878', '2003-02-16');
INSERT INTO Corrida VALUES ('1780', 'DKL4598', '2003-02-17');
INSERT INTO Corrida VALUES ('1532', 'DKL4598', '2003-02-18');
INSERT INTO Corrida VALUES ('1780', 'DAE6534', '2003-02-16');

INSERT INTO Motorista VALUES ('657483', 'Asdrubal', 1, 'DXF5263');
INSERT INTO Motorista VALUES ('567892', 'Quincas', 1, 'MLA4545');
INSERT INTO Motorista VALUES ('452635', 'Zandor', 1, 'DXA7878');
INSERT INTO Motorista VALUES ('452452', 'Alcebiades', 1, 'DXF6767');
INSERT INTO Motorista VALUES ('555555', 'Bonerges', 1, 'DAE6534');
INSERT INTO Motorista VALUES ('987654', 'Doriana', 1, 'JDM8776');

INSERT INTO Zona VALUES ('Barão Geraldo');
INSERT INTO Zona VALUES ('Cambuí');
INSERT INTO Zona VALUES ('Taquaral');
INSERT INTO Zona VALUES ('Unicamp');

INSERT INTO Fila VALUES ('Barão Geraldo', '567892', '2002-06-05 09:00:00', '2002-06-05 09:30:00', 4630);
INSERT INTO Fila VALUES ('Barão Geraldo', '657483', '2002-06-05 07:30:00', '2002-06-05 07:45:00', 1567);
INSERT INTO Fila VALUES ('Taquaral', '452452', '2002-06-05 09:00:00', '2002-06-05 09:50:00', 5000);
INSERT INTO Fila VALUES ('Taquaral', '657483', '2002-06-06 08:00:00', '2002-06-06 08:07:00', 7900);
INSERT INTO Fila VALUES ('Unicamp', '452635', '2002-06-02 08:00:00', '2002-06-02 08:00:00', 4800);
INSERT INTO Fila VALUES ('Unicamp', '567892', '2002-06-06 06:00:00', '2002-06-06 06:00:00', 5263);
INSERT INTO Fila VALUES ('Unicamp', '657483', '2002-06-06 23:00:00', '2002-06-06 23:00:00', 4541);
INSERT INTO Fila VALUES ('Unicamp', '452452', '2002-06-05 10:30:00', '2002-06-05 10:30:00', 7800);
INSERT INTO Fila VALUES ('Taquaral', '555555', '2002-06-06 08:10:00', '2002-06-06 08:10:00', 7910);
INSERT INTO Fila VALUES ('Unicamp', '987654', '2002-06-05 10:30:00', '2002-06-05 10:35:00', 7850);
```

#### Exercícios práticos
1. Motoristas cujo nome comeca com a letra A
```sql
SELECT * FROM motorista WHERE nome LIKE 'A%';
```
2. Zona, quilometragem e data/hora de cada taxi que esta/esteve em uma fila

3. Quais as zonas que tem ou tiveram algum taxi na fila (sem repeticao)

4. CNH dos motoristas que jah estiveram ou estao nas filas das zonas Taquaral ou Unicamp

5. CNH dos motoristas que que já fizeram corridas mas nunca estiveram nem estao nas filas das zonas Taquaral ou Unicamp

6. Produto cartesiano Cliente x Corrida

7. Clientes (id e nome) e respectivas corridas (placa e data do pedido)

8. Modelo de taxi para cada corrida

9. Modelos de taxi tomados por cada cliente

10. CNH e Nome dos motoristas que jah estiveram e estao na fila

11. Data/Hora entrada, nome e modelo dos taxis que jah estiveram e estao na fila

12. Marca e modelo dos taxis que jah estiveram e estao na fila (sem repeticao)

13. Nome dos taxistas que jah estiveram e estao na fila em ordem alfabetica

14. Para cada zona atendida, quantos taxis jah passaram pela fila (contando com os que estao atualmente)

15. Marca e modelo dos taxis que estao/estiveram em alguma fila com quantidades

16. Menor quilometragem de entrada em cada zona

17. Zona, menor km, media km, maior data/hora para cada zona

18. Zona, data e hora de entrada do proximo taxi a ser chamado em cada zona (menor data/hora entrada)
