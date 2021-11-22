CREATE DATABASE DB_UNIVERSIDADE;

USE DB_UNIVERSIDADE;

CREATE TABLE ALUNOS
(
    codigo int not null primary key,
    nome varchar(60) not null,
    data_nascimento date not null,
    sexo char(1) not null
);

INSERT INTO ALUNOS (codigo, nome, data_nascimento, sexo)
VALUES (1, 'Aluno 1', '1980-05-01', 'F');
INSERT INTO ALUNOS (codigo, nome, data_nascimento, sexo)
VALUES (2, 'Aluno 2', '1982-10-16', 'M');
INSERT INTO ALUNOS (codigo, nome, data_nascimento, sexo)
VALUES (3, 'Aluno 3', '1984-06-22', 'M');
INSERT INTO ALUNOS (codigo, nome, data_nascimento, sexo)
VALUES (4, 'Aluno 4', '1981-02-10', 'M');
INSERT INTO ALUNOS (codigo, nome, data_nascimento, sexo)
VALUES (5, 'Aluno 5', '1983-12-21', 'F');
INSERT INTO ALUNOS (codigo, nome, data_nascimento, sexo)
VALUES (6, 'Aluno 6', '1981-11-15', 'M');
INSERT INTO ALUNOS (codigo, nome, data_nascimento, sexo)
VALUES (7, 'Aluno 7', '1982-03-03', 'F');
INSERT INTO ALUNOS (codigo, nome, data_nascimento, sexo)
VALUES (8, 'Aluno 8', '1984-08-14', 'F');
	
CREATE TABLE DISCIPLINAS
(   
    codigo char(05) not null primary key,
    descricao varchar(80) not null,
    ch int  not null,
    pre_requisito char(05) null,
    professor int not null 
);

INSERT INTO DISCIPLINAS (codigo,descricao,ch,pre_requisito,professor)
VALUES('AD10','Banco de Dados I',72,'',1);
INSERT INTO DISCIPLINAS (codigo,descricao,ch,pre_requisito,professor)
VALUES('AD20','Banco de Dados II',36,'AD10',1);
INSERT INTO DISCIPLINAS (codigo,descricao,ch,pre_requisito,professor)
VALUES('TC10','Teoria da Comunicação I',18,'',2);
INSERT INTO DISCIPLINAS (codigo,descricao,ch,pre_requisito,professor)
VALUES('PCC10','Projeto de Curso I',320,'LP10',3);
INSERT INTO DISCIPLINAS (codigo,descricao,ch,pre_requisito,professor)
VALUES('LP10','Linguagem de Programação I',108,'',4);

CREATE TABLE MATRICULA
(
    aluno int not null,
    disciplina char(05) not null
);

INSERT INTO MATRICULA (aluno,disciplina) VALUES(1,'AD10');
INSERT INTO MATRICULA (aluno,disciplina) VALUES(1,'TC10');
INSERT INTO MATRICULA (aluno,disciplina) VALUES(2,'AD10');
INSERT INTO MATRICULA (aluno,disciplina) VALUES(2,'TC10');
INSERT INTO MATRICULA (aluno,disciplina) VALUES(2,'PCC10');
INSERT INTO MATRICULA (aluno,disciplina) VALUES(3,'AD10');
INSERT INTO MATRICULA (aluno,disciplina) VALUES(3,'TC10');
INSERT INTO MATRICULA (aluno,disciplina) VALUES(5,'LP10');
INSERT INTO MATRICULA (aluno,disciplina) VALUES(6,'LP10');
INSERT INTO MATRICULA (aluno,disciplina) VALUES(6,'TC10');
INSERT INTO MATRICULA (aluno,disciplina) VALUES(7,'AD10');
INSERT INTO MATRICULA (aluno,disciplina) VALUES(7,'TC10');
INSERT INTO MATRICULA (aluno,disciplina) VALUES(7,'PCC10');

CREATE TABLE PROFESSORES 
(
    codigo int not null primary key,
    nome varchar(40) not null
);

INSERT INTO PROFESSORES (codigo,nome) VALUES(1,'Professor 1');
INSERT INTO PROFESSORES (codigo,nome) VALUES(2,'Professor 2');
INSERT INTO PROFESSORES (codigo,nome) VALUES(3,'Professor 3');
INSERT INTO PROFESSORES (codigo,nome) VALUES(4,'Professor 4');
INSERT INTO PROFESSORES (codigo,nome) VALUES(5,'Professor 5');

CREATE TABLE BOLETIM
(
    aluno int not null,
    disciplina char(05) not null,
    faltas int not null,
    nota1 int not null,
    nota2 int not null,
    nota3 int not null
);	


INSERT INTO BOLETIM (aluno,disciplina,faltas,nota1,nota2,nota3) VALUES (1,'AD10',2,100,80,95);
INSERT INTO BOLETIM (aluno,disciplina,faltas,nota1,nota2,nota3) VALUES (2,'TC10',3,60,100,70);
INSERT INTO BOLETIM (aluno,disciplina,faltas,nota1,nota2,nota3) VALUES (2,'PCC10',0,80,65,95);
INSERT INTO BOLETIM (aluno,disciplina,faltas,nota1,nota2,nota3) VALUES (3,'AD10',2,55,100,75);
INSERT INTO BOLETIM (aluno,disciplina,faltas,nota1,nota2,nota3) VALUES (3,'TC10',1,50,95,70);
INSERT INTO BOLETIM (aluno,disciplina,faltas,nota1,nota2,nota3) VALUES (5,'LP10',4,100,80,60);
INSERT INTO BOLETIM (aluno,disciplina,faltas,nota1,nota2,nota3) VALUES (6,'LP10',6,85,80,75);
INSERT INTO BOLETIM (aluno,disciplina,faltas,nota1,nota2,nota3) VALUES (6,'TC10',4,100,50,80);
INSERT INTO BOLETIM (aluno,disciplina,faltas,nota1,nota2,nota3) VALUES (7,'AD10',0,35,80,100);
INSERT INTO BOLETIM (aluno,disciplina,faltas,nota1,nota2,nota3) VALUES (7,'PCC10',1,95,45,60);
