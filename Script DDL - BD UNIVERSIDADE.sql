CREATE DATABASE DB_UNIVERSIDADE
GO

USE DB_UNIVERSIDADE
GO

CREATE TABLE ALUNOS
(
    codigo_aluno int not null primary key,
    nome varchar(60) not null,
    data_nascimento date not null,
    sexo char(1) not null
);

INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (1, 'Maria José da Silva', '1980-05-01', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (2, 'André Carlos Ferreira', '1982-10-16', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (3, 'Alice das Maravilhas', '1984-06-22', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (4, 'Carlos Vieira Santos', '1981-02-10', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (5, 'Mara Caroline Costa', '1983-12-21', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (6, 'Antenor da Cruz', '1981-11-15', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (7, 'Luzia Guimarães Souza', '1982-03-03', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (8, 'Carla Beatriz Carreira', '1984-08-14', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (9, 'Juliano Silva Costa', '1981-02-10', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (10, 'Mileide Santa', '1983-12-21', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (11, 'Matheus da Cruz Silva Santo', '1981-11-15', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (12, 'Rafaela Dias Santos', '1982-03-03', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (13, 'Katia Arruda Ciqueira', '1984-08-14', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (14, 'Marcos Ferreira Mendes', '1981-02-10', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (15, 'Marta Silva', '1983-12-21', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (16, 'Jamez Rodrigues', '1981-11-15', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (17, 'Luciana Neta Silva', '1982-03-03', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (18, 'Manoela Santa', '1984-05-06', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (19, 'Beatriz Correia', '1990-08-14', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (20, 'Daniela Medeiros', '1983-08-14', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (21, 'Fernanda Santana', '1900-06-08', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (22, 'Francisca Silva Cruz', '1998-08-02', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (23, 'Vinicius Ferrari', '1998-07-01', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (24, 'Zenaide Ceus', '1900-08-05', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (25, 'Tiago Manoel Silva', '1980-05-05', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (26, 'Pietra Cardoso', '1984-01-01', 'F');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (27, 'Arismar Souza', '1982-03-05', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (28, 'Jackson Antunes', '1991-01-01', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (29, 'Eveson Vieira Neto', '1982-03-09', 'M');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo)
VALUES (30, 'Tina Tuner Mineira', '1980-03-30', 'F');

	
CREATE TABLE CURSO
(   
    codigo_curso int not null primary key,
    descricao varchar(80) not null,
    sigla varchar(5),
);

INSERT INTO CURSO (codigo_curso,descricao,Sigla)
	VALUES(1,'Tecnologia em Rede de Computadores','TARC');
INSERT INTO CURSO (codigo_curso,descricao,Sigla)
	VALUES(2,'Tecnologia em Banco de Dados','TAB');
INSERT INTO CURSO (codigo_curso,descricao,Sigla)
	VALUES(3,'Sistema de Informação','SIS');

CREATE TABLE DISCIPLINAS
(   
    codigo_disciplina char(05) not null primary key,
    descricao varchar(80) not null,
    ch int  not null,
    sigla varchar(5) not null 
);

INSERT INTO DISCIPLINAS (codigo_disciplina, descricao, ch, sigla)
	VALUES(1,'Banco de Dados I',72,'AD10');
INSERT INTO DISCIPLINAS (codigo_disciplina, descricao, ch, sigla)
	VALUES(2,'Banco de Dados II',36,'AD20');
INSERT INTO DISCIPLINAS (codigo_disciplina, descricao, ch, sigla)
	VALUES(3,'Teoria da Comunicação I',18, 'TC10');
INSERT INTO DISCIPLINAS (codigo_disciplina, descricao, ch, sigla)
	VALUES(4,'Projeto de Curso I',320,'PCC10');
INSERT INTO DISCIPLINAS (codigo_disciplina, descricao, ch, sigla)
	VALUES(5,'Linguagem de Programação I',108,'LP10');
INSERT INTO DISCIPLINAS (codigo_disciplina, descricao, ch, sigla)
	VALUES(6,'Sistema Embarcados',108,'SE10');
INSERT INTO DISCIPLINAS (codigo_disciplina, descricao, ch, sigla)
	VALUES(7,'Sistemas Distribuidos',108,'SD01');
INSERT INTO DISCIPLINAS (codigo_disciplina, descricao, ch, sigla)
	VALUES(8,'Sistemas Operacionais',108,'SO10');
INSERT INTO DISCIPLINAS (codigo_disciplina, descricao, ch, sigla)
	VALUES(9,'Linguagem de Programação II',108,'LP2');
INSERT INTO DISCIPLINAS (codigo_disciplina, descricao, ch, sigla)
	VALUES(10,'Algoritmos',108,'AT10');

CREATE TABLE PROFESSORES 
(
    codigo_professor int not null primary key,
    nome varchar(40) not null
);

INSERT INTO PROFESSORES (codigo_professor, nome) VALUES(1, 'Leocildes Menezes');
INSERT INTO PROFESSORES (codigo_professor, nome) VALUES(2, 'Maria Cecilia Santos Preza');
INSERT INTO PROFESSORES (codigo_professor, nome) VALUES(3, 'Muricy Ramalho');
INSERT INTO PROFESSORES (codigo_professor, nome) VALUES(4, 'Antonio Oliveira Santos');
INSERT INTO PROFESSORES (codigo_professor, nome) VALUES(5, 'Abel Ferreira Cardoso');


CREATE TABLE MATRICULA
(
    codigo_matricula_curso_disciplina int not null primary key,
	codigo_aluno int not null,
    codigo_disciplina int not null,
	codigo_professor int not null
);

INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(1, 1, 1, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(2, 1, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(3, 1, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(4, 1, 4, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(5, 1, 5, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(6, 1, 6, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(7, 1, 7, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(8, 1, 8, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(9, 1, 9, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(10, 1, 10, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(11, 2, 1, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(12, 2, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(13, 2, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(14, 2, 4, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(15, 2, 5, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(16, 2, 6, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(17, 2, 7, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(18, 3, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(19, 3, 2, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(20, 3, 3, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(21, 3, 4, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(22, 3, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(23, 3, 6, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(24, 3, 7, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(25, 4, 1, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(26, 4, 2, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(27, 4, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(28, 4, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(29, 5, 1, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(30, 5, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(31, 5, 3, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(32, 5, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(33, 5, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(34, 5, 6, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(35, 5, 7, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(36, 6, 8, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(37, 6, 9, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(38, 6, 10, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(39, 6, 1, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(40, 6, 1, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(41, 6, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(42, 7, 3, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(43, 7, 10, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(44, 7, 9, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(45, 7, 8, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(46, 7, 7, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(47, 8, 6, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(48, 8, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(49, 8, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(50, 8, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(51, 8, 3, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(52, 9, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(53, 9, 1, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(54, 9, 10, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(55, 9, 9, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(56, 10, 1, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(57, 10, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(58, 10, 3, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(59, 10, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(60, 10, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(61, 11, 1, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(62, 11, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(63, 11, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(64, 11, 4, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(65, 11, 5, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(66, 11, 6, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(67, 11, 7, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(68, 11, 8, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(69, 11, 9, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(70, 11, 10, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(71, 12, 1, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(72, 12, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(73, 12, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(74, 12, 4, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(75, 12, 5, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(76, 12, 6, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(77, 12, 7, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(78, 13, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(79, 13, 2, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(80, 13, 3, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(81, 13, 4, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(82, 13, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(83, 13, 6, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(84, 13, 7, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(85, 14, 1, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(86, 14, 2, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(87, 14, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(88, 14, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(89, 15, 1, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(90, 15, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(91, 15, 3, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(92, 15, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(93, 15, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(94, 15, 6, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(95, 15, 7, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(96, 16, 8, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(97, 16, 9, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(98, 16, 10, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(99, 16, 1, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(100, 16, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(101, 16, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(102, 16, 3, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(103, 17, 10, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(104, 17, 9, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(105, 17, 8, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(106, 17, 7, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(107, 18, 6, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(108, 18, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(109, 18, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(110, 18, 3, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(111, 18, 3, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(112, 19, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(113, 19, 1, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(114, 19, 10, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(115, 19, 9, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(116, 20, 1, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(117, 20, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(118, 20, 3, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(119, 20, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(120, 20, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(121, 21, 1, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(122, 21, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(123, 21, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(124, 21, 4, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(125, 21, 5, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(126, 21, 6, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(127, 21, 7, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(128, 21, 8, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(129, 21, 9, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(130, 21, 10, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(131, 22, 1, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(132, 22, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(133, 22, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(134, 22, 4, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(135, 22, 5, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(136, 22, 6, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(137, 22, 7, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(138, 23, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(139, 23, 2, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(140, 23, 3, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(141, 23, 4, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(142, 23, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(143, 23, 6, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(144, 23, 7, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(145, 24, 1, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(146, 24, 2, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(147, 24, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(148, 24, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(149, 25, 1, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(150, 25, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(151, 25, 3, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(152, 25, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(153, 25, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(154, 25, 6, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(155, 25, 7, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(156, 26, 8, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(157, 26, 9, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(158, 26, 10, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(159, 26, 1, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(160, 26, 1, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(161, 26, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(162, 26, 3, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(163, 27, 10, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(164, 27, 9, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(165, 27, 8, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(166, 27, 7, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(167, 28, 6, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(168, 28, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(169, 28, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(170, 28, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(171, 28, 3, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(172, 29, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(173, 29, 1, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(174, 29, 10, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(175, 29, 9, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(176, 30, 1, 4);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(177, 30, 2, 5);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(178, 30, 3, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(179, 30, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor) VALUES(180, 30, 5, 3);


CREATE TABLE NOTAS_ALUNOS
(
    codigo_notas int not null primary key,
    codigo_matricula_curso_disciplina char(05) not null,
    faltas int not null,
    bimestre int not null,
	notaprovaparcial int not null,
    notaprova int not null    
);	


INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (1, 1, 0, 1, 7.5, 7.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (2, 2, 0, 1, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (3, 3, 1, 1, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (4, 4, 5, 1, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (5, 5, 2, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (6, 6, 6, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (7, 7, 3, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (8, 8, 1, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (9, 9, 8, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (10, 10, 9, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (11, 11, 1, 1, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (12, 12, 0, 1, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (13, 13, 0, 1, 8, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (14, 14, 1, 1, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (15, 15, 0, 1, 7, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (16, 16, 0, 1, 7, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (17, 17, 0, 1, 7, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (18, 18, 1, 1, 5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (19, 19, 5, 1, 4, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (20, 20, 2, 1, 9, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (21, 21, 6, 1, 8.5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (22, 22, 3, 1, 7.5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (23, 23, 1, 1, 4.5, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (24, 24, 8, 1, 8, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (25, 25, 9, 1, 8, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (26, 26, 1, 1, 8, 5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (27, 27, 0, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (28, 28, 0, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (29, 29, 1, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (30, 30, 0, 1, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (31, 31, 0, 1, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (32, 32, 0, 1, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (33, 33, 1, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (34, 34, 5, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (35, 35, 2, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (36, 36, 6, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (37, 37, 3, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (38, 38, 1, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (39, 39, 8, 1, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (40, 40, 9, 1, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (41, 41, 1, 1, 8.5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (42, 42, 0, 1, 7.5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (43, 43, 0, 1, 4.5, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (44, 44, 1, 1, 8, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (45, 45, 0, 1, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (46, 46, 0, 1, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (47, 47, 0, 1, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (48, 48, 1, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (49, 49, 5, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (50, 50, 2, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (51, 51, 6, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (52, 52, 3, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (53, 53, 1, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (54, 54, 8, 1, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (55, 55, 9, 1, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (56, 56, 1, 1, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (57, 57, 0, 1, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (58, 58, 0, 1, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (59, 59, 1, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (60, 60, 0, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (61, 61, 0, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (62, 62, 0, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (63, 63, 1, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (64, 64, 5, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (65, 65, 2, 1, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (66, 66, 6, 1, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (67, 67, 3, 1, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (68, 68, 1, 1, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (69, 69, 8, 1, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (70, 70, 9, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (71, 71, 1, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (72, 72, 0, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (73, 73, 0, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (74, 74, 1, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (75, 75, 0, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (76, 76, 0, 1, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (77, 77, 0, 1, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (78, 78, 1, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (79, 79, 5, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (80, 80, 2, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (81, 81, 6, 1, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (82, 82, 3, 1, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (83, 83, 1, 1, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (84, 84, 8, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (85, 85, 9, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (86, 86, 1, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (87, 87, 0, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (88, 88, 0, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (89, 89, 1, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (90, 90, 0, 1, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (91, 91, 0, 1, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (92, 92, 0, 1, 8.5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (93, 93, 1, 1, 7.5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (94, 94, 5, 1, 4.5, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (95, 95, 2, 1, 8, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (96, 96, 6, 1, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (97, 97, 3, 1, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (98, 98, 1, 1, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (99, 99, 8, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (100, 100, 9, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (101, 101, 1, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (102, 102, 0, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (103, 103, 0, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (104, 104, 1, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (105, 105, 0, 1, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (106, 106, 0, 1, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (107, 107, 0, 1, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (108, 108, 1, 1, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (109, 109, 5, 1, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (110, 110, 2, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (111, 111, 6, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (112, 112, 3, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (113, 113, 1, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (114, 114, 8, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (115, 115, 9, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (116, 116, 1, 1, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (117, 117, 0, 1, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (118, 118, 0, 1, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (119, 119, 1, 1, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (120, 120, 0, 1, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (121, 121, 0, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (122, 122, 0, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (123, 123, 1, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (124, 124, 5, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (125, 125, 2, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (126, 126, 6, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (127, 127, 3, 1, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (128, 128, 1, 1, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (129, 129, 8, 1, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (130, 130, 9, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (131, 131, 1, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (132, 132, 0, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (133, 133, 0, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (134, 134, 1, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (135, 135, 0, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (136, 136, 0, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (137, 137, 1, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (138, 138, 5, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (139, 139, 2, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (140, 140, 6, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (141, 141, 3, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (142, 142, 1, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (143, 143, 8, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (144, 144, 9, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (145, 145, 1, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (146, 146, 0, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (147, 147, 0, 1, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (148, 148, 1, 1, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (149, 149, 0, 1, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (150, 150, 0, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (151, 151, 0, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (152, 152, 1, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (153, 153, 5, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (154, 154, 2, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (155, 155, 6, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (156, 156, 3, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (157, 157, 1, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (158, 158, 8, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (159, 159, 9, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (160, 160, 1, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (161, 161, 0, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (162, 162, 0, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (163, 163, 1, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (164, 164, 0, 1, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (165, 165, 0, 1, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (166, 166, 0, 1, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (167, 167, 1, 1, 6, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (168, 168, 5, 1, 8, 5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (169, 169, 2, 1, 9, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (170, 170, 6, 1, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (171, 171, 3, 1, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (172, 172, 1, 1, 7.5, 8.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (173, 173, 8, 1, 7.5, 9.2);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (174, 174, 9, 1, 7.5, 9.2);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (175, 175, 1, 1, 8, 9.2);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (176, 176, 0, 1, 8.9, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (177, 177, 0, 1, 9, 6);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (178, 178, 1, 1, 9.5, 5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (179, 179, 0, 1, 9.5, 5.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (180, 180, 1, 1, 9.5, 6);
