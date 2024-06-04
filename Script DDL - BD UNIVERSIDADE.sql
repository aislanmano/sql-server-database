CREATE DATABASE DB_UNIVERSIDADE
GO

USE DB_UNIVERSIDADE
GO

CREATE TABLE ALUNOS
(
    codigo_aluno int not null primary key,
    nome varchar(60) not null,
    data_nascimento date not null,
    sexo char(1) not null,
	email varchar(50) null
);

INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (1, 'Maria José da Silva', '1980-05-01', 'F','Mariajo01@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (2, 'André Carlos Ferreira', '1982-10-16', 'M','Andrepereira@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (3, 'Alice das Maravilhas', '1984-06-22', 'M','Alice@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (4, 'Carlos Vieira Santos', '1981-02-10', 'M','Carlosv@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (5, 'Mara Caroline Costa', '1983-12-21', 'F','');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (6, 'Antenor da Cruz', '1981-11-15', 'M','Antenor @gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (7, 'Luzia Guimarães Souza', '1982-03-03', 'F','');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (8, 'Carla Beatriz Carreira', '1984-08-14', 'F','Carlabe32@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (9, 'Juliano Silva Costa', '1981-02-10', 'M','Juliano silva@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (10, 'Mileide Santa', '1983-12-21', 'F','Mileide10@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (11, 'Matheus da Cruz Silva Santo', '1981-11-15', 'M','Matheuscrsu@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (12, 'Rafaela Dias Santos', '1982-03-03', 'F','Rafaela12@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (13, 'Katia Arruda Ciqueira', '1984-08-14', 'F','');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (14, 'Marcos Ferreira Mendes', '1981-02-10', 'M','Marcosf10@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (15, 'Marta Silva', '1983-12-21', 'F','Martasi90@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (16, 'Jamez Rodrigues', '1981-11-15', 'M','Jamezro@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (17, 'Luciana Neta Silva', '1982-03-03', 'F','Luciana51@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (18, 'Manoela Santa', '1984-05-06', 'F','Manoelasilva@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (19, 'Beatriz Correia', '1990-08-14', 'F','Beatriz20@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (20, 'Daniela Medeiros', '1983-08-14', 'F','Danielapereira@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (21, 'Fernanda Santana', '1900-06-08', 'F','');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (22, 'Francisca Silva Cruz', '1998-08-02', 'F','Francisca@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (23, 'Vinicius Ferrari', '1998-07-01', 'M','Vinicius@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (24, 'Zenaide Ceus', '1900-08-05', 'F','Zenaide10@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (25, 'Tiago Manoel Silva', '1980-05-05', 'M','Tiagomacedo@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (26, 'Pietra Cardoso', '1984-01-01', 'F','');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (27, 'Arismar Souza', '1982-03-05', 'M','Arismar10@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (28, 'Jackson Antunes', '1991-01-01', 'M','Jacksonantunes@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (29, 'Everson Vieira Neto', '1982-03-09', 'M','Eversonvieira@gmail.com');
INSERT INTO ALUNOS (codigo_aluno, nome, data_nascimento, sexo, email) VALUES (30, 'Tina Tuner Mineira', '1980-03-30', 'F','tinatuner@gmail.com');
	
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
	codigo_professor int not null,
	codigo_curso int not null
);

INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(1, 1, 1, 1, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(2, 1, 2, 2, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(3, 1, 3, 3, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(4, 1, 4, 4, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(5, 1, 5, 5, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(6, 1, 6, 1, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(7, 1, 7, 2, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(8, 1, 8, 3, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(9, 1, 9, 4, 1);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(10, 1, 10, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(11, 2, 1, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(12, 2, 2, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(13, 2, 3, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(14, 2, 4, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(15, 2, 5, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(16, 2, 6, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(17, 2, 7, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(18, 3, 1, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(19, 3, 2, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(20, 3, 3, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(21, 3, 4, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(22, 3, 5, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(23, 3, 6, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(24, 3, 7, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(25, 4, 1, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(26, 4, 2, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(27, 4, 3, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(28, 4, 4, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(29, 5, 1, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(30, 5, 2, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(31, 5, 3, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(32, 5, 4, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(33, 5, 5, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(34, 5, 6, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(35, 5, 7, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(36, 6, 8, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(37, 6, 9, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(38, 6, 10, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(39, 6, 1, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(40, 6, 1, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(41, 6, 2, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(42, 7, 3, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(43, 7, 10, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(44, 7, 9, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(45, 7, 8, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(46, 7, 7, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(47, 8, 6, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(48, 8, 5, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(49, 8, 4, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(50, 8, 4, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(51, 8, 3, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(52, 9, 2, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(53, 9, 1, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(54, 9, 10, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(55, 9, 9, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(56, 10, 1, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(57, 10, 2, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(58, 10, 3, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(59, 10, 4, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(60, 10, 5, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(61, 11, 1, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(62, 11, 2, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(63, 11, 3, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(64, 11, 4, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(65, 11, 5, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(66, 11, 6, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(67, 11, 7, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(68, 11, 8, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(69, 11, 9, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(70, 11, 10, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(71, 12, 1, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(72, 12, 2, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(73, 12, 3, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(74, 12, 4, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(75, 12, 5, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(76, 12, 6, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(77, 12, 7, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(78, 13, 1, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(79, 13, 2, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(80, 13, 3, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(81, 13, 4, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(82, 13, 5, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(83, 13, 6, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(84, 13, 7, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(85, 14, 1, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(86, 14, 2, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(87, 14, 3, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(88, 14, 4, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(89, 15, 1, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(90, 15, 2, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(91, 15, 3, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(92, 15, 4, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(93, 15, 5, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(94, 15, 6, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(95, 15, 7, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(96, 16, 8, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(97, 16, 9, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(98, 16, 10, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(99, 16, 1, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(100, 16, 2, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(101, 16, 2, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(102, 16, 3, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(103, 17, 10, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(104, 17, 9, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(105, 17, 8, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(106, 17, 7, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(107, 18, 6, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(108, 18, 5, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(109, 18, 4, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(110, 18, 3, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(111, 18, 3, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(112, 19, 2, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(113, 19, 1, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(114, 19, 10, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(115, 19, 9, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(116, 20, 1, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(117, 20, 2, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(118, 20, 3, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(119, 20, 4, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(120, 20, 5, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(121, 21, 1, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(122, 21, 2, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(123, 21, 3, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(124, 21, 4, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(125, 21, 5, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(126, 21, 6, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(127, 21, 7, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(128, 21, 8, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(129, 21, 9, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(130, 21, 10, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(131, 22, 1, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(132, 22, 2, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(133, 22, 3, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(134, 22, 4, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(135, 22, 5, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(136, 22, 6, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(137, 22, 7, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(138, 23, 1, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(139, 23, 2, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(140, 23, 3, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(141, 23, 4, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(142, 23, 5, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(143, 23, 6, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(144, 23, 7, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(145, 24, 1, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(146, 24, 2, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(147, 24, 3, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(148, 24, 4, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(149, 25, 1, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(150, 25, 2, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(151, 25, 3, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(152, 25, 4, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(153, 25, 5, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(154, 25, 6, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(155, 25, 7, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(156, 26, 8, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(157, 26, 9, 2, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(158, 26, 10, 3, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(159, 26, 1, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(160, 26, 1, 4, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(161, 26, 2, 5, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(162, 26, 3, 1, 3);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(163, 27, 10, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(164, 27, 9, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(165, 27, 8, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(166, 27, 7, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(167, 28, 6, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(168, 28, 5, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(169, 28, 4, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(170, 28, 4, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(171, 28, 3, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(172, 29, 2, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(173, 29, 1, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(174, 29, 10, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(175, 29, 9, 3, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(176, 30, 1, 4, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(177, 30, 2, 5, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(178, 30, 3, 1, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(179, 30, 4, 2, 2);
INSERT INTO MATRICULA (codigo_matricula_curso_disciplina, codigo_aluno, codigo_disciplina, codigo_professor, codigo_curso) VALUES(180, 30, 5, 3, 2);


CREATE TABLE NOTAS_ALUNOS
(
    codigo_notas int not null primary key,
    codigo_matricula_curso_disciplina int not null,
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

INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (181, 1, 0, 2, 7.5, 7.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (182, 2, 0, 2, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (183, 3, 1, 2, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (184, 4, 5, 2, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (185, 5, 2, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (186, 6, 6, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (187, 7, 3, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (188, 8, 1, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (189, 9, 8, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (190, 10, 9, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (191, 11, 1, 2, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (192, 12, 0, 2, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (193, 13, 0, 2, 8, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (194, 14, 1, 2, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (195, 15, 0, 2, 7, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (196, 16, 0, 2, 7, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (197, 17, 0, 2, 7, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (198, 18, 1, 2, 5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (199, 19, 5, 2, 4, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (200, 20, 2, 2, 9, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (201, 21, 6, 2, 8.5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (202, 22, 3, 2, 7.5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (203, 23, 1, 2, 4.5, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (204, 24, 8, 2, 8, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (205, 25, 9, 2, 8, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (206, 26, 1, 2, 8, 5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (207, 27, 0, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (208, 28, 0, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (209, 29, 1, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (210, 30, 0, 2, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (211, 31, 0, 2, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (212, 32, 0, 2, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (213, 33, 1, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (214, 34, 5, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (215, 35, 2, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (216, 36, 6, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (217, 37, 3, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (218, 38, 1, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (219, 39, 8, 2, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (220, 40, 9, 2, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (221, 41, 1, 2, 8.5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (222, 42, 0, 2, 7.5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (223, 43, 0, 2, 4.5, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (224, 44, 1, 2, 8, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (225, 45, 0, 2, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (226, 46, 0, 2, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (227, 47, 0, 2, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (228, 48, 1, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (229, 49, 5, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (230, 50, 2, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (231, 51, 6, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (232, 52, 3, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (233, 53, 1, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (234, 54, 8, 2, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (235, 55, 9, 2, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (236, 56, 1, 2, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (237, 57, 0, 2, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (238, 58, 0, 2, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (239, 59, 1, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (240, 60, 0, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (241, 61, 0, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (242, 62, 0, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (243, 63, 1, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (244, 64, 5, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (245, 65, 2, 2, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (246, 66, 6, 2, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (247, 67, 3, 2, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (248, 68, 1, 2, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (249, 69, 8, 2, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (250, 70, 9, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (251, 71, 1, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (252, 72, 0, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (253, 73, 0, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (254, 74, 1, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (255, 75, 0, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (256, 76, 0, 2, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (257, 77, 0, 2, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (258, 78, 1, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (259, 79, 5, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (260, 80, 2, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (261, 81, 6, 2, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (262, 82, 3, 2, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (263, 83, 1, 2, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (264, 84, 8, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (265, 85, 9, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (266, 86, 1, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (267, 87, 0, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (268, 88, 0, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (269, 89, 1, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (270, 90, 0, 2, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (271, 91, 0, 2, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (272, 92, 0, 2, 8.5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (273, 93, 1, 2, 7.5, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (274, 94, 5, 2, 4.5, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (275, 95, 2, 2, 8, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (276, 96, 6, 2, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (277, 97, 3, 2, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (278, 98, 1, 2, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (279, 99, 8, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (280, 100, 9, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (281, 101, 1, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (282, 102, 0, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (283, 103, 0, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (284, 104, 1, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (285, 105, 0, 2, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (286, 106, 0, 2, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (287, 107, 0, 2, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (288, 108, 1, 2, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (289, 109, 5, 2, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (290, 110, 2, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (291, 111, 6, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (292, 112, 3, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (293, 113, 1, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (294, 114, 8, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (295, 115, 9, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (296, 116, 1, 2, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (297, 117, 0, 2, 8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (298, 118, 0, 2, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (299, 119, 1, 2, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (300, 120, 0, 2, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (301, 121, 0, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (302, 122, 0, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (303, 123, 1, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (304, 124, 5, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (305, 125, 2, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (306, 126, 6, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (307, 127, 3, 2, 9, 5.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (308, 128, 1, 2, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (309, 129, 8, 2, 5, 7.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (310, 130, 9, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (311, 131, 1, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (312, 132, 0, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (313, 133, 0, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (314, 134, 1, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (315, 135, 0, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (316, 136, 0, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (317, 137, 1, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (318, 138, 5, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (319, 139, 2, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (320, 140, 6, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (321, 141, 3, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (322, 142, 1, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (323, 143, 8, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (324, 144, 9, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (325, 145, 1, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (326, 146, 0, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (327, 147, 0, 2, 8, 8.8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (328, 148, 1, 2, 9.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (329, 149, 0, 2, 7.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (330, 150, 0, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (331, 151, 0, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (332, 152, 1, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (333, 153, 5, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (334, 154, 2, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (335, 155, 6, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (336, 156, 3, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (337, 157, 1, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (338, 158, 8, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (339, 159, 9, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (340, 160, 1, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (341, 161, 0, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (342, 162, 0, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (343, 163, 1, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (344, 164, 0, 2, 5.8, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (345, 165, 0, 2, 9, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (346, 166, 0, 2, 7.5, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (347, 167, 1, 2, 6, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (348, 168, 5, 2, 8, 5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (349, 169, 2, 2, 9, 8);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (350, 170, 6, 2, 10, 9);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (351, 171, 3, 2, 8.8, 10);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (352, 172, 1, 2, 7.5, 8.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (353, 173, 8, 2, 7.5, 9.2);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (354, 174, 9, 2, 7.5, 9.2);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (355, 175, 1, 2, 8, 9.2);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (356, 176, 0, 2, 8.9, 7);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (357, 177, 0, 2, 9, 6);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (358, 178, 1, 2, 9.5, 5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (359, 179, 0, 2, 9.5, 5.5);
INSERT INTO NOTAS_ALUNOS (codigo_notas, codigo_matricula_curso_disciplina, faltas, bimestre, notaprovaparcial, notaprova) VALUES (360, 180, 1, 2, 9.5, 6);

