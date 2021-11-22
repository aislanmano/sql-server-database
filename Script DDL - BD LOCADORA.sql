IF DB_ID('LOCADORA') IS NULL
  CREATE DATABASE LOCADORA;

USE LOCADORA;

IF OBJECT_ID('CLIENTES') IS NULL
CREATE TABLE clientes(
	CodC int not null identity,
	nome varchar(80) not null,
	cpf char(11) not null,
	data_nasc date,
	sexo char(1),
	salario numeric (9,2),
	CONSTRAINT PK_CodigoCliente PRIMARY KEY (CodC),
	CONSTRAINT UK_CPFCliente UNIQUE (cpf),
	CONSTRAINT CK_SexoCliente CHECK (sexo in ('M','F')),
	CONSTRAINT CK_SalarioCliente CHECK (salario > 0)
);

IF OBJECT_ID('dvd') IS NULL
CREATE TABLE dvd (
	CodD int not null identity,
	titulo varchar(40) not null,
	genero varchar(15),
	duracao time,
	situacao varchar(12) default ('Disponível'),
	CONSTRAINT PK_Codigo_dvd PRIMARY KEY (CodD),
	CONSTRAINT CK_Situacao CHECK (situacao in ('Alugada','Disponível'))
);

IF OBJECT_ID('locacoes') IS NULL
CREATE TABLE locacoes (
	CodC int not null,
	CodD int not null,
	data date,
	CONSTRAINT FK_Codigo_locacoes FOREIGN KEY (CodC) REFERENCES clientes(CodC),
	CONSTRAINT FK_locacoes_dvd FOREIGN KEY (CodD) REFERENCES dvd(CodD)
);


INSERT INTO CLIENTES(nome, CPF, data_nasc, sexo, salario)
             VALUES ('JOSE AUGUSTO', '123145','2000-10-20', 'M', 1000),
			        ('MARIA APARECIDA','432345', '1979-03-05', 'F',850),
			        ('LUCAS PEREIRA',	'909122', '2002-05-10', 'M', 1800),
			        ('MARCELO ALMEIDA','212333', '2003-06-1', 'M', 1259.65),
			        ('LUCIANA MOURA',	'907866', '1980-03-03','F',	932.75);

INSERT INTO dvd (Titulo, Genero, Duracao)
			VALUES ('Matrix', 'Ficção', '02:30:00');
INSERT INTO dvd (Titulo, Genero, Duracao)
			VALUES ('Piratas do Caribe','Ficção','02:10:00');
INSERT INTO dvd (Titulo, Genero, Duracao)
			VALUES ('American Pie',	'Comédia', '01:55:00');
INSERT INTO dvd (Titulo, Genero, Duracao)
			VALUES ('Se meu fusca falasse',	'Aventura','01:35:00');
INSERT INTO dvd (Titulo, Genero, Duracao)
			VALUES ('Cinderela', 'Infantil', '01:45:00');
INSERT INTO dvd (Titulo, Genero, Duracao)
			VALUES ('João pé de feijão','Aventura', '02:30:00');


INSERT INTO locacoes (CodC, CodD, Data)
		VALUES(1   ,  1  , '2014-11-11');
INSERT INTO locacoes (CodC, CodD, Data)
		VALUES (1, 2, '2015-02-03');
INSERT INTO locacoes (CodC, CodD, Data)
		VALUES (3, 5, '2015-04-21');
INSERT INTO locacoes (CodC, CodD, Data)
		VALUES (3, 1, '2015-07-15');
INSERT INTO locacoes (CodC, CodD, Data)
		VALUES (3, 4, '2015-03-08');
INSERT INTO locacoes (CodC, CodD, Data)
		VALUES (3, 3, '2015-02-26');
INSERT INTO locacoes (CodC, CodD, Data)
		VALUES (4, 6, '2014-11-25');
INSERT INTO locacoes (CodC, CodD, Data)
		VALUES (4, 2, '2015-04-12');
INSERT INTO locacoes (CodC, CodD, Data)
		VALUES (5, 6, '2015-09-07');
INSERT INTO locacoes (CodC, CodD, Data)
		VALUES (5, 2, '2015-07-04');
INSERT INTO locacoes (CodC, CodD, Data)
		VALUES (2, 6, '2015-09-07');
INSERT INTO locacoes (CodC, CodD, Data)
		VALUES (4, 3, '2015-02-03');
INSERT INTO locacoes (CodC, CodD, Data)
		VALUES (5, 1, '2015-03-08');

