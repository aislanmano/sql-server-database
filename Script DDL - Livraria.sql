CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE EDITORA (
codeditora integer NOT NULL identity,
nome varchar(100) NOT NULL,
CONSTRAINT PK_edi_codeditora PRIMARY KEY(codeditora)
);

CREATE TABLE ASSUNTO (
codsigla integer not null identity,
sigla char(1) NOT NULL,
assunto varchar(100) NOT NULL,
CONSTRAINT PK_ass_cod_sigla PRIMARY KEY(codsigla)
);

CREATE TABLE LOJA (
codloja integer NOT NULL identity,
CNPJ integer,
nome varchar(150) NOT NULL,
email varchar(80),
CONSTRAINT PK_loj_codloja PRIMARY KEY(codloja)
);

CREATE TABLE LIVRO (
codlivro integer not null identity,
titulo varchar(50) NOT NULL,
datapublicacao Date,
numpags integer,
preco numeric(6,2),
codeditora integer NOT NULL,
codsigla integer NOT NULL,
codloja integer NOT NULL,
CONSTRAINT PK_liv_codlivro PRIMARY KEY(codlivro)
);

CREATE TABLE AUTOR (
codautor integer NOT NULL identity,
nome varchar(150) NOT NULL,
CPF integer NOT NULL,
datanasc date,
Sexo CHAR(1),
nacionalidade varchar(100),
matricula integer,
CONSTRAINT PK_aut_matricula PRIMARY KEY(codautor),
CONSTRAINT UK_aut_cpf UNIQUE(cpf),
CONSTRAINT CK_aut_sexo CHECK(sexo in('M','F'))
);

CREATE TABLE LIVRO_AUTORIA (
CodLivroAutoria integer NOT NULL identity,
codlivro integer NOT NULL,
codautor integer NOT NULL,
CONSTRAINT FK_livaut_codLivroautoria PRIMARY KEY (codlivroautoria)
);

CREATE TABLE CARTAO (
  codcartao integer not null identity,
  descricaocartao varchar(30) not null,
  categoria varchar(20),
  tipocartao varchar(10),
  CONSTRAINT PK_car_codcar primary key(codcartao)
);

CREATE TABLE CLIENTE (
codcliente integer not null identity,
CPF integer,
datanasc date,
nome varchar(150) NOT NULL,
nacionalidade varchar(100),
codcartao integer,
codloja integer,
CONSTRAINT PK_cli_codcliente PRIMARY KEY(codcliente)
);

CREATE TABLE VENDA (
codvenda integer not null identity,
total numeric(6,2),
datavenda date,
codloja integer,
codcliente integer NOT NULL,
CONSTRAINT PK_ven_codvenda PRIMARY KEY(codvenda)
);

CREATE TABLE ITENSVENDA (
coditemvenda integer not null identity,
quantidade integer NOT NULL,
precounitario numeric(6,2),
precototalunitario numeric(6,2),
codlivro integer not null,
codvenda integer not null,
CONSTRAINT PK_item_ven_codvenda PRIMARY KEY(coditemvenda)
);

CREATE TABLE EDITORAAUX(
CODEDITORA integer,
NOME VARCHAR(100),
CONSTRAINT PK_edi_codeditoraaux primary key(codeditora)
);

CREATE TABLE LOG(usuario varchar(100), datahora varchar(25));

CREATE TABLE AUDITORIA(
                      codlivro integer not null identity,
                      precoantigo numeric(6,2),
                      preconovo numeric(6,2),
                      datahora datetime,
                      CONSTRAINT PK_Auditoria primary key(codlivro)
                      );

 -- COMANDOS DML - POPULANDO O BANCO DE DADOS
 -- TABELA EDITORA
 
INSERT INTO EDITORA(nome) VALUES('MIRANDELA EDITORA');
INSERT INTO EDITORA(nome) VALUES('EDITORA VIA-NORTE');
INSERT INTO EDITORA(nome) VALUES('EDITORA ILHAS TIJUCA');
INSERT INTO EDITORA(nome) VALUES('MARIA JOSÉ EDITORA');
INSERT INTO EDITORA(nome) VALUES('EDITORA DIZ');
INSERT INTO EDITORA(nome) VALUES('CLASSIC EDITORA');

-- TABELA LOJA
INSERT INTO LOJA(cnpj, nome) VALUES(99991, 'Tabajara 1');
INSERT INTO LOJA(cnpj, nome) VALUES(99992, 'Tabajara 2');

-- TABELA ASSUNTO
INSERT INTO ASSUNTO(sigla, assunto) VALUES('B', 'Banco de dados');
INSERT INTO ASSUNTO(sigla, assunto) VALUES('P', 'Programação');
INSERT INTO ASSUNTO(sigla, assunto) VALUES('R', 'Redes');
INSERT INTO ASSUNTO(sigla, assunto) VALUES('S', 'Sistemas operacionais');
INSERT INTO ASSUNTO(sigla, assunto) VALUES('G', 'Gerência de Projetos');
INSERT INTO ASSUNTO(sigla, assunto) VALUES('E', 'Engenharia de Software');

-- TABELA LIVRO
INSERT INTO LIVRO(titulo, preco, numpags, datapublicacao, codeditora, codsigla, codloja) VALUES ('BANCO DE DADOS PARA A WEB', 31.25, 55, '1999-01-20', 1, 1, 1);
INSERT INTO LIVRO(titulo, preco, numpags, datapublicacao, codeditora, codsigla, codloja) VALUES ('PROGRAMANDO EM LINGUAGEM C', 30.55, 47, '1997-10-01', 1, 2, 1);
INSERT INTO LIVRO(titulo, preco, numpags, datapublicacao, codeditora, codsigla, codloja) VALUES ('PROGRAMANDO EM LINGUAGEM C++', 111.52, 103, '1998-11-01', 3, 2, 1);
INSERT INTO LIVRO(titulo, preco, numpags, datapublicacao, codeditora, codsigla, codloja) VALUES ('BANCO DE DADOS NA BIOINFORMATICA', 48.99, 66, '2015-05-05', 2, 1, 1);
INSERT INTO LIVRO(titulo, preco, numpags, datapublicacao, codeditora, codsigla, codloja) VALUES ('REDES DE COMPUTADORES', 42.20, 93, '2003-10-10', 2, 3, 1);
INSERT INTO LIVRO(titulo, preco, numpags, datapublicacao, codeditora, codsigla, codloja) VALUES ('RESUMO DO GUIA PMBOOK', 21.25, 87, '1996-09-01', 2, 5, 2);
INSERT INTO LIVRO(titulo, preco, numpags, datapublicacao, codeditora, codsigla, codloja) VALUES ('CONCEITOS DE ENGENHARIA DE SOFTWARE', 30.55, 76, '1996-09-01', 3, 6, 2);
INSERT INTO LIVRO(titulo, preco, numpags, datapublicacao, codeditora, codsigla, codloja) VALUES ('CONCEITOS DE GERENCIAMENTO DE PROJETOS', 40.00, 68, '2013-05-01', 3, 5, 2);
INSERT INTO LIVRO(titulo, preco, numpags, datapublicacao, codeditora, codsigla, codloja) VALUES ('TESTE DE SOFTWARE', 42.20, 75, '2000-05-01', 3, 6, 1);
INSERT INTO LIVRO(titulo, preco, numpags, datapublicacao, codeditora, codsigla, codloja) VALUES ('QUALIDADE DE SOFTWARE', 46.00, 103, '2000-05-01', 3, 6, 2);

-- TABELA AUTOR
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(111, 890001, '1978-08-08', 'Luciano Blomberg', 'Brasileira');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(112, 780002, '1959-03-23', 'Carlos Padilha', 'Brasileira');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(113, 920003, '1981-12-11', 'Ana Silveira Escobar', 'Colombiana');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(114, 810004, '1963-11-01', 'César Oliveira', 'Brasileira');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(115, 820005, '1965-04-25', 'Marcos Andrade', 'Brasileira');  
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(116, 890006, '1979-08-13', 'Carla Maldonado Silva', 'Brasileira');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(117, 780007, '1959-05-24', 'Carlos Tenório', 'Equatoriana');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(118, 770008, '1960-11-29', 'Maria Fonseca', 'Brasileira');

-- TABELA LIVRO_AUTORIA
INSERT INTO LIVRO_AUTORIA(codlivro, codautor) VALUES(1,1);
INSERT INTO LIVRO_AUTORIA(codlivro, codautor) VALUES(1,2);
INSERT INTO LIVRO_AUTORIA(codlivro, codautor) VALUES(1,3);
INSERT INTO LIVRO_AUTORIA(codlivro, codautor) VALUES(2,4);
INSERT INTO LIVRO_AUTORIA(codlivro, codautor) VALUES(3,4);
INSERT INTO LIVRO_AUTORIA(codlivro, codautor) VALUES(3,5);
INSERT INTO LIVRO_AUTORIA(codlivro, codautor) VALUES(4,1);
INSERT INTO LIVRO_AUTORIA(codlivro, codautor) VALUES(4,6);
INSERT INTO LIVRO_AUTORIA(codlivro, codautor) VALUES(5,7);
INSERT INTO LIVRO_AUTORIA(codlivro, codautor) VALUES(5,8);

-- TABELA CARTÃO
INSERT INTO CARTAO(descricaocartao, categoria, tipocartao) VALUES('MASTERCARD','SPECIAL', 'CRÉDITO');
INSERT INTO CARTAO(descricaocartao, categoria, tipocartao) VALUES('MASTERCARD','SPECIAL', 'DÉBITO');
INSERT INTO CARTAO(descricaocartao, categoria, tipocartao) VALUES('MASTERCARD','PREMIUM', 'DÉBITO');  
INSERT INTO CARTAO(descricaocartao, categoria, tipocartao) VALUES('MASTERCARD','PREMIUM', 'CRÉDITO');
INSERT INTO CARTAO(descricaocartao, categoria, tipocartao) VALUES('VISA', 'GOLD', 'CRÉDITO'); 
INSERT INTO CARTAO(descricaocartao, categoria, tipocartao) VALUES('VISA', 'GOLD', 'DÉBITO');
INSERT INTO CARTAO(descricaocartao, categoria, tipocartao) VALUES('VISA', 'GOLD PLUS', 'CRÉTIDO');
INSERT INTO CARTAO(descricaocartao, categoria, tipocartao) VALUES('VISA', 'GOLD PLUS', 'DÉBITO');

-- TABELA CLIENTE
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(920003, '1981-12-11', 'Ana Escobar', 'Colombiana', 1);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(890006, '1979-08-13', 'Carla Silva', 'Brasileira', 1);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(890106, '1979-08-15', 'João Inácio Magalhães', 'Brasileira', 2);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(890206, '1977-10-29', 'César Gonçalves', 'Brasileira', 2);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(890306, '1976-03-30', 'Flávio Aguiar Fonseca', 'Brasileira' ,3);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(890406, '1966-07-02', 'Henrique Meirelles', 'Brasileira', 2);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(890506, '1969-09-01', 'Cleide Castanheira', 'Brasileira', 2);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(890606, '1982-10-15', 'Júlio Siqueira', 'Brasileira', 3);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(890706, '1951-09-02', 'Elza Saldanha Prado', 'Brasileira', 3) ;
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(890806, '1980-10-20', 'Marco Antônio Rossi', 'Brasileira', 4);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(890906, '1981-03-04', 'Marco Luis Silva', 'Brasileira', 2);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(891006, '1975-10-07', 'Maria da Souza Cruzi', 'Brasileira', 4);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(891106, '1978-11-13', 'André Cesar Siqueira', 'Brasileira', 5);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(891206, '1987-04-23', 'Débora Prado', 'Brasileira', 6);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(891306, '1977-04-04', 'Cristina Castanheira', 'Brasileira', 7);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(891406, '1989-07-13', 'Manoel Bezerra', 'Brasileira', 8);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(891506, '1937-09-02', 'Ester Moraes', 'Brasileira', 8);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade, codcartao) VALUES(891606, '1987-10-20', 'Viviane Saldanha Siqueira', 'Brasileira', 6);

-- TABELA VENDA
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(31.20,'2016-02-12', 1, 6);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(48.00,'2017-10-15', 1, 6);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(126.00, '2016-06-30', 1, 6); 
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(334.50, '2017-02-05', 1, 7);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(42.00, '2016-06-06', 1, 7);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(31.20, '2017-06-25', 1, 5);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(42.00, '2016-06-10', 1, 5);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(111.50, '2017-07-29', 1, 5);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(62.40, '2016-06-15', 1, 7);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(156.00, '2016-05-10', 1, 8);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(48.00, '2017-03-17', 1, 7);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(334.50, '2017-04-16', 1, 4);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(111.50, '2016-05-12', 1, 9);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(48.00, '2016-07-10', 1 , 9); 
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(42.00, '2016-07-12', 1 , 9); 
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(84.00, '2016-07-13', 1, 11); 
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(31.20, '2016-07-13', 1, 4);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(48.00, '2016-08-13', 1, 4); 
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(156.00, '2017-08-15', 1, 8);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(96.00, '2017-09-16', 1, 8);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(84.00,'2017-03-06', 1, 8);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(42.00,'2017-09-14', 1, 9);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(30.00, '2016-10-13', 2, 8);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(111.50, '2016-10-12', 2, 8);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(31.20,'2016-06-12', 2, 10);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(80.00, '2016-08-20', 2, 3);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(150.00, '2016-07-05', 2, 3);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(446.00, '2016-06-12', 2, 3);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(31.20, '2016-02-13', 2, 3);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(31.20, '2016-02-13', 2, 2);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(30.00, '2016-05-19', 2, 2);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(111.50, '2016-03-19', 2,5);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(40.00,'2016-06-13', 2, 5);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(30.00,'2017-04-14', 2, 7);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(60.00, '2017-05-15', 2, 10);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(84.00,'2017-06-15', 2, 10);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(111.50, '2017-06-13', 2, 9);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(30.00, '2017-09-10', 2, 9);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(100.00, '2017-11-01', 2, 12);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(62.40, '2017-11-15', 2, 12);
INSERT INTO VENDA(total, datavenda, codloja, codcliente) VALUES(30.00, '2017-11-01', 2, 4);

-- TABELA ITENS DA VENDA
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(1, 1, 31.20, 31.20, 1);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(2, 1, 48.00, 48.00, 4);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(3, 3, 126.00, 126.00, 5);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(4, 2, 334.50, 167.25, 7);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(5, 1, 42.00, 42.00, 7);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(6, 1, 31.20, 31.20, 5);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(7, 1, 42.00, 42.00, 5);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(8, 1, 111.50, 11.50, 5);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(9, 2, 62.40, 31.20, 7);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(10, 5, 156.00, 52.00, 8);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(11, 2, 96.00, 48.00, 8);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(12, 1, 42.00, 42.00, 9);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(13, 1, 111.50, 111.50, 8);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(14, 1, 31.20, 31.20, 10);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(15, 8, 80.00, 10.50, 3);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(16, 1, 31.20, 31.20, 3);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(17, 1, 31.20, 31.20, 2);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(18, 1, 30.00, 30.00, 7);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(19, 2, 60.00, 30.00, 10);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(20, 1, 111.50, 115.50, 9);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(21, 2, 100.00, 50.00, 9);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(22, 2, 62.40, 31.20, 9);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(23, 1, 30.00, 30.00, 4);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(24, 1, 31.20, 31.20, 10);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(25, 2, 40.00, 80.00, 8);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(26, 5, 30.00, 150.00, 8);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(27, 10, 46.00, 446.00, 3);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(28, 1, 31.20, 31.20, 3);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(29, 1, 31.20, 31.20, 2);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(30, 1, 30.00, 30.00, 2);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(31, 2, 80.00, 40.00, 8);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(32, 2, 80.00, 40.00, 5);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(33, 1, 30.00, 30.00, 7);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(34, 2, 60.00, 30.00, 10);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(35, 2, 84.00, 44.00, 10);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(36, 1, 111.50, 111.50, 9);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(37, 1, 30.00, 30.00, 9);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(38, 2, 100.00, 50.00, 10);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(39, 2, 62.40, 31.20, 10);
INSERT INTO ITENSVENDA(codvenda, quantidade, precototalunitario, precounitario, codlivro) VALUES(40, 1, 30.00, 30.00, 4);

-- TABELA EDITORAAUX
INSERT INTO EDITORAAUX(codeditora, nome) VALUES(6, 'EDITORA MACEDO');
INSERT INTO EDITORAAUX(codeditora, nome) VALUES(7, 'EDITORA SILVA');
INSERT INTO EDITORAAUX(codeditora, nome) VALUES(8, 'GLOBO');
INSERT INTO EDITORAAUX(codeditora, nome) VALUES(9, 'EDIPUCRS');
