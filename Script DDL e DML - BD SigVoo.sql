IF DB_ID('SIGVOO') IS NULL
    CREATE DATABASE SIGVOO 
GO

USE SIGVOO 
GO

CREATE TABLE Pessoa ( PessoaID INTEGER NOT NULL,
CPF VARCHAR(11) NOT NULL UNIQUE, 
Nome VARCHAR(30) NOT NULL, 
Sexo CHAR(1) CHECK (Sexo IN('M', 'F')), 
CONSTRAINT PK_Pessoa PRIMARY KEY (PessoaID)); 

CREATE TABLE Piloto ( PilotoID INTEGER NOT NULL,
Licenca VARCHAR(5) NOT NULL UNIQUE, 
PessoaID Integer NOT NULL,
CONSTRAINT PK_Piloto PRIMARY KEY (PilotoID), 
CONSTRAINT FK_PilotoPessoa FOREIGN KEY (PessoaID) REFERENCES Pessoa (PessoaID)); 

CREATE TABLE Passageiro ( PassageiroID INTEGER NOT NULL,
Categoria VARCHAR(10), 
PessoaID Integer NOT NULL,
CONSTRAINT PK_PassageiroID PRIMARY KEY (PassageiroID), 
CONSTRAINT FK_PassageiroPessoa FOREIGN KEY (PessoaID) REFERENCES Pessoa (PessoaID));

Create Table Telefone ( 
TelefoneID INTEGER NOT NULL,
Numero VARCHAR(10) NOT NULL, 
PassageiroID INTEGER NOT NULL,
CONSTRAINT PK_Telefone PRIMARY KEY (TelefoneID),
CONSTRAINT FK_TelefonePassageiroID FOREIGN KEY (PassageiroID) REFERENCES Passageiro (PassageiroID)); 

CREATE TABLE Voo (VooID INTEGER NOT NULL,
Numero Integer NOT NULL, 
Data_Voo Date NOT NULL, 
Hora_Voo Time NOT NULL,
CONSTRAINT PK_VooID PRIMARY KEY (VooID));
 
CREATE TABLE Reserva (ReservaID INTEGER NOT NULL, 
VooID Integer NOT NULL, 
PassageiroID Integer NOT NULL,
CONSTRAINT PK_ReservaID PRIMARY KEY (ReservaID), 
CONSTRAINT FK_ReservaPassageiro FOREIGN KEY (PassageiroID) REFERENCES Passageiro(PassageiroID), 
CONSTRAINT FK_ReservaVooID FOREIGN KEY (VooID) REFERENCES Voo(VooID));

ALTER TABLE Voo ADD PilotoID INTEGER NOT NULL;
 
ALTER TABLE Voo ADD CONSTRAINT FK_VooPiloto FOREIGN KEY (PilotoID) REFERENCES Piloto (PilotoID);


Insert Into Pessoa (PessoaID, CPF, Nome, Sexo) 
	Values (1, '111', 'Ana', 'F' ); 
Insert Into Pessoa (PessoaID, CPF, Nome, Sexo) 
	Values (2, '222', 'Beto', 'M' ); 
Insert Into Pessoa (PessoaID, CPF, Nome, Sexo) 
	Values (3, '333', 'Caio', 'M' ); 
Insert Into Pessoa (PessoaID, CPF, Nome, Sexo) 
	Values (4, '444', 'Igor', 'M' ); 
Insert Into Pessoa (PessoaID, CPF, Nome, Sexo) 
	Values (5, '555', 'Edu', 'M' ); 



Insert Into Piloto (PilotoID, Licenca, PessoaID) 
	Values(1, 'LC01' , 2); 
Insert Into Piloto (PilotoID, Licenca, PessoaID) 
	Values(2, 'LC02' , 5); 


Insert Into Passageiro (PassageiroID, Categoria, PessoaID) 
	Values(1, 'Ouro' , 3); 
Insert Into Passageiro (PassageiroID, Categoria, PessoaID) 
	Values(2, 'Normal' , 4); 


Insert Into Telefone (TelefoneID, Numero, PassageiroID) 
	Values(1, 999555, 1 ); 
Insert Into Telefone (TelefoneID, Numero, PassageiroID) 
	Values(2, 222444, 2 ); 
Insert Into Telefone (TelefoneID, Numero, PassageiroID) 
	Values(3, 888555, 1 ); 


Insert Into Voo (VooID, Numero, Data_Voo, Hora_Voo, PilotoID) 
	Values (1, 101, '2010-10-10', '19:50:00', 1 ); 
Insert Into Voo (VooID, Numero, Data_Voo, Hora_Voo, PilotoID) 
	Values (2, 202, '2011-11-11', '18:00:00', 2 ); 
Insert Into Voo (VooID, Numero, Data_Voo, Hora_Voo, PilotoID) 
	Values (3, 303, '2012-12-12', '06:50:00', 2 ); 
Insert Into Voo (VooID, Numero, Data_Voo, Hora_Voo, PilotoID)
	Values (4, 404, '2013-01-13', '08:00:00', 2 );


Insert Into Reserva (ReservaID, PassageiroID, VooID) 
	Values (1, 1, 1 ); 
Insert Into Reserva (ReservaID, PassageiroID, VooID) 
	Values (2, 1, 1 ); 
Insert Into Reserva (ReservaID, PassageiroID, VooID) 
	Values (3, 2, 2 ); 
Insert Into Reserva (ReservaID, PassageiroID, VooID) 
	Values (4, 1, 4);









