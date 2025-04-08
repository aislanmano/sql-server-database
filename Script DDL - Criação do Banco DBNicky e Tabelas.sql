--CREATE DATABASE [DBNicky];

USE [DBNicky];

CREATE TABLE [dbo].[DimCategoria](
	[IDCategoria] [int] NOT NULL,
	[Nome da Categoria] [nvarchar](255) NULL,
	[Descrição] [nvarchar](255) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY ([IDCategoria])
);

CREATE TABLE [dbo].[DimCliente](
	[IDCliente] [int] NOT NULL,
	[Nome da Empresa] [nvarchar](255) NULL,
	[Contato] [nvarchar](255) NULL,
	[Endereço] [nvarchar](255) NULL,
	[Cidade] [nvarchar](255) NULL,
	[CEP] [nvarchar](255) NULL,
	[Pais] [nvarchar](255) NULL,
	[Telefone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	 CONSTRAINT [PK_Cliente] PRIMARY KEY ([IDCliente])
);

CREATE TABLE [dbo].[DimEmpregado](
	[EmpID] [int] NOT NULL,
	[Sobrenome] [varchar](100) NULL,
	[Nome] [varchar](100) NULL,
	[Titulo] [varchar](100) NULL,
	[DataIni] [date] NULL,
	[Depto] [int] NULL,
	[Gerente] [int] NULL,
	[SalarioAno] [numeric](18, 4) NULL,
 CONSTRAINT [PK_Empregado] PRIMARY KEY ([EmpID])
);

CREATE TABLE [dbo].[DimFilial](
	[IDFilial] [int] NOT NULL,
	[Nome] [varchar](50) NULL,
	[Cidade] [varchar](50) NULL,
	[UF] [char](2) NULL,
 CONSTRAINT [PK_Filial] PRIMARY KEY ([IDFilial])
);

CREATE TABLE [dbo].[DimFornecedor](
	[IDFornecedor] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
 CONSTRAINT [PK_DimFornecedor] PRIMARY KEY  ([IDFornecedor])
);

CREATE TABLE [dbo].[DimProduto](
	[IDProduto] [int] NOT NULL,
	[Nome do Produto] [varchar](100) NULL,
	[IDFornecedor] [int] NULL,
	[IDCategoria] [int] NULL,
	[Quantidade da Embalagem] [int] NULL,
	[Preço Unitário] [numeric](18, 4) NULL,
	[Unidades em Estoque] [int] NULL,
	[Unidades no Venda] [int] NULL,
 CONSTRAINT [PK_Produto] PRIMARY KEY ([IDProduto])
);

CREATE TABLE [dbo].[DimTransportadora](
	[IDTransportadora] [int] NOT NULL,
	[Nome da Empresa] [varchar](50) NULL,
 CONSTRAINT [PK_Transportadora] PRIMARY KEY  ([IDTransportadora])
);

CREATE TABLE [dbo].[FactDevolucao](
	[IDDevolucao] [int] NOT NULL,
	[IDVenda] [int] NULL,
	[IDCliente] [int] NULL,
	[IDEmpregado] [int] NULL,
	[Data] [date] NULL,
	[IDTransportadora] [int] NULL,
	[ValorDevolucao] [numeric](18, 4) NULL,
	[IDFilial] [int] NULL,
 CONSTRAINT [PK_Devolucao] PRIMARY KEY ([IDDevolucao])
);

CREATE TABLE [dbo].[FactVendas](
	[IDVenda] [int] NOT NULL,
	[IDFilial] [int] NULL,
	[IDClientes] [int] NULL,
	[IDEmpregado] [int] NULL,
	[Data] [date] NULL,
	[IDTransportadora] [int] NULL,
	[Frete] [numeric](18, 4) NULL,
	[Status] [char](1) NULL,
 CONSTRAINT [PK_Venda] PRIMARY KEY ([IDVenda])
);

CREATE TABLE [dbo].[FactVendasItens](
	[IDVendaItem] [int] IDENTITY(1,1) NOT NULL,
	[IDVenda] [int] NOT NULL,
	[IDProduto] [int] NOT NULL,
	[Preço Unitário] [numeric](18, 4) NULL,
	[Quantidade] [int] NULL,
	[Desconto] [numeric](18, 4) NULL,
 CONSTRAINT [PK_Venda_Itens] PRIMARY KEY ([IDVendaItem])
);

CREATE TABLE [dbo].[FactProjecao](
	[IDFilial] [int] NOT NULL,
	[Data] [date] NOT NULL,
	[Valor] [numeric](18, 4) NULL,
 CONSTRAINT [PK_FactProjecao] PRIMARY KEY  ([IDFilial],	[Data])
);

INSERT [dbo].[DimCategoria] ([IDCategoria], [Nome da Categoria], [Descrição]) VALUES (1, 'Roupa Masculina', 'Moda Homem')

INSERT [dbo].[DimCategoria] ([IDCategoria], [Nome da Categoria], [Descrição]) VALUES (2, 'Roupa Feminina', 'Moda Mulher')

INSERT [dbo].[DimCategoria] ([IDCategoria], [Nome da Categoria], [Descrição]) VALUES (3, 'Roupa Esporte', 'Esporte')

INSERT [dbo].[DimCategoria] ([IDCategoria], [Nome da Categoria], [Descrição]) VALUES (4, 'Roupa de Banho', 'Moda Banho')

INSERT [dbo].[DimCategoria] ([IDCategoria], [Nome da Categoria], [Descrição]) VALUES (5, 'Calçado Feminino', 'Calçado')

INSERT [dbo].[DimCategoria] ([IDCategoria], [Nome da Categoria], [Descrição]) VALUES (6, 'Calçado Masculino', 'Calçado')

INSERT [dbo].[DimCategoria] ([IDCategoria], [Nome da Categoria], [Descrição]) VALUES (7, 'Roupa de Criança', '3-15 Anos')

INSERT [dbo].[DimCategoria] ([IDCategoria], [Nome da Categoria], [Descrição]) VALUES (8, 'Roupa Bebe', '0-3 Anos')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (1, 'Eintrach GS', 'Albert von Einstei', 'Obere Str. 57', 'Berli', '12209', 'Germany', '030-0074321', '030-0076545')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (2, 'La Tienda de la Esquina', 'Paco el Maco', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (3, 'La Ropa Vieja', 'Sancho Panza', 'C/ Ritual de lo Habitual  2312', 'México D.F.', '05023', 'Mexico', '(5) 555-3932', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (4, 'Dr Jims Trousers', 'Carl Montmery', '120 Hanover Sq.', 'Londo', 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6750')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (5, 'Urras Shop', 'Urra Gurra Aktersnurra', 'Berguvsvägen  8', 'Luleå', 'S-958 22', 'Swede', '0921-12 34 65', '0921-12 34 67')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (6, 'Man Kleider', 'Herman Hinschler', 'Forsterstr. 57', 'Mannheim', '68306', 'Germany', '0621-08460', '0621-08924')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (7, 'Menàge à Trois', 'Julie Binoché', '24, place Kléber', 'Strasbourg', '67000', 'France', '88.60.15.31', '88.60.15.32')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (8, 'Las Corbatas', 'Julio Iglesias', 'C/ de Don Quijote, 67', 'Madrid', '28023', 'Spai', '(91) 555 22 82', '(91) 555 91 99')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (9, 'La Legion Mercenaire', 'Bernard de Gaule', '12, rue des Bouchers', 'Marseille', '13008', 'France', '91.24.45.40', '91.24.45.41')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (10, 'Big Foot Shoes', 'James Hendersso', '23 Tsawassen Blvd.', 'Tsawasse', 'T2F 8M4', 'Canada', '(604) 555-4729', '(604) 555-3745')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (11, 'Shoe Expert', 'David Foot', 'Fauntleroy Circus', 'Londo', 'EC2 5NT', 'UK', '(171) 555-1212', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (12, 'Los Pantalones Magicos', 'Victoria Abril', 'Plaza de Mayo 6', 'Buenos Aires', '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (13, 'Los Sombreros Gigantes', 'Speedy nzales', 'El Barrio Chino 12', 'México D.F.', '05021', 'Mexico', '(5) 555-3392', '(5) 555-7293')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (14, 'Das Alpen Shoe', 'Alfred Neuman', 'Hauptstr. 29', 'Ber', '3012', 'Switzerland', '0452-076545', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (15, 'Tendha do Flame', 'Edson Arantes do Nascimento', 'Av. dos Lusíadas, 23', 'São Paulo', '05432-043', 'Brazil', '(11) 555-7647', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (16, 'The sharped dressed ma', 'Ian Wright', 'Berkeley Gardens
12  Brewery', 'Londo', 'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (17, 'Gluderstedt', 'Lars von Holstei', 'Walserweg 21', 'Aache', '52066', 'Germany', '0241-039123', '0241-059428')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (18, 'Aujourd´hui', 'Pierre Chardi', '67, rue des Cinquante Otages', 'Nantes', '44000', 'France', '40.67.88.88', '40.67.89.89')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (19, 'Th Fashing', 'Greg Thatcher', '35 King George', 'Londo', 'WX1 6LT', 'UK', '(171) 555-0297', '(171) 555-3373')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (20, 'Ski Store', 'Lars Saalbach', 'Kirchgasse 6', 'Graz', '8010', 'Austria', '7675-3425', '7675-3426')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (21, 'Cloe do Pau', 'Romario do Sauza', 'Rua Orós, 92', 'São Paulo', '05442-030', 'Brazil', '(11) 555-9857', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (22, 'La Camisas Cansadas', 'Filemó', 'C/ Moralzarzal, 86', 'Madrid', '28023', 'Spai', '(91) 555 94 44', '(91) 555 55 93')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (23, 'Champes', 'Jaques Wilneuve', '184, chaussée de Tournai', 'Lille', '59000', 'France', '20.16.10.16', '20.16.10.17')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (24, 'Sport & Fritid AB', 'Linda Haglund', 'Åkergatan 24', 'Bräcke', 'S-844 67', 'Swede', '0695-34 67 21', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (25, 'Halle Köl', 'Dieter Köl', 'Berliner Platz 43', 'Münche', '80805', 'Germany', '089-0877310', '089-0877451')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (26, 'Le Sais de Rió', 'Jeanne d´Anjou', '54, rue Royale', 'Nantes', '44000', 'France', '40.32.21.21', '40.32.21.20')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (27, 'Il Pantaloni di la Cammorra', 'Don Corleone', 'Via Monte Bianco 34', 'Torino', '10100', 'Italy', '011-4988260', '011-4988261')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (28, 'El Traige do Benfica', 'Vitor Baiha', 'Jardim das rosas n. 32', 'Lisboa', '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (29, 'El Chandal del Barca', 'Jusep del pep', 'Rambla de Cataluña, 23', 'Barcelona', '08022', 'Spai', '(93) 203 4560', '(93) 203 4561')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (30, 'Los Trajes de Matador', 'El Cordobes', 'Finca La Campana, 33', 'Sevilla', '41101', 'Spai', '(95) 555 82 82', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (31, 'Paintho da Gama', 'Anna Fi', 'Av. Brasil, 442', 'Campinas', '04876-786', 'Brazil', '(11) 555-9482', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (32, 'The Corner Store', 'Ross The Boss', '2732 Baker Blvd.', 'Eugene', '97403', 'USA', '(503) 555-7555', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (33, 'El Abri Mortal', 'Antonio Palmer Amer', '5ª Ave. Los Palos Grandes', 'Caracas', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (34, 'El Carnevale', 'Joe do Pintho', 'Rua do Paço, 67', 'Rio de Janeiro', '05454-876', 'Brazil', '(21) 555-0091', '(21) 555-8765')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (35, 'El Zapato Rojo', 'Nicolas Balines', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (36, 'Pulp Toxedos', 'Marcellus Wallace', 'City Center Plaza
516 Main St.', 'Elgi', '97827', 'USA', '(503) 555-6874', '(503) 555-2376')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (37, 'Boleros', 'Robert Bolero', '8 Johnstown Road', 'Cork', '125 80', 'Ireland', '2967 542', '2967 3333')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (38, 'King Size Clothes', 'Al Yankovic', 'Garden House
Crowther Way', 'Cowes', 'PO31 7PJ', 'UK', '(198) 555-8888', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (39, 'Noch Einmal GMBH', 'Dieter Rummernige', 'Maubelstr. 90', 'Brandenburg', '14776', 'Germany', '0555-09876', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (40, 'La Boheme', 'Philippe de Laval', '67, avenue de l''Europe', 'Versailles', '78000', 'France', '30.59.84.10', '30.59.85.11')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (41, 'Elle Fashion & Desig', 'Louise Davu', '1 rue Alsace-Lorraine', 'Toulouse', '31000', 'France', '61.77.61.10', '61.77.61.11')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (42, 'Millenium', 'Joe Barry', '1900 Oak St.', 'Vancouver', 'V3F 2K1', 'Canada', '(604) 555-3392', '(604) 555-7293')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (43, 'For The Dark Night', 'Klaus Tarantino', '12 Orchestra Terrace', 'Walla Walla', '99362', 'USA', '(509) 555-7969', '(509) 555-6221')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (44, 'Warp AG', 'Klaus Deum', 'Magazinweg 7', 'Frankfurt a.M.', '60528', 'Germany', '069-0245984', '069-0245874')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (45, 'Bobby Socks', 'Vincent Vega', '87 Polk St.
Suite 5', 'San Francisco', '94117', 'USA', '(415) 555-5938', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (46, 'Los Vatos Locos', 'Tony Montana', 'Carrera 52 con Ave. Bolívar #65-98 Llano Lar', 'Barquisimeto', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (47, 'El Pirata', 'Andrés Barbanegra', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (48, 'Too Hot 4U', 'Andrea Pamelsso', '89 Chiaroscuro Rd.', 'Portland', '97219', 'USA', '(503) 555-9573', '(503) 555-9646')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (49, 'La Moda d''il Futuri', 'Luca Brassi', 'Via Ludovico il Moro 22', 'Bergamo', '24100', 'Italy', '035-640230', '035-640231')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (50, 'De la Vita', 'Marco Van Deum', 'Rue Joseph-Bens 532', 'Bruxelles', 'B-1180', 'Belgium', '(02) 201 24 67', '(02) 201 24 68')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (51, 'Davenport Fashio', 'James Belucci', '43 rue St. Laurent', 'Montréal', 'H1J 1C3', 'Canada', '(514) 555-8054', '(514) 555-8055')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (52, 'Kohl Industries AG', 'Helmuth Klei', 'Heerstr. 22', 'Leipzig', '04179', 'Germany', '0342-023176', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (53, 'Fawtly Towers', 'John Cleez', 'South House
300 Queensbridge', 'Londo', 'SW7 1RZ', 'UK', '(171) 555-7733', '(171) 555-2530')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (54, 'Los Espandrilos Fantasticos', 'Don Gerardo', 'La Colomina la buena vista
Piso 20-A', 'Buenos Aires', '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (55, 'SSS-Sport Shoes Store', 'Al Bundy', '2743 Bering St.', 'Anchorage', '99508', 'USA', '(907) 555-7584', '(907) 555-2880')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (56, 'Casual Clothing', 'Herman Schlusse', 'Mehrheimerstr. 369', 'Köl', '50739', 'Germany', '0221-0644327', '0221-0765721')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (57, 'Jazz Style Fashion& Art', 'Dizzi Gillespi', '265, boulevard Charonne', 'Paris', '75012', 'France', '(1) 42.34.22.66', '(1) 42.34.22.77')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (58, 'La Moda Pasada', 'Francisca Font Barceló', 'Calle Dr. Jorge Cash 321', 'México D.F.', '05033', 'Mexico', '(5) 552-3745', '(5) 545-3745')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (59, 'Extrawagens', 'Herbert Bernstorf', 'Geislweg 14', 'Salzburg', '5020', 'Austria', '6562-9722', '6562-9723')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (60, 'La Roba do Santho', 'Leopoldo Samba', 'Estrada da saúde n. 58', 'Lisboa', '1756', 'Portugal', '(1) 356-5634', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (61, 'Copacabana', 'Giovanni Santhos', 'Rua da Panificadora, 12', 'Rio de Janeiro', '02389-673', 'Brazil', '(21) 555-4252', '(21) 555-4545')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (62, 'Roba di Piel', 'Jorge Alemaio', 'Alameda dos Canàrios, 891', 'São Paulo', '05487-020', 'Brazil', '(11) 555-1189', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (63, 'Grunewald', 'George Esse', 'Taucherstraße 10', 'Cunewalde', '01307', 'Germany', '0372-035188', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (64, 'Ropa total', 'Emerson Fittipaldi', 'Av. del Libertador 900', 'Buenos Aires', '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (65, 'X-Site', 'Malcolm X', '2817 Milton Dr.', 'Albuquerque', '87110', 'USA', '(505) 555-5939', '(505) 555-3620')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (66, 'Sport Shop', 'Anna Bella', 'Strada Provinciale 124', 'Reggio Emilia', '42100', 'Italy', '0522-556721', '0522-556722')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (67, 'Da Bikini Expertu', 'Thomá Lindao', 'Av. Copacabana, 267', 'Rio de Janeiro', '02389-890', 'Brazil', '(21) 555-3412', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (68, 'lden Design Group', 'Carl Perry', 'Grenzacherweg 237', 'Genève', '1203', 'Switzerland', '0897-034214', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (69, 'La Moda Alucinante', 'Emilio Ilegal', 'Gran Vía, 1', 'Madrid', '28001', 'Spai', '(91) 745 6200', '(91) 745 6210')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (70, 'Alles Lusekofter', 'Akkurat Jonny', 'Erling Skakkes gate 78', 'Staver', '4110', 'Norway', '07-98 92 35', '07-98 92 47')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (71, 'Sunny Ski Store', 'Perry Farell', '187 Suffolk Ln.', 'Boise', '83720', 'USA', '(208) 555-8097', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (72, 'Fast Sunglasses', 'Ray Banned', '90 Wadhurst Rd.', 'Londo', 'OX15 4NB', 'UK', '(171) 555-1717', '(171) 555-5646')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (73, 'Rode & Vite', 'Preben Elkjaer', 'Vinbæltet 34', 'Københav', '1734', 'Denmark', '31 12 34 56', '31 13 35 57')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (74, 'Chateau de Ville', 'André Millard', '25, rue Lauristo', 'Paris', '75016', 'France', '(1) 47.55.60.10', '(1) 47.55.60.20')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (75, 'Macalena', 'Paul Smith', 'P.O. Box 555', 'Lander', '82520', 'USA', '(307) 555-4680', '(307) 555-6525')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (76, 'Belgium Black Jeans', 'Cheril Cow', 'Boulevard Tirou, 255', 'Charleroi', 'B-6000', 'Belgium', '(071) 23 67 22 20', '(071) 23 67 22 21')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (77, 'Eye Fashio', 'Charles Oakley', '89 Jefferson Way
Suite 2', 'Portland', '97201', 'USA', '(503) 555-3612', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (78, 'TTT-The Ticky Tie', 'Mary Stone', '55 Grizzly Peak Rd.', 'Butte', '59801', 'USA', '(406) 555-5834', '(406) 555-8083')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (79, 'Boombastic', 'Heinz Disco', 'Luisenstr. 48', 'Münster', '44087', 'Germany', '0251-031259', '0251-035695')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (80, 'Don Baló', 'Peloto mez', 'Avda. Azteca 123', 'México D.F.', '05033', 'Mexico', '(5) 555-2933', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (81, 'Merced do Vaile', 'Mercedes Couto', 'Av. Inês de Castro, 414', 'São Paulo', '05442-030', 'Brazil', '(11) 555-2167', '(11) 555-2168')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (82, 'Bond Ltd', 'Mark Stark', '722 DaVinci Blvd.', 'Kirkland', '98034', 'USA', '(206) 555-8257', '(206) 555-2174')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (84, 'Art et Fashio', 'Pierre Robert', '2, rue du Commerce', 'Lyo', '69004', 'France', '78.32.54.86', '78.32.54.87')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (85, 'Pour l´homme', 'Henry Renault', '59 rue de l''Abbaye', 'Reims', '51100', 'France', '26.47.15.10', '26.47.15.11')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (86, 'Autokleider', 'Ralf Schumaker', 'Adenauerallee 900', 'Stuttgart', '70563', 'Germany', '0711-020361', '0711-035428')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (87, 'Perkii Urkii', 'Miiko Heikillä', 'Torikatu 38', 'Oulu', '90110', 'Finland', '981-443655', '981-443655')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (88, 'Da Santho Cosmethia', 'Mariah Erdi', 'Rua do Mercado, 12', 'Resende', '08737-363', 'Brazil', '(14) 555-8122', NULL)

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (89, 'Nirvana Stores', 'Alice Chai', '305 - 14th Ave. S.
Suite 3B', 'Seattle', '98128', 'USA', '(206) 555-4112', '(206) 555-4115')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (90, 'Leningrad Cowboys Shop', 'Reijoo Haajane', 'Keskuskatu 45', 'Helsinki', '21240', 'Finland', '90-224 8858', '90-224 8858')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (91, 'Slotzy Danz', 'Boniekk Wallessa', 'ul. Filtrowa 68', 'Warszawa', '01-012', 'Poland', '(26) 642-7012', '(26) 642-7012')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (94, 'Modehuset Abel', 'Dennis Olse', 'Smagsløget 45', 'Århus', '8200', 'Denmark', '86 21 32 43', '86 22 33 44')

INSERT [dbo].[DimCliente] ([IDCliente], [Nome da Empresa], [Contato], [Endereço], [Cidade], [CEP], [Pais], [Telefone], [Fax]) VALUES (127, 'Stephanies', 'Staffan Blond', 'Gatauppochner. 1', 'Stockholm', '111 11', 'Swede', '(8) 10 20 30', '(8) 11 22 33')

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (1, 'Roll', 'Rock', 'Sales Representative', CAST('1994-10-01' AS Date), 501, 4, CAST(61000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (2, 'Presley', 'Elvis', 'President', CAST('1993-09-14' AS Date), 101, NULL, CAST(80000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (3, 'Carsso', 'Rob', 'Sales Representative', CAST('1994-10-01' AS Date), 102, 4, CAST(63000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (4, 'Callins', 'Joa', 'Sales Manager', CAST('1994-09-03' AS Date), 301, 2, CAST(70000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (5, 'Hendrix', 'Ingrid', 'Sales Representative', CAST('1995-10-17' AS Date), 302, 4, CAST(61300.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (6, 'Skoglund', 'Lennart', 'Sales Representative', CAST('1994-01-17' AS Date), 401, 4, CAST(61200.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (7, 'Lindwall', 'Tom', 'Sales Representative', CAST('1995-11-22' AS Date), 201, 4, CAST(61000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (8, 'Shine', 'Leif', 'Sales Coordinator', CAST('1994-03-05' AS Date), 202, 2, CAST(65000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (9, 'Broli', 'Hele', 'Sales Representative', CAST('1995-02-15' AS Date), 103, 4, CAST(60000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (19, 'Letterma', 'David', 'Product Manager', CAST('1993-10-10' AS Date), 222, 8, CAST(55500.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (20, 'Cleaves', 'Joh', 'Product Manager', CAST('1994-10-03' AS Date), 333, 8, CAST(55000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (21, 'Takako', 'Miro', 'Product Manager', CAST('1995-02-22' AS Date), 444, 8, CAST(55000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (22, 'Protzman', 'Binh', 'Product Manager', CAST('1994-03-06' AS Date), 555, 8, CAST(56000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (23, 'Sandu', 'Cezar', 'Systems Manager', CAST('1994-02-22' AS Date), 200, 19, CAST(51000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (24, 'Crawford', 'Cindy', 'Systems Manager', CAST('1995-06-08' AS Date), 200, 19, CAST(50400.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (25, 'Bond', 'James', 'Systems Manager', CAST('1995-07-06' AS Date), 200, 19, CAST(50000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (26, 'Doe', 'Joh', 'Systems Manager', CAST('1996-08-01' AS Date), 200, 19, CAST(51600.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (27, 'Kaddafi', 'Mario', 'Systems Manager', CAST('1994-06-05' AS Date), 500, 22, CAST(51300.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (28, 'Dupont', 'Paul', 'Systems Manager', CAST('1995-02-06' AS Date), 500, 22, CAST(51200.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (29, 'Svensso', 'Sve', 'Storema', CAST('1996-01-29' AS Date), 500, 22, CAST(51000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (30, 'Baumel', 'Ira', 'Storema', CAST('1996-12-31' AS Date), 500, 22, CAST(50200.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (31, 'Helmkey', 'Keith', 'Storema', CAST('1997-03-31' AS Date), 500, 22, CAST(50200.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (32, 'Wesenlund', 'Rolf', 'Storema', CAST('1996-07-29' AS Date), 300, 20, CAST(50300.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (33, 'Lindquist', 'An', 'Storema', CAST('1996-01-11' AS Date), 300, 20, CAST(50100.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (34, 'Yang', 'Bill', 'Storema', CAST('1997-01-11' AS Date), 300, 20, CAST(50500.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (35, 'Jönsso', 'Charles Ingvar', 'Storema', CAST('1996-12-31' AS Date), 300, 20, CAST(50000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (36, 'Clouseau', 'Jacques', 'Storema', CAST('1997-08-02' AS Date), 300, 20, CAST(51000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (37, 'Tessel', 'Jerry', 'Network Manager', CAST('1995-08-02' AS Date), 400, 21, CAST(52000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (38, 'Lemo', 'Joh', 'Network Manager', CAST('1995-09-02' AS Date), 400, 21, CAST(50000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (39, 'Salvatori', 'Marcus', 'Storema', CAST('1996-01-07' AS Date), 400, 21, CAST(51000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (40, 'Simeno', 'Olivier', 'Storema', CAST('1996-12-31' AS Date), 400, 21, CAST(55000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (41, 'Gupta', 'Sunil', 'Storema', CAST('1997-01-04' AS Date), 400, 21, CAST(50000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (42, 'Ärlig', 'Öste', 'Account Manager', CAST('1994-12-24' AS Date), 104, 3, CAST(51000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (43, 'Park', 'Bob', 'Account Manager', CAST('1994-10-09' AS Date), 203, 7, CAST(50000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (44, 'Kent', 'Clark', 'Account Manager', CAST('1994-01-31' AS Date), 204, 7, CAST(55000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (45, 'Cheng', 'Joe', 'Account Manager', CAST('1995-08-02' AS Date), 303, 5, CAST(52000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (46, 'Alpa', 'Kaya', 'Account Manager', CAST('1996-01-21' AS Date), 304, 5, CAST(51000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (47, 'Tyso', 'Michelle', 'Account Manager', CAST('1995-02-01' AS Date), 402, 6, CAST(50000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (48, 'Gucci', 'Ricardo', 'Account Manager', CAST('1996-01-01' AS Date), 403, 6, CAST(47600.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (49, 'Cioazzi', 'Steve', 'Operator/Clerk', CAST('1995-01-01' AS Date), NULL, 2, CAST(47500.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (50, 'Finley', 'Kenneth', 'Operator/Clerk', CAST('1995-01-01' AS Date), NULL, 8, CAST(45600.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (51, 'Luke', 'Lucky', 'Operator/Clerk', CAST('1997-01-03' AS Date), NULL, 4, CAST(45000.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (52, 'Ashkenaz', 'Mike', 'Account Manager', CAST('1996-11-30' AS Date), NULL, 42, CAST(49500.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (53, 'Ranieri', 'Richard', 'Account Manager', CAST('1997-01-07' AS Date), NULL, 23, CAST(49500.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (54, 'Richards', 'Sabrina', 'Account Manager', CAST('1996-04-03' AS Date), NULL, 32, CAST(49500.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (55, 'Daw', 'Sehoo', 'Account Manager', CAST('1996-11-30' AS Date), NULL, 37, CAST(49500.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimEmpregado] ([EmpID], [Sobrenome], [Nome], [Titulo], [DataIni], [Depto], [Gerente], [SalarioAno]) VALUES (161, 'Lind', 'Stefa', 'Account Manager', CAST('1995-12-28' AS Date), NULL, 27, CAST(49500.0000 AS Numeric(18, 4)))

INSERT [dbo].[DimFilial] ([IDFilial], [Nome], [Cidade], [UF]) VALUES (1, 'Filial 01', 'Cuiabá', 'MT')

INSERT [dbo].[DimFilial] ([IDFilial], [Nome], [Cidade], [UF]) VALUES (2, 'Filial 02', 'São Paulo', 'SP')

INSERT [dbo].[DimFilial] ([IDFilial], [Nome], [Cidade], [UF]) VALUES (3, 'Filial 03', 'Belo Horizonte', 'MG')

INSERT [dbo].[DimFilial] ([IDFilial], [Nome], [Cidade], [UF]) VALUES (4, 'Filial 04', 'Curitiba', 'PR')

INSERT [dbo].[DimFilial] ([IDFilial], [Nome], [Cidade], [UF]) VALUES (5, 'Filial 05', 'Recife', 'PE')

SET IDENTITY_INSERT [dbo].[DimFornecedor] ON 

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (1, 'Fornecedor 1')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (2, 'Fornecedor 2')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (3, 'Fornecedor 3')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (4, 'Fornecedor 4')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (5, 'Fornecedor 5')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (6, 'Fornecedor 6')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (7, 'Fornecedor 7')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (8, 'Fornecedor 8')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (9, 'Fornecedor 9')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (10, 'Fornecedor 10')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (11, 'Fornecedor 11')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (12, 'Fornecedor 12')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (13, 'Fornecedor 13')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (14, 'Fornecedor 14')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (15, 'Fornecedor 15')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (16, 'Fornecedor 16')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (17, 'Fornecedor 17')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (18, 'Fornecedor 18')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (19, 'Fornecedor 19')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (20, 'Fornecedor 20')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (21, 'Fornecedor 21')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (22, 'Fornecedor 22')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (23, 'Fornecedor 23')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (24, 'Fornecedor 24')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (25, 'Fornecedor 25')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (26, 'Fornecedor 26')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (27, 'Fornecedor 27')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (28, 'Fornecedor 28')

INSERT [dbo].[DimFornecedor] ([IDFornecedor], [Nome]) VALUES (29, 'Fornecedor 29')

SET IDENTITY_INSERT [dbo].[DimFornecedor] OFF

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (1, 'Short Jeans', 1, 1, 10, CAST(20.0000 AS Numeric(18, 4)), 39, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (2, 'Mr X Trousers', 1, 1, 10, CAST(19.0000 AS Numeric(18, 4)), 17, 40)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (3, 'Chantell Shirt', 1, 2, 20, CAST(20.0000 AS Numeric(18, 4)), 13, 70)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (4, 'Oyaki Kimono', 2, 2, 15, CAST(22.0000 AS Numeric(18, 4)), 53, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (5, 'O-Man Underwear', 2, 1, 100, CAST(6.0000 AS Numeric(18, 4)), 0, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (6, 'Shagall Socks', 3, 2, 50, CAST(4.0000 AS Numeric(18, 4)), 120, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (7, 'Conserve Shoes', 3, 7, 40, CAST(40.0000 AS Numeric(18, 4)), 15, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (8, 'Tuxedo', 3, 2, 20, CAST(20.0000 AS Numeric(18, 4)), 6, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (9, 'Fuji Boots', 4, 6, 10, CAST(39.0000 AS Numeric(18, 4)), 29, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (10, 'Sapporoo Gloves', 4, 8, 20, CAST(7.0000 AS Numeric(18, 4)), 31, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (11, 'Desperado Jeans', 5, 1, 25, CAST(28.0000 AS Numeric(18, 4)), 22, 30)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (12, 'Tiny Winy Hot Bikini', 5, 4, 20, CAST(10.0000 AS Numeric(18, 4)), 86, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (13, 'Aino Shoes', 6, 8, 25, CAST(25.0000 AS Numeric(18, 4)), 24, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (14, 'Kool Sunglasses', 6, 7, 21, CAST(23.2500 AS Numeric(18, 4)), 35, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (15, 'Sumi Underwear', 6, 2, 30, CAST(6.5000 AS Numeric(18, 4)), 39, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (16, 'Wimbledon T-Shirt', 7, 3, 24, CAST(9.4500 AS Numeric(18, 4)), 29, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (17, 'TieBreak Tennis shoes', 7, 6, 36, CAST(25.0000 AS Numeric(18, 4)), 0, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (18, 'Deuce shirt', 7, 8, 18, CAST(25.5000 AS Numeric(18, 4)), 42, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (19, 'Squash Shorts', 8, 3, 1, CAST(9.2000 AS Numeric(18, 4)), 25, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (20, 'Tennis Suit', 8, 3, 1, CAST(81.0000 AS Numeric(18, 4)), 40, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (21, 'Basket Shoes', 8, 3, 1, CAST(10.0000 AS Numeric(18, 4)), 3, 40)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (22, 'Ravellis Träskor', 9, 5, 90, CAST(3.5000 AS Numeric(18, 4)), 104, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (23, 'DSW', 9, 5, 100, CAST(9.0000 AS Numeric(18, 4)), 61, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (24, 'Samba Socker  Socks', 10, 1, 100, CAST(4.5000 AS Numeric(18, 4)), 20, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (25, 'Basket Vest', 11, 3, 1, CAST(14.0000 AS Numeric(18, 4)), 76, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (26, 'Bike Helmet', 11, 3, 1, CAST(31.2300 AS Numeric(18, 4)), 15, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (27, 'Tracksuit', 11, 3, 1, CAST(43.9000 AS Numeric(18, 4)), 49, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (28, 'RDL Suit', 12, 7, 1, CAST(45.6000 AS Numeric(18, 4)), 26, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (29, 'Davenport', 12, 6, 1, CAST(123.7900 AS Numeric(18, 4)), 0, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (30, 'Baby Dark Lounge Suit', 13, 8, 1, CAST(25.8900 AS Numeric(18, 4)), 10, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (31, 'Rossi Bermuda Shorts', 14, 4, 20, CAST(8.5000 AS Numeric(18, 4)), 0, 70)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (32, 'Rossi Bikkini', 14, 4, 30, CAST(19.0000 AS Numeric(18, 4)), 9, 40)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (33, 'Car Boots', 15, 3, 25, CAST(25.5000 AS Numeric(18, 4)), 112, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (34, 'Baywatch Bikkini', 16, 4, 12, CAST(8.0000 AS Numeric(18, 4)), 111, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (35, 'LA. Shorts', 16, 4, 14, CAST(6.0000 AS Numeric(18, 4)), 20, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (36, 'Mehmet-Tröja', 17, 8, 20, CAST(8.0000 AS Numeric(18, 4)), 112, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (37, 'Mehmet-Skor', 17, 8, 21, CAST(4.0000 AS Numeric(18, 4)), 11, 50)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (38, 'Le Baby Dress', 18, 2, 4, CAST(80.5000 AS Numeric(18, 4)), 17, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (39, 'Terence Top', 18, 2, 3, CAST(60.0000 AS Numeric(18, 4)), 69, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (40, 'Duck Trousers', 19, 8, 1, CAST(18.4000 AS Numeric(18, 4)), 123, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (41, 'Duck Shirt', 19, 8, 1, CAST(9.6500 AS Numeric(18, 4)), 85, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (42, 'Balett Shoes', 20, 5, 1, CAST(14.0000 AS Numeric(18, 4)), 26, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (43, 'Summer Shorts', 20, 4, 1, CAST(12.0000 AS Numeric(18, 4)), 17, 10)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (44, 'Okkaba Skin Jackets', 20, 2, 7, CAST(75.4500 AS Numeric(18, 4)), 27, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (45, 'Danske Treshoe', 21, 6, 100, CAST(9.5000 AS Numeric(18, 4)), 5, 70)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (46, 'Rodbye Troje', 21, 8, 40, CAST(12.0000 AS Numeric(18, 4)), 95, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (47, 'Lundenhagen Boots', 22, 6, 14, CAST(25.5000 AS Numeric(18, 4)), 36, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (48, 'Root Boot', 22, 6, 25, CAST(32.7500 AS Numeric(18, 4)), 15, 70)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (49, 'Finnish Sport Blades', 23, 3, 1, CAST(20.0000 AS Numeric(18, 4)), 10, 60)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (50, 'Finnish Swimsuit', 23, 3, 1, CAST(16.2500 AS Numeric(18, 4)), 65, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (51, 'Snake Boots', 24, 6, 10, CAST(99.9000 AS Numeric(18, 4)), 20, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (52, 'Small Crocodile Boots', 24, 5, 14, CAST(80.0000 AS Numeric(18, 4)), 38, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (53, 'Jumpin Jack Flash Dress', 24, 2, 6, CAST(60.8000 AS Numeric(18, 4)), 0, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (54, 'Patamonia Fleece Jacket', 25, 3, 24, CAST(35.4500 AS Numeric(18, 4)), 21, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (55, 'Feiss Fleece Trousers', 25, 3, 20, CAST(39.0000 AS Numeric(18, 4)), 115, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (56, 'High Heels Shoes', 26, 5, 15, CAST(38.0000 AS Numeric(18, 4)), 21, 10)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (57, 'Burned Rubber Shoes', 26, 5, 20, CAST(19.5000 AS Numeric(18, 4)), 36, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (58, 'Ga-Ga Dress', 27, 8, 20, CAST(48.2500 AS Numeric(18, 4)), 62, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (59, 'Rasta WCT', 28, 3, 105, CAST(8.5000 AS Numeric(18, 4)), 79, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (60, 'Game Over T-Shirt', 28, 3, 53, CAST(5.0000 AS Numeric(18, 4)), 19, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (61, 'Adihash Running Shoe', 29, 3, 20, CAST(26.5000 AS Numeric(18, 4)), 113, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (62, 'Sheat Shoes', 29, 3, 30, CAST(29.3000 AS Numeric(18, 4)), 17, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (63, 'Serve-Shirt', 7, 2, 68, CAST(19.9000 AS Numeric(18, 4)), 24, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (64, 'WFS shoes', 12, 5, 1, CAST(33.2500 AS Numeric(18, 4)), 22, 80)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (65, 'Stretch oui-pants', 2, 2, 40, CAST(10.0500 AS Numeric(18, 4)), 76, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (66, 'Lanste Shirt', 2, 2, 15, CAST(19.0000 AS Numeric(18, 4)), 4, 100)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (67, 'X-Dress', 16, 2, 26, CAST(60.0000 AS Numeric(18, 4)), 52, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (68, 'Cap', 8, 3, 1, CAST(12.5000 AS Numeric(18, 4)), 6, 10)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (69, 'Racing Truck  Socks', 15, 3, 100, CAST(2.0000 AS Numeric(18, 4)), 26, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (70, 'US-Master Jeans', 7, 1, 15, CAST(29.0000 AS Numeric(18, 4)), 15, 10)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (71, 'Atles Lussekofta', 15, 1, 10, CAST(30.5000 AS Numeric(18, 4)), 26, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (72, 'Rossi Shorts', 14, 4, 30, CAST(11.8000 AS Numeric(18, 4)), 14, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (73, 'Mehmet-Napp', 17, 8, 100, CAST(1.1000 AS Numeric(18, 4)), 101, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (74, 'Nikee Running Shoes', 4, 7, 30, CAST(30.0000 AS Numeric(18, 4)), 4, 20)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (75, 'Bow tie', 12, 1, 1, CAST(7.7500 AS Numeric(18, 4)), 125, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (76, 'Minnki Pälsii', 23, 2, 2, CAST(399.0000 AS Numeric(18, 4)), 57, 0)

INSERT [dbo].[DimProduto] ([IDProduto], [Nome do Produto], [IDFornecedor], [IDCategoria], [Quantidade da Embalagem], [Preço Unitário], [Unidades em Estoque], [Unidades no Venda]) VALUES (77, 'Skirt', 12, 2, 1, CAST(13.0000 AS Numeric(18, 4)), 32, 0)

INSERT [dbo].[DimTransportadora] ([IDTransportadora], [Nome da Empresa]) VALUES (1, 'Quik Shipping')

INSERT [dbo].[DimTransportadora] ([IDTransportadora], [Nome da Empresa]) VALUES (2, 'SafeAndFast')

INSERT [dbo].[DimTransportadora] ([IDTransportadora], [Nome da Empresa]) VALUES (3, 'World Wide Transports')

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (1, 10276, 80, 1, CAST('2015-10-05' AS Date), 3, CAST(22.9500 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (2, 10338, 1, 8, CAST('2015-10-22' AS Date), 2, CAST(52.3300 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (3, 10339, 51, 1, CAST('2015-10-25' AS Date), 3, CAST(58.7600 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (4, 10344, 89, 2, CAST('2015-10-29' AS Date), 2, CAST(22.6900 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (5, 10347, 21, 2, CAST('2015-11-03' AS Date), 2, CAST(28.2900 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (6, 10466, 15, 2, CAST('2016-03-03' AS Date), 2, CAST(77.4400 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (7, 10467, 49, 6, CAST('2016-03-03' AS Date), 1, CAST(34.9500 AS Numeric(18, 4)), 4)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (8, 10440, 37, 3, CAST('2016-03-07' AS Date), 2, CAST(73.6500 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (9, 10441, 32, 1, CAST('2016-03-07' AS Date), 3, CAST(72.6900 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (10, 10469, 89, 3, CAST('2016-03-07' AS Date), 2, CAST(61.0400 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (11, 10442, 37, 3, CAST('2016-03-08' AS Date), 2, CAST(23.3300 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (12, 10470, 37, 3, CAST('2016-03-08' AS Date), 2, CAST(72.9500 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (13, 10471, 11, 2, CAST('2016-03-08' AS Date), 2, CAST(26.6600 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (14, 10443, 73, 9, CAST('2016-03-09' AS Date), 2, CAST(76.1600 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (15, 10472, 23, 6, CAST('2016-03-09' AS Date), 1, CAST(61.0000 AS Numeric(18, 4)), 4)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (16, 10544, 48, 1, CAST('2016-09-18' AS Date), 3, CAST(66.3400 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (17, 10545, 43, 1, CAST('2016-09-19' AS Date), 3, CAST(36.4100 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (18, 10316, 23, 6, CAST('2016-09-24' AS Date), 1, CAST(38.9500 AS Numeric(18, 4)), 4)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (19, 10403, 20, 4, CAST('2016-09-30' AS Date), 1, CAST(26.4300 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (20, 10558, 23, 6, CAST('2016-10-01' AS Date), 1, CAST(77.3800 AS Numeric(18, 4)), 4)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (21, 10560, 25, 8, CAST('2016-10-03' AS Date), 2, CAST(67.8800 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (22, 10447, 32, 1, CAST('2016-10-11' AS Date), 3, CAST(45.6900 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (23, 10450, 84, 5, CAST('2016-10-19' AS Date), 1, CAST(39.1500 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (24, 10517, 37, 9, CAST('2016-10-21' AS Date), 2, CAST(37.4400 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (25, 10552, 35, 3, CAST('2016-10-26' AS Date), 2, CAST(46.8500 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (26, 10668, 86, 8, CAST('2017-03-11' AS Date), 2, CAST(22.8600 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (27, 10309, 37, 3, CAST('2017-03-15' AS Date), 2, CAST(71.5800 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (28, 10612, 19, 3, CAST('2017-03-24' AS Date), 2, CAST(66.4400 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (29, 10430, 44, 7, CAST('2017-03-26' AS Date), 2, CAST(68.5300 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (30, 10399, 79, 7, CAST('2017-03-27' AS Date), 2, CAST(43.6800 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (31, 10654, 5, 3, CAST('2017-03-29' AS Date), 2, CAST(61.6400 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (32, 10406, 62, 2, CAST('2017-04-03' AS Date), 2, CAST(73.8800 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (33, 10768, 59, 5, CAST('2017-04-04' AS Date), 1, CAST(48.0500 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (34, 10304, 80, 1, CAST('2017-04-08' AS Date), 3, CAST(69.8400 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (35, 10742, 37, 3, CAST('2017-04-10' AS Date), 2, CAST(37.6500 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (36, 10705, 35, 9, CAST('2017-05-11' AS Date), 2, CAST(53.8500 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (37, 10706, 17, 8, CAST('2017-05-12' AS Date), 2, CAST(43.0800 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (38, 10779, 82, 1, CAST('2017-05-12' AS Date), 3, CAST(32.3800 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (39, 10673, 19, 9, CAST('2017-05-14' AS Date), 2, CAST(46.2900 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (40, 10675, 25, 8, CAST('2017-05-15' AS Date), 2, CAST(77.2200 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (41, 10747, 59, 5, CAST('2017-05-15' AS Date), 1, CAST(51.0600 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (42, 10359, 72, 9, CAST('2017-05-17' AS Date), 2, CAST(59.4400 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (43, 10752, 53, 2, CAST('2017-05-20' AS Date), 2, CAST(50.6500 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (44, 10681, 32, 1, CAST('2017-05-21' AS Date), 3, CAST(73.3300 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (45, 10315, 38, 9, CAST('2017-05-22' AS Date), 2, CAST(28.8800 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (46, 10256, 19, 3, CAST('2017-07-11' AS Date), 2, CAST(22.5600 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (47, 10599, 11, 9, CAST('2017-07-11' AS Date), 2, CAST(71.4900 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (48, 10257, 35, 9, CAST('2017-07-12' AS Date), 2, CAST(33.9800 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (49, 10601, 35, 3, CAST('2017-07-12' AS Date), 2, CAST(44.7300 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (50, 10602, 82, 1, CAST('2017-07-13' AS Date), 3, CAST(47.7400 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (51, 10510, 1, 7, CAST('2017-07-14' AS Date), 2, CAST(50.8700 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (52, 10603, 17, 8, CAST('2017-07-14' AS Date), 2, CAST(28.4900 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (53, 10784, 49, 6, CAST('2017-07-14' AS Date), 1, CAST(39.1200 AS Numeric(18, 4)), 4)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (54, 10334, 84, 5, CAST('2017-07-17' AS Date), 1, CAST(41.0100 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (55, 10605, 51, 1, CAST('2017-07-17' AS Date), 3, CAST(56.2200 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (56, 10575, 44, 7, CAST('2017-10-16' AS Date), 2, CAST(73.9800 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (57, 10710, 27, 6, CAST('2017-10-16' AS Date), 1, CAST(21.4900 AS Numeric(18, 4)), 4)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (58, 10711, 1, 8, CAST('2017-10-17' AS Date), 2, CAST(48.7300 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (59, 10712, 37, 3, CAST('2017-10-17' AS Date), 2, CAST(23.0900 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (60, 10713, 19, 9, CAST('2017-10-18' AS Date), 2, CAST(74.7500 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (61, 10714, 32, 1, CAST('2017-10-18' AS Date), 3, CAST(45.5400 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (62, 10336, 60, 4, CAST('2017-10-19' AS Date), 1, CAST(30.4500 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (63, 10715, 9, 5, CAST('2017-10-19' AS Date), 1, CAST(72.7000 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (64, 10578, 11, 3, CAST('2017-10-20' AS Date), 2, CAST(61.6700 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (65, 10646, 37, 3, CAST('2017-10-23' AS Date), 2, CAST(58.8200 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (66, 10832, 41, 5, CAST('2018-01-10' AS Date), 1, CAST(30.9700 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (67, 11020, 56, 7, CAST('2018-01-10' AS Date), 2, CAST(63.0800 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (68, 10835, 1, 7, CAST('2018-01-11' AS Date), 2, CAST(45.7100 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (69, 10417, 73, 9, CAST('2018-01-12' AS Date), 2, CAST(29.8800 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (70, 10837, 5, 9, CAST('2018-01-12' AS Date), 2, CAST(25.4200 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (71, 10387, 73, 9, CAST('2018-01-14' AS Date), 2, CAST(37.7600 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (72, 10841, 73, 9, CAST('2018-01-16' AS Date), 2, CAST(43.6500 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (73, 10420, 37, 9, CAST('2018-01-17' AS Date), 2, CAST(79.1800 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (74, 10843, 84, 4, CAST('2018-01-17' AS Date), 1, CAST(46.3200 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (75, 10360, 7, 5, CAST('2018-01-18' AS Date), 1, CAST(26.2400 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (76, 10805, 23, 6, CAST('2018-03-27' AS Date), 1, CAST(53.7000 AS Numeric(18, 4)), 4)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (77, 10986, 54, 3, CAST('2018-03-27' AS Date), 2, CAST(61.5900 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (78, 10490, 35, 9, CAST('2018-03-28' AS Date), 2, CAST(56.2300 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (79, 10988, 32, 1, CAST('2018-03-28' AS Date), 3, CAST(41.8900 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (80, 10989, 61, 3, CAST('2018-03-28' AS Date), 2, CAST(62.0000 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (81, 10990, 1, 8, CAST('2018-03-29' AS Date), 2, CAST(30.9000 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (82, 10991, 63, 8, CAST('2018-03-29' AS Date), 2, CAST(63.3200 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (83, 10993, 80, 1, CAST('2018-03-29' AS Date), 3, CAST(55.5300 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (84, 10386, 21, 2, CAST('2018-03-30' AS Date), 2, CAST(67.3300 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (85, 10995, 58, 8, CAST('2018-03-30' AS Date), 2, CAST(35.7700 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (86, 10886, 34, 3, CAST('2018-04-10' AS Date), 2, CAST(30.1100 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (87, 11021, 63, 8, CAST('2018-04-11' AS Date), 2, CAST(51.7400 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (88, 11023, 73, 3, CAST('2018-04-11' AS Date), 2, CAST(73.4900 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (89, 10355, 37, 3, CAST('2018-04-12' AS Date), 2, CAST(75.7700 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (90, 11024, 19, 3, CAST('2018-04-12' AS Date), 2, CAST(27.0100 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (91, 10890, 18, 6, CAST('2018-04-13' AS Date), 1, CAST(57.9400 AS Numeric(18, 4)), 4)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (92, 11027, 10, 1, CAST('2018-04-13' AS Date), 3, CAST(45.8700 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (93, 10956, 6, 8, CAST('2018-04-14' AS Date), 2, CAST(55.0300 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (94, 11030, 23, 6, CAST('2018-04-14' AS Date), 1, CAST(32.3400 AS Numeric(18, 4)), 4)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (95, 11031, 42, 1, CAST('2018-04-14' AS Date), 3, CAST(28.4800 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (96, 11063, 37, 3, CAST('2018-04-27' AS Date), 2, CAST(75.0800 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (97, 10921, 127, 3, CAST('2018-04-28' AS Date), 2, CAST(53.7800 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (98, 11066, 89, 9, CAST('2018-04-28' AS Date), 2, CAST(57.3700 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (99, 10992, 44, 8, CAST('2018-04-29' AS Date), 2, CAST(40.6400 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (100, 10321, 38, 3, CAST('2018-04-30' AS Date), 2, CAST(39.5600 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (101, 10812, 1, 7, CAST('2018-04-30' AS Date), 2, CAST(28.2000 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (102, 10297, 7, 4, CAST('2018-05-01' AS Date), 1, CAST(52.7300 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (103, 10929, 25, 8, CAST('2018-05-02' AS Date), 2, CAST(26.2500 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (104, 10932, 42, 1, CAST('2018-05-03' AS Date), 3, CAST(37.3500 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (105, 11067, 17, 8, CAST('2018-05-03' AS Date), 2, CAST(32.8800 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (106, 10261, 61, 2, CAST('2018-07-16' AS Date), 2, CAST(63.7800 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (107, 10842, 80, 1, CAST('2018-07-17' AS Date), 3, CAST(54.6600 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (108, 10845, 63, 7, CAST('2018-07-18' AS Date), 2, CAST(47.9400 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (109, 10513, 32, 1, CAST('2018-07-19' AS Date), 3, CAST(53.3700 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (110, 10263, 63, 7, CAST('2018-07-20' AS Date), 2, CAST(30.6400 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (111, 11049, 31, 9, CAST('2018-07-21' AS Date), 2, CAST(21.8300 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (112, 10266, 87, 8, CAST('2018-07-23' AS Date), 2, CAST(32.7200 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (113, 10396, 25, 7, CAST('2018-07-24' AS Date), 2, CAST(52.1400 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (114, 10857, 5, 3, CAST('2018-07-25' AS Date), 2, CAST(38.5100 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (115, 10923, 41, 4, CAST('2018-07-28' AS Date), 1, CAST(76.9000 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (116, 10914, 62, 3, CAST('2018-08-24' AS Date), 2, CAST(72.3800 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (117, 10920, 63, 8, CAST('2018-08-28' AS Date), 2, CAST(49.8300 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (118, 10922, 34, 9, CAST('2018-08-28' AS Date), 2, CAST(69.3700 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (119, 10295, 79, 7, CAST('2018-08-30' AS Date), 2, CAST(71.4900 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (120, 10927, 40, 5, CAST('2018-09-02' AS Date), 1, CAST(26.9400 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (121, 10940, 73, 9, CAST('2018-09-08' AS Date), 2, CAST(70.4900 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (122, 10946, 37, 9, CAST('2018-09-09' AS Date), 2, CAST(47.5800 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (123, 10305, 80, 1, CAST('2018-09-10' AS Date), 3, CAST(66.6100 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (124, 10947, 11, 3, CAST('2018-09-10' AS Date), 2, CAST(48.4700 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (125, 10960, 35, 3, CAST('2018-09-16' AS Date), 2, CAST(69.0300 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (126, 10962, 63, 7, CAST('2018-09-16' AS Date), 2, CAST(24.8800 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (127, 10311, 18, 6, CAST('2018-09-17' AS Date), 1, CAST(22.7600 AS Numeric(18, 4)), 4)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (128, 10965, 79, 8, CAST('2018-09-17' AS Date), 2, CAST(56.6200 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (129, 10967, 79, 8, CAST('2018-09-20' AS Date), 2, CAST(38.0600 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (130, 10969, 15, 9, CAST('2018-09-20' AS Date), 2, CAST(34.5400 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (131, 10971, 26, 8, CAST('2018-09-21' AS Date), 2, CAST(22.4100 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (132, 10851, 42, 1, CAST('2018-09-23' AS Date), 3, CAST(30.4300 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (133, 10802, 73, 9, CAST('2018-09-26' AS Date), 2, CAST(74.7600 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (134, 10318, 73, 9, CAST('2018-09-28' AS Date), 2, CAST(58.0400 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (135, 10322, 58, 7, CAST('2018-10-01' AS Date), 2, CAST(24.8300 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (136, 11004, 73, 9, CAST('2018-10-04' AS Date), 2, CAST(78.2900 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (137, 11007, 60, 4, CAST('2018-10-05' AS Date), 1, CAST(69.5900 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (138, 10332, 51, 1, CAST('2018-10-14' AS Date), 3, CAST(22.5000 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (139, 10345, 63, 7, CAST('2018-11-30' AS Date), 2, CAST(68.6700 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (140, 10361, 63, 7, CAST('2018-11-30' AS Date), 2, CAST(55.5200 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (141, 10997, 46, 9, CAST('2018-11-30' AS Date), 2, CAST(21.6200 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (142, 10999, 56, 7, CAST('2018-11-30' AS Date), 2, CAST(53.8000 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (143, 10463, 1, 8, CAST('2018-12-01' AS Date), 2, CAST(40.5800 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (144, 10373, 37, 9, CAST('2018-12-02' AS Date), 2, CAST(25.5000 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (145, 10813, 1, 8, CAST('2018-12-02' AS Date), 2, CAST(53.3600 AS Numeric(18, 4)), 2)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (146, 10872, 30, 5, CAST('2018-12-02' AS Date), 1, CAST(22.9200 AS Numeric(18, 4)), 3)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (147, 11077, 73, 9, CAST('2018-12-02' AS Date), 2, CAST(64.9300 AS Numeric(18, 4)), 1)

INSERT [dbo].[FactDevolucao] ([IDDevolucao], [IDVenda], [IDCliente], [IDEmpregado], [Data], [IDTransportadora], [ValorDevolucao], [IDFilial]) VALUES (148, 10930, 82, 1, CAST('2018-12-03' AS Date), 3, CAST(47.7000 AS Numeric(18, 4)), 5)

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10248, 1, 4, 2, CAST('2018-07-01' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'C')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10249, 2, 79, 7, CAST('2017-07-01' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10250, 1, 34, 2, CAST('2018-07-05' AS Date), 2, CAST(79.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10251, 2, 1, 7, CAST('2017-12-04' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10252, 3, 76, 5, CAST('2018-04-06' AS Date), 1, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10253, 1, 34, 3, CAST('2018-07-07' AS Date), 2, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10254, 1, 19, 2, CAST('2017-01-08' AS Date), 2, CAST(49.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10255, 4, 68, 6, CAST('2018-06-09' AS Date), 1, CAST(44.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10256, 1, 19, 3, CAST('2017-07-11' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10257, 1, 35, 9, CAST('2017-07-12' AS Date), 2, CAST(34.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10258, 2, 17, 7, CAST('2018-07-14' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10259, 1, 13, 3, CAST('2016-07-15' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10260, 2, 56, 8, CAST('2017-12-15' AS Date), 2, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10261, 1, 61, 2, CAST('2018-07-16' AS Date), 2, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10262, 1, 65, 2, CAST('2015-05-19' AS Date), 2, CAST(33.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10263, 2, 63, 7, CAST('2018-07-20' AS Date), 2, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10264, 2, 17, 7, CAST('2017-07-20' AS Date), 2, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10265, 3, 7, 5, CAST('2017-07-21' AS Date), 1, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10266, 2, 87, 8, CAST('2018-07-23' AS Date), 2, CAST(33.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10267, 2, 25, 8, CAST('2018-01-25' AS Date), 2, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10268, 1, 33, 3, CAST('2015-07-27' AS Date), 2, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10269, 1, 89, 3, CAST('2016-04-28' AS Date), 2, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10270, 2, 87, 7, CAST('2018-07-29' AS Date), 2, CAST(21.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10271, 1, 37, 2, CAST('2015-12-09' AS Date), 2, CAST(62.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10272, 1, 65, 3, CAST('2016-05-30' AS Date), 2, CAST(40.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10273, 2, 63, 7, CAST('2017-10-01' AS Date), 2, CAST(78.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10274, 3, 85, 5, CAST('2018-08-03' AS Date), 1, CAST(35.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10275, 1, 73, 9, CAST('2017-08-03' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10276, 5, 80, 1, CAST('2015-10-05' AS Date), 3, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10277, 2, 1, 7, CAST('2018-08-06' AS Date), 2, CAST(78.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10278, 1, 5, 2, CAST('2015-08-09' AS Date), 2, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10279, 2, 44, 7, CAST('2017-08-09' AS Date), 2, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10280, 1, 5, 3, CAST('2015-12-11' AS Date), 2, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10281, 3, 69, 4, CAST('2017-08-10' AS Date), 1, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10282, 3, 69, 5, CAST('2017-08-11' AS Date), 1, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10283, 1, 46, 2, CAST('2018-08-13' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10284, 2, 44, 7, CAST('2017-08-15' AS Date), 2, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10285, 2, 63, 8, CAST('2016-08-17' AS Date), 2, CAST(72.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10286, 2, 63, 8, CAST('2015-06-18' AS Date), 2, CAST(42.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10287, 1, 67, 2, CAST('2015-06-19' AS Date), 2, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10288, 4, 66, 6, CAST('2017-08-19' AS Date), 1, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10289, 2, 1, 8, CAST('2017-08-22' AS Date), 2, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10290, 2, 1, 7, CAST('2018-08-24' AS Date), 2, CAST(59.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10291, 1, 61, 2, CAST('2015-08-24' AS Date), 2, CAST(21.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10292, 1, 81, 2, CAST('2017-08-24' AS Date), 2, CAST(79.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10293, 5, 80, 1, CAST('2018-06-26' AS Date), 3, CAST(76.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10294, 1, 19, 2, CAST('2018-04-27' AS Date), 2, CAST(35.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10295, 2, 79, 7, CAST('2018-08-30' AS Date), 2, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10296, 1, 46, 2, CAST('2015-07-04' AS Date), 2, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10297, 3, 7, 4, CAST('2018-05-01' AS Date), 1, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10298, 1, 37, 2, CAST('2015-09-02' AS Date), 2, CAST(79.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10299, 1, 67, 3, CAST('2017-09-02' AS Date), 2, CAST(74.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10300, 4, 49, 6, CAST('2015-09-06' AS Date), 1, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10301, 1, 37, 9, CAST('2017-09-05' AS Date), 2, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10302, 5, 32, 1, CAST('2016-04-07' AS Date), 3, CAST(49.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10303, 3, 30, 5, CAST('2018-04-08' AS Date), 1, CAST(63.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10304, 5, 80, 1, CAST('2017-04-08' AS Date), 3, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10305, 5, 80, 1, CAST('2018-09-10' AS Date), 3, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10306, 3, 69, 5, CAST('2018-12-13' AS Date), 1, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10307, 5, 48, 1, CAST('2016-09-14' AS Date), 3, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10308, 1, 2, 2, CAST('2017-09-14' AS Date), 2, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10309, 1, 37, 3, CAST('2017-03-15' AS Date), 2, CAST(72.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10310, 5, 32, 1, CAST('2016-04-17' AS Date), 3, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10311, 4, 18, 6, CAST('2018-09-17' AS Date), 1, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10312, 1, 37, 3, CAST('2017-04-19' AS Date), 2, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10313, 2, 63, 7, CAST('2017-09-20' AS Date), 2, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10314, 1, 73, 3, CAST('2017-04-21' AS Date), 2, CAST(49.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10315, 1, 38, 9, CAST('2017-05-22' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10316, 4, 23, 6, CAST('2016-09-24' AS Date), 1, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10317, 5, 48, 1, CAST('2016-04-27' AS Date), 3, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10318, 1, 73, 9, CAST('2018-09-28' AS Date), 2, CAST(58.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10319, 5, 80, 1, CAST('2017-01-29' AS Date), 3, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10320, 2, 87, 8, CAST('2017-09-29' AS Date), 2, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10321, 1, 38, 3, CAST('2018-04-30' AS Date), 2, CAST(40.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10322, 2, 58, 7, CAST('2018-10-01' AS Date), 2, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10323, 1, 39, 3, CAST('2015-12-04' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10324, 1, 19, 2, CAST('2017-05-04' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10325, 1, 39, 3, CAST('2016-05-06' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10326, 3, 8, 5, CAST('2017-10-06' AS Date), 1, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10327, 1, 19, 3, CAST('2015-12-08' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10328, 3, 28, 5, CAST('2017-06-10' AS Date), 1, CAST(21.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10329, 5, 75, 1, CAST('2015-12-12' AS Date), 3, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10330, 1, 46, 3, CAST('2017-12-12' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10331, 3, 9, 5, CAST('2017-10-12' AS Date), 1, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10332, 5, 51, 1, CAST('2018-10-14' AS Date), 3, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10333, 2, 87, 7, CAST('2018-04-15' AS Date), 2, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10334, 3, 84, 5, CAST('2017-07-17' AS Date), 1, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10335, 1, 37, 9, CAST('2017-04-18' AS Date), 2, CAST(47.0000 AS Numeric(18, 4)), 'C')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10336, 3, 60, 4, CAST('2017-10-19' AS Date), 1, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10337, 2, 25, 8, CAST('2015-04-21' AS Date), 2, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10338, 2, 1, 8, CAST('2015-10-22' AS Date), 2, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10339, 5, 51, 1, CAST('2015-10-25' AS Date), 3, CAST(59.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10340, 5, 32, 1, CAST('2017-05-25' AS Date), 3, CAST(63.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10341, 1, 73, 3, CAST('2018-10-26' AS Date), 2, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10342, 2, 25, 7, CAST('2018-10-27' AS Date), 2, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10343, 2, 44, 8, CAST('2016-01-28' AS Date), 2, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10344, 1, 89, 2, CAST('2015-10-29' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10345, 2, 63, 7, CAST('2018-11-30' AS Date), 2, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10346, 1, 37, 9, CAST('2017-11-01' AS Date), 2, CAST(24.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10347, 1, 21, 2, CAST('2015-11-03' AS Date), 2, CAST(28.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10348, 2, 86, 7, CAST('2018-05-04' AS Date), 2, CAST(34.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10349, 2, 1, 7, CAST('2017-11-04' AS Date), 2, CAST(80.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10350, 1, 37, 3, CAST('2015-12-08' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10351, 5, 42, 1, CAST('2015-11-08' AS Date), 3, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10352, 3, 28, 5, CAST('2018-12-09' AS Date), 1, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10353, 3, 59, 5, CAST('2018-11-10' AS Date), 1, CAST(33.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10354, 2, 58, 7, CAST('2018-05-11' AS Date), 2, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10355, 1, 37, 3, CAST('2018-04-12' AS Date), 2, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10356, 2, 86, 7, CAST('2017-01-15' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10357, 1, 46, 2, CAST('2015-06-16' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10358, 5, 82, 1, CAST('2018-04-17' AS Date), 3, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10359, 1, 72, 9, CAST('2017-05-17' AS Date), 2, CAST(59.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10360, 3, 7, 5, CAST('2018-01-18' AS Date), 1, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10361, 2, 63, 7, CAST('2018-11-30' AS Date), 2, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10362, 2, 44, 8, CAST('2015-11-22' AS Date), 2, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10363, 2, 17, 8, CAST('2018-02-22' AS Date), 2, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10364, 1, 19, 2, CAST('2015-11-23' AS Date), 2, CAST(34.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10365, 1, 3, 2, CAST('2015-11-24' AS Date), 2, CAST(35.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10366, 3, 29, 4, CAST('2015-11-25' AS Date), 1, CAST(24.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10367, 2, 79, 7, CAST('2018-02-24' AS Date), 2, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10368, 1, 73, 3, CAST('2015-11-26' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10369, 5, 75, 1, CAST('2015-11-29' AS Date), 3, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10370, 5, 32, 1, CAST('2016-04-30' AS Date), 3, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10371, 3, 41, 4, CAST('2015-11-30' AS Date), 1, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10372, 1, 62, 2, CAST('2018-08-01' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10373, 1, 37, 9, CAST('2018-12-02' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10374, 2, 91, 8, CAST('2015-06-02' AS Date), 2, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10375, 4, 23, 6, CAST('2015-12-03' AS Date), 1, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10376, 5, 51, 1, CAST('2017-07-05' AS Date), 3, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10377, 5, 32, 1, CAST('2015-12-06' AS Date), 3, CAST(49.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10378, 2, 24, 7, CAST('2017-12-06' AS Date), 2, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10379, 1, 61, 2, CAST('2015-12-12' AS Date), 2, CAST(63.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10380, 1, 37, 9, CAST('2018-12-14' AS Date), 2, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10381, 1, 46, 2, CAST('2015-12-19' AS Date), 2, CAST(46.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10382, 1, 19, 3, CAST('2015-12-20' AS Date), 2, CAST(72.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10383, 5, 82, 1, CAST('2018-04-22' AS Date), 3, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10384, 1, 5, 2, CAST('2015-12-27' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10385, 5, 75, 1, CAST('2018-05-30' AS Date), 3, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10386, 1, 21, 2, CAST('2018-03-30' AS Date), 2, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10387, 1, 73, 9, CAST('2018-01-14' AS Date), 2, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10388, 1, 37, 3, CAST('2016-08-16' AS Date), 2, CAST(45.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10389, 1, 19, 9, CAST('2017-01-17' AS Date), 2, CAST(59.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10390, 5, 32, 1, CAST('2016-06-20' AS Date), 3, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10391, 2, 17, 8, CAST('2016-12-20' AS Date), 2, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10392, 3, 59, 4, CAST('2016-12-21' AS Date), 1, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10393, 1, 73, 9, CAST('2016-07-22' AS Date), 2, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10394, 5, 36, 1, CAST('2016-12-22' AS Date), 3, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10395, 1, 35, 3, CAST('2016-12-23' AS Date), 2, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10396, 2, 25, 7, CAST('2018-07-24' AS Date), 2, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10397, 3, 60, 5, CAST('2018-08-22' AS Date), 1, CAST(34.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10398, 1, 71, 3, CAST('2016-10-27' AS Date), 2, CAST(28.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10399, 2, 79, 7, CAST('2017-03-27' AS Date), 2, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10400, 1, 19, 9, CAST('2016-05-29' AS Date), 2, CAST(49.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10401, 5, 82, 1, CAST('2016-12-09' AS Date), 3, CAST(36.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10402, 3, 20, 4, CAST('2016-04-30' AS Date), 1, CAST(47.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10403, 3, 20, 4, CAST('2016-09-30' AS Date), 1, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10404, 4, 49, 6, CAST('2016-04-21' AS Date), 1, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10405, 1, 47, 2, CAST('2016-01-03' AS Date), 2, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10406, 1, 62, 2, CAST('2017-04-03' AS Date), 2, CAST(74.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10407, 2, 56, 8, CAST('2016-01-04' AS Date), 2, CAST(55.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10408, 4, 23, 6, CAST('2016-12-05' AS Date), 1, CAST(72.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10409, 1, 54, 3, CAST('2016-04-06' AS Date), 2, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10410, 5, 10, 1, CAST('2016-01-07' AS Date), 3, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10411, 5, 10, 1, CAST('2018-12-07' AS Date), 3, CAST(62.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10412, 2, 87, 8, CAST('2016-06-10' AS Date), 2, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10413, 3, 41, 5, CAST('2016-12-11' AS Date), 1, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10414, 1, 21, 3, CAST('2016-01-11' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10415, 1, 37, 3, CAST('2016-01-12' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10416, 5, 32, 1, CAST('2016-12-13' AS Date), 3, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10417, 1, 73, 9, CAST('2018-01-12' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10418, 2, 63, 7, CAST('2017-01-14' AS Date), 2, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10419, 2, 44, 7, CAST('2017-01-17' AS Date), 2, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10420, 1, 37, 9, CAST('2018-01-17' AS Date), 2, CAST(79.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10421, 1, 61, 2, CAST('2016-03-18' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10422, 4, 27, 6, CAST('2016-01-19' AS Date), 1, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10423, 1, 31, 2, CAST('2016-06-20' AS Date), 2, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10424, 5, 51, 1, CAST('2017-06-19' AS Date), 3, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10425, 3, 41, 4, CAST('2016-11-21' AS Date), 1, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10426, 3, 29, 5, CAST('2018-02-23' AS Date), 1, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10427, 3, 59, 4, CAST('2016-06-24' AS Date), 1, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10428, 4, 66, 6, CAST('2018-02-24' AS Date), 1, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10429, 1, 37, 9, CAST('2016-04-26' AS Date), 2, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10430, 2, 44, 7, CAST('2017-03-26' AS Date), 2, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10431, 5, 32, 1, CAST('2016-02-27' AS Date), 3, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10432, 4, 23, 6, CAST('2016-01-28' AS Date), 1, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10433, 3, 60, 4, CAST('2016-03-31' AS Date), 1, CAST(63.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10434, 4, 23, 6, CAST('2016-10-31' AS Date), 1, CAST(79.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10435, 1, 16, 2, CAST('2016-03-01' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10436, 3, 7, 5, CAST('2017-03-01' AS Date), 1, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10437, 2, 79, 7, CAST('2017-03-01' AS Date), 2, CAST(55.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10438, 2, 79, 7, CAST('2017-10-02' AS Date), 2, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10439, 5, 51, 1, CAST('2016-05-04' AS Date), 3, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10440, 1, 37, 3, CAST('2016-03-07' AS Date), 2, CAST(74.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10441, 5, 32, 1, CAST('2016-03-07' AS Date), 3, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10442, 1, 37, 3, CAST('2016-03-08' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10443, 1, 73, 9, CAST('2016-03-09' AS Date), 2, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10444, 1, 5, 9, CAST('2016-04-09' AS Date), 2, CAST(63.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10445, 1, 5, 9, CAST('2017-01-10' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10446, 5, 82, 1, CAST('2016-03-11' AS Date), 3, CAST(40.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10447, 5, 32, 1, CAST('2016-10-11' AS Date), 3, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10448, 2, 79, 8, CAST('2016-03-14' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10449, 3, 7, 4, CAST('2016-02-15' AS Date), 1, CAST(51.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10450, 3, 84, 5, CAST('2016-10-19' AS Date), 1, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10451, 2, 63, 7, CAST('2016-12-16' AS Date), 2, CAST(51.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10452, 1, 71, 9, CAST('2016-04-17' AS Date), 2, CAST(34.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10453, 2, 79, 8, CAST('2016-04-18' AS Date), 2, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10454, 4, 23, 6, CAST('2016-04-18' AS Date), 1, CAST(77.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10455, 5, 80, 1, CAST('2016-04-21' AS Date), 3, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10456, 1, 39, 3, CAST('2016-04-22' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10457, 1, 39, 9, CAST('2016-04-22' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10458, 1, 37, 9, CAST('2018-04-23' AS Date), 2, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10459, 3, 84, 5, CAST('2017-04-23' AS Date), 1, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10460, 1, 19, 2, CAST('2016-04-25' AS Date), 2, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10461, 1, 46, 9, CAST('2016-11-25' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10462, 1, 16, 3, CAST('2016-04-28' AS Date), 2, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10463, 2, 1, 8, CAST('2018-12-01' AS Date), 2, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10464, 2, 44, 7, CAST('2017-06-30' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10465, 1, 19, 3, CAST('2016-06-02' AS Date), 2, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10466, 1, 15, 2, CAST('2016-03-03' AS Date), 2, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10467, 4, 49, 6, CAST('2016-03-03' AS Date), 1, CAST(35.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10468, 1, 39, 9, CAST('2016-07-04' AS Date), 2, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10469, 1, 89, 3, CAST('2016-03-07' AS Date), 2, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10470, 1, 37, 3, CAST('2016-03-08' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10471, 1, 11, 2, CAST('2016-03-08' AS Date), 2, CAST(27.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10472, 4, 23, 6, CAST('2016-03-09' AS Date), 1, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10473, 1, 38, 3, CAST('2016-03-10' AS Date), 2, CAST(37.0000 AS Numeric(18, 4)), 'C')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10474, 2, 58, 8, CAST('2017-05-09' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10475, 1, 19, 3, CAST('2016-12-11' AS Date), 2, CAST(35.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10476, 1, 35, 3, CAST('2016-03-14' AS Date), 2, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10477, 3, 60, 5, CAST('2018-05-14' AS Date), 1, CAST(51.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10478, 3, 84, 4, CAST('2016-11-15' AS Date), 1, CAST(28.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10479, 2, 63, 8, CAST('2016-03-16' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10480, 4, 23, 6, CAST('2016-03-17' AS Date), 1, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10481, 1, 67, 2, CAST('2016-07-17' AS Date), 2, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10482, 4, 23, 6, CAST('2016-03-18' AS Date), 1, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10483, 1, 89, 2, CAST('2017-04-20' AS Date), 2, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10484, 3, 59, 5, CAST('2018-04-21' AS Date), 1, CAST(35.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10485, 1, 47, 9, CAST('2016-11-22' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10486, 1, 35, 9, CAST('2016-12-03' AS Date), 2, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10487, 1, 62, 2, CAST('2016-03-23' AS Date), 2, CAST(58.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10488, 2, 25, 8, CAST('2016-03-24' AS Date), 2, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10489, 3, 59, 5, CAST('2017-04-24' AS Date), 1, CAST(58.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10490, 1, 35, 9, CAST('2018-03-28' AS Date), 2, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10491, 3, 28, 4, CAST('2016-03-28' AS Date), 1, CAST(49.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10492, 2, 44, 8, CAST('2016-03-29' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10493, 5, 82, 1, CAST('2016-03-30' AS Date), 3, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10494, 1, 15, 9, CAST('2016-03-30' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10495, 5, 42, 1, CAST('2016-12-15' AS Date), 3, CAST(47.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10496, 1, 81, 2, CAST('2017-04-30' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10497, 2, 44, 8, CAST('2017-04-30' AS Date), 2, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10498, 1, 35, 3, CAST('2016-05-04' AS Date), 2, CAST(49.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10499, 1, 46, 9, CAST('2016-06-05' AS Date), 2, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10500, 3, 41, 5, CAST('2017-06-05' AS Date), 1, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10501, 2, 6, 7, CAST('2017-12-05' AS Date), 2, CAST(27.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10502, 2, 58, 8, CAST('2016-06-07' AS Date), 2, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10503, 1, 37, 3, CAST('2016-06-08' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10504, 1, 89, 9, CAST('2016-06-08' AS Date), 2, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10505, 5, 51, 1, CAST('2016-06-11' AS Date), 3, CAST(36.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10506, 1, 39, 9, CAST('2016-06-12' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10507, 1, 3, 3, CAST('2018-12-12' AS Date), 2, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10508, 2, 56, 8, CAST('2016-06-13' AS Date), 2, CAST(60.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10509, 2, 6, 7, CAST('2017-06-13' AS Date), 2, CAST(55.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10510, 2, 1, 7, CAST('2017-07-14' AS Date), 2, CAST(51.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10511, 5, 82, 1, CAST('2016-07-15' AS Date), 3, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10512, 1, 21, 2, CAST('2017-12-17' AS Date), 2, CAST(24.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10513, 5, 32, 1, CAST('2018-07-19' AS Date), 3, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10514, 5, 82, 1, CAST('2016-07-19' AS Date), 3, CAST(40.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10515, 2, 63, 8, CAST('2016-05-20' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10516, 1, 37, 9, CAST('2016-07-21' AS Date), 2, CAST(78.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10517, 1, 37, 9, CAST('2016-10-21' AS Date), 2, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10518, 5, 80, 1, CAST('2016-07-22' AS Date), 3, CAST(27.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10519, 1, 37, 9, CAST('2016-12-15' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10520, 1, 37, 3, CAST('2017-08-25' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10521, 1, 12, 2, CAST('2016-05-26' AS Date), 2, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10522, 2, 44, 8, CAST('2016-05-27' AS Date), 2, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10523, 1, 19, 3, CAST('2017-05-27' AS Date), 2, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10524, 1, 5, 3, CAST('2016-01-28' AS Date), 2, CAST(55.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10525, 3, 59, 4, CAST('2016-08-29' AS Date), 1, CAST(72.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10526, 2, 1, 8, CAST('2016-08-02' AS Date), 2, CAST(72.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10527, 2, 63, 8, CAST('2018-08-02' AS Date), 2, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10528, 5, 32, 1, CAST('2016-05-03' AS Date), 3, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10529, 3, 50, 5, CAST('2018-12-04' AS Date), 1, CAST(40.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10530, 3, 59, 4, CAST('2016-12-05' AS Date), 1, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10531, 1, 54, 3, CAST('2018-08-05' AS Date), 2, CAST(21.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10532, 1, 19, 9, CAST('2018-08-06' AS Date), 2, CAST(78.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10533, 2, 24, 7, CAST('2016-08-09' AS Date), 2, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10534, 2, 44, 7, CAST('2016-12-09' AS Date), 2, CAST(62.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10535, 1, 3, 9, CAST('2016-11-10' AS Date), 2, CAST(47.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10536, 2, 44, 7, CAST('2018-06-11' AS Date), 2, CAST(58.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10537, 4, 68, 6, CAST('2016-05-11' AS Date), 1, CAST(36.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10538, 2, 17, 7, CAST('2018-07-12' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10539, 2, 63, 8, CAST('2016-08-13' AS Date), 2, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10540, 2, 63, 8, CAST('2016-04-16' AS Date), 2, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10541, 1, 34, 9, CAST('2016-09-16' AS Date), 2, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10542, 1, 39, 3, CAST('2016-09-17' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10543, 1, 46, 3, CAST('2016-04-18' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10544, 5, 48, 1, CAST('2016-09-18' AS Date), 3, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10545, 5, 43, 1, CAST('2016-09-19' AS Date), 3, CAST(36.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10546, 3, 84, 4, CAST('2016-04-20' AS Date), 1, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10547, 2, 17, 7, CAST('2017-06-19' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10548, 2, 79, 7, CAST('2018-06-23' AS Date), 2, CAST(21.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10549, 2, 63, 8, CAST('2018-04-24' AS Date), 2, CAST(60.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10550, 3, 30, 4, CAST('2017-10-24' AS Date), 1, CAST(79.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10551, 3, 28, 4, CAST('2016-04-25' AS Date), 1, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10552, 1, 35, 3, CAST('2016-10-26' AS Date), 2, CAST(47.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10553, 1, 19, 9, CAST('2016-04-27' AS Date), 2, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10554, 2, 56, 7, CAST('2018-05-27' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10555, 4, 23, 6, CAST('2016-05-30' AS Date), 1, CAST(51.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10556, 1, 73, 3, CAST('2016-05-31' AS Date), 2, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10557, 2, 44, 7, CAST('2018-10-31' AS Date), 2, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10558, 4, 23, 6, CAST('2016-10-01' AS Date), 1, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10559, 3, 7, 4, CAST('2016-02-02' AS Date), 1, CAST(35.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10560, 2, 25, 8, CAST('2016-10-03' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10561, 2, 79, 8, CAST('2016-12-03' AS Date), 2, CAST(55.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10562, 5, 32, 1, CAST('2016-11-06' AS Date), 3, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10563, 1, 19, 9, CAST('2016-11-07' AS Date), 2, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10564, 5, 42, 1, CAST('2016-01-07' AS Date), 3, CAST(36.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10565, 5, 51, 1, CAST('2016-11-08' AS Date), 3, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10566, 3, 7, 4, CAST('2016-11-09' AS Date), 1, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10567, 1, 37, 9, CAST('2016-05-29' AS Date), 2, CAST(40.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10568, 3, 29, 4, CAST('2016-11-10' AS Date), 1, CAST(79.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10569, 2, 44, 8, CAST('2017-01-13' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10570, 5, 51, 1, CAST('2017-06-13' AS Date), 3, CAST(62.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10571, 3, 20, 4, CAST('2017-06-13' AS Date), 1, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10572, 1, 5, 3, CAST('2017-06-14' AS Date), 2, CAST(36.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10573, 1, 3, 9, CAST('2017-06-15' AS Date), 2, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10574, 5, 82, 1, CAST('2017-12-15' AS Date), 3, CAST(72.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10575, 2, 44, 7, CAST('2017-10-16' AS Date), 2, CAST(74.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10576, 5, 80, 1, CAST('2017-06-19' AS Date), 3, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10577, 5, 82, 1, CAST('2017-06-19' AS Date), 3, CAST(34.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10578, 1, 11, 3, CAST('2017-10-20' AS Date), 2, CAST(62.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10579, 5, 45, 1, CAST('2017-06-21' AS Date), 3, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10580, 2, 56, 7, CAST('2017-06-22' AS Date), 2, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10581, 1, 21, 3, CAST('2017-06-22' AS Date), 2, CAST(45.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10582, 1, 73, 3, CAST('2017-09-23' AS Date), 2, CAST(33.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10583, 2, 87, 7, CAST('2017-06-26' AS Date), 2, CAST(63.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10584, 3, 7, 5, CAST('2017-06-26' AS Date), 1, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10585, 2, 1, 7, CAST('2017-11-27' AS Date), 2, CAST(80.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10586, 5, 82, 1, CAST('2017-11-28' AS Date), 3, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10587, 1, 61, 3, CAST('2017-06-28' AS Date), 2, CAST(35.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10588, 2, 63, 7, CAST('2017-06-29' AS Date), 2, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10589, 5, 32, 1, CAST('2017-06-30' AS Date), 3, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10590, 5, 51, 1, CAST('2017-07-03' AS Date), 3, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10591, 1, 127, 3, CAST('2017-10-03' AS Date), 2, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10592, 2, 44, 8, CAST('2017-12-04' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10593, 2, 44, 7, CAST('2017-12-05' AS Date), 2, CAST(45.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10594, 5, 80, 1, CAST('2017-12-05' AS Date), 3, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10595, 2, 79, 7, CAST('2017-07-06' AS Date), 2, CAST(45.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10596, 1, 89, 3, CAST('2017-07-07' AS Date), 2, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10597, 3, 59, 4, CAST('2017-01-08' AS Date), 1, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10598, 5, 32, 1, CAST('2017-07-10' AS Date), 3, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10599, 1, 11, 9, CAST('2017-07-11' AS Date), 2, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10600, 3, 59, 4, CAST('2017-12-12' AS Date), 1, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10601, 1, 35, 3, CAST('2017-07-12' AS Date), 2, CAST(45.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10602, 5, 82, 1, CAST('2017-07-13' AS Date), 3, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10603, 2, 17, 8, CAST('2017-07-14' AS Date), 2, CAST(28.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10604, 4, 23, 6, CAST('2017-11-14' AS Date), 1, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10605, 5, 51, 1, CAST('2017-07-17' AS Date), 3, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10606, 1, 81, 2, CAST('2017-12-18' AS Date), 2, CAST(78.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10607, 5, 32, 1, CAST('2017-06-18' AS Date), 3, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10608, 2, 79, 8, CAST('2017-07-19' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10609, 4, 18, 6, CAST('2017-06-20' AS Date), 1, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10610, 3, 41, 4, CAST('2017-07-21' AS Date), 1, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10611, 2, 91, 8, CAST('2017-07-21' AS Date), 2, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10612, 1, 19, 3, CAST('2017-03-24' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10613, 1, 35, 9, CAST('2017-07-25' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10614, 1, 19, 3, CAST('2017-07-25' AS Date), 2, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10615, 2, 79, 8, CAST('2017-11-26' AS Date), 2, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10616, 5, 32, 1, CAST('2017-07-27' AS Date), 3, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10617, 5, 32, 1, CAST('2017-07-27' AS Date), 3, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10618, 5, 51, 1, CAST('2017-08-28' AS Date), 3, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10619, 5, 51, 1, CAST('2017-07-31' AS Date), 3, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10620, 5, 42, 1, CAST('2017-03-01' AS Date), 3, CAST(80.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10621, 2, 1, 8, CAST('2017-08-01' AS Date), 2, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10622, 5, 80, 1, CAST('2017-08-02' AS Date), 3, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10623, 2, 25, 7, CAST('2017-07-03' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10624, 1, 19, 3, CAST('2017-12-03' AS Date), 2, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10625, 1, 2, 3, CAST('2017-12-04' AS Date), 2, CAST(24.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10626, 1, 5, 9, CAST('2017-08-07' AS Date), 2, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10627, 2, 1, 7, CAST('2017-08-07' AS Date), 2, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10628, 3, 7, 5, CAST('2017-05-08' AS Date), 1, CAST(59.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10629, 3, 30, 4, CAST('2017-08-08' AS Date), 1, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10630, 1, 39, 3, CAST('2017-09-09' AS Date), 2, CAST(62.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10631, 2, 44, 8, CAST('2017-08-10' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10632, 2, 86, 7, CAST('2017-08-10' AS Date), 2, CAST(63.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10633, 4, 23, 6, CAST('2017-04-11' AS Date), 1, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10634, 4, 23, 6, CAST('2017-08-11' AS Date), 1, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10635, 4, 49, 6, CAST('2017-06-14' AS Date), 1, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10636, 2, 79, 7, CAST('2017-08-15' AS Date), 2, CAST(60.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10637, 1, 62, 3, CAST('2017-08-15' AS Date), 2, CAST(20.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10638, 1, 47, 2, CAST('2017-08-16' AS Date), 2, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10639, 1, 70, 3, CAST('2017-08-16' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10640, 2, 86, 8, CAST('2017-08-17' AS Date), 2, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10641, 1, 35, 9, CAST('2017-08-18' AS Date), 2, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10642, 1, 73, 3, CAST('2017-08-18' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10643, 2, 1, 8, CAST('2017-11-21' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10644, 5, 32, 1, CAST('2017-08-21' AS Date), 3, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10645, 1, 34, 9, CAST('2017-08-22' AS Date), 2, CAST(47.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10646, 1, 37, 3, CAST('2017-10-23' AS Date), 2, CAST(59.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10647, 1, 61, 3, CAST('2017-08-23' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10648, 3, 59, 5, CAST('2017-05-24' AS Date), 1, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10649, 3, 50, 5, CAST('2017-08-24' AS Date), 1, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10650, 1, 21, 3, CAST('2017-09-25' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10651, 1, 37, 9, CAST('2017-08-28' AS Date), 2, CAST(60.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10652, 1, 31, 3, CAST('2017-12-28' AS Date), 2, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10653, 2, 25, 7, CAST('2017-05-29' AS Date), 2, CAST(59.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10654, 1, 5, 3, CAST('2017-03-29' AS Date), 2, CAST(62.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10655, 4, 23, 6, CAST('2017-08-30' AS Date), 1, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10656, 5, 32, 1, CAST('2017-11-30' AS Date), 3, CAST(21.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10657, 5, 32, 1, CAST('2017-08-31' AS Date), 3, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10658, 2, 63, 7, CAST('2017-12-01' AS Date), 2, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10659, 1, 62, 2, CAST('2017-05-01' AS Date), 2, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10660, 1, 19, 9, CAST('2017-09-04' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10661, 1, 37, 3, CAST('2017-09-05' AS Date), 2, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10662, 5, 48, 1, CAST('2017-09-05' AS Date), 3, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10663, 4, 23, 6, CAST('2017-12-06' AS Date), 1, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10664, 2, 79, 8, CAST('2017-10-06' AS Date), 2, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10665, 5, 48, 1, CAST('2017-09-07' AS Date), 3, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10666, 4, 68, 6, CAST('2017-09-08' AS Date), 1, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10667, 3, 20, 5, CAST('2017-09-08' AS Date), 1, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10668, 2, 86, 8, CAST('2017-03-11' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10669, 1, 73, 3, CAST('2017-09-11' AS Date), 2, CAST(34.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10670, 2, 25, 7, CAST('2017-09-12' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10671, 2, 26, 7, CAST('2017-06-13' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10672, 1, 5, 3, CAST('2017-09-13' AS Date), 2, CAST(60.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10673, 1, 19, 9, CAST('2017-05-14' AS Date), 2, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10674, 2, 63, 7, CAST('2017-09-14' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10675, 2, 25, 8, CAST('2017-05-15' AS Date), 2, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10676, 5, 80, 1, CAST('2017-11-18' AS Date), 3, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10677, 1, 3, 9, CAST('2017-09-18' AS Date), 2, CAST(63.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10678, 1, 37, 9, CAST('2017-01-20' AS Date), 2, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10679, 3, 7, 5, CAST('2017-09-19' AS Date), 1, CAST(62.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10680, 5, 42, 1, CAST('2017-06-20' AS Date), 3, CAST(80.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10681, 5, 32, 1, CAST('2017-05-21' AS Date), 3, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10682, 1, 3, 3, CAST('2017-09-21' AS Date), 2, CAST(55.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10683, 4, 18, 6, CAST('2017-09-22' AS Date), 1, CAST(47.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10684, 2, 56, 7, CAST('2017-09-22' AS Date), 2, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10685, 1, 31, 2, CAST('2017-11-25' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10686, 3, 59, 5, CAST('2017-09-26' AS Date), 1, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10687, 1, 37, 3, CAST('2017-09-26' AS Date), 2, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10688, 1, 127, 3, CAST('2017-04-27' AS Date), 2, CAST(51.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10689, 1, 5, 9, CAST('2017-04-27' AS Date), 2, CAST(52.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10690, 1, 34, 9, CAST('2017-09-28' AS Date), 2, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10691, 2, 63, 7, CAST('2017-06-29' AS Date), 2, CAST(35.0000 AS Numeric(18, 4)), 'C')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10692, 2, 1, 8, CAST('2017-04-29' AS Date), 2, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10693, 1, 89, 2, CAST('2017-10-02' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10694, 2, 63, 7, CAST('2017-10-02' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10695, 1, 37, 9, CAST('2017-06-03' AS Date), 2, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10696, 1, 89, 3, CAST('2017-10-04' AS Date), 2, CAST(40.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10697, 1, 47, 3, CAST('2017-06-04' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10698, 5, 80, 1, CAST('2017-10-05' AS Date), 3, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10699, 2, 52, 7, CAST('2017-10-05' AS Date), 2, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10700, 4, 23, 6, CAST('2017-05-06' AS Date), 1, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10701, 1, 37, 9, CAST('2017-10-09' AS Date), 2, CAST(34.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10702, 2, 1, 7, CAST('2017-12-09' AS Date), 2, CAST(59.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10703, 2, 24, 8, CAST('2017-10-10' AS Date), 2, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10704, 1, 62, 2, CAST('2017-10-10' AS Date), 2, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10705, 1, 35, 9, CAST('2017-05-11' AS Date), 2, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10706, 2, 17, 8, CAST('2017-05-12' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10707, 5, 80, 1, CAST('2017-10-12' AS Date), 3, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10708, 2, 79, 8, CAST('2017-11-13' AS Date), 2, CAST(28.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10709, 1, 31, 3, CAST('2017-10-13' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10710, 4, 27, 6, CAST('2017-10-16' AS Date), 1, CAST(21.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10711, 2, 1, 8, CAST('2017-10-17' AS Date), 2, CAST(49.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10712, 1, 37, 3, CAST('2017-10-17' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10713, 1, 19, 9, CAST('2017-10-18' AS Date), 2, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10714, 5, 32, 1, CAST('2017-10-18' AS Date), 3, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10715, 3, 9, 5, CAST('2017-10-19' AS Date), 1, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10716, 1, 64, 2, CAST('2017-04-20' AS Date), 2, CAST(62.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10717, 2, 25, 8, CAST('2017-11-20' AS Date), 2, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10718, 1, 39, 3, CAST('2017-04-23' AS Date), 2, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10719, 5, 45, 1, CAST('2017-10-23' AS Date), 3, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10720, 5, 32, 1, CAST('2017-05-24' AS Date), 3, CAST(21.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10721, 2, 63, 8, CAST('2017-10-25' AS Date), 2, CAST(63.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10722, 1, 37, 9, CAST('2017-05-25' AS Date), 2, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10723, 1, 89, 2, CAST('2017-10-26' AS Date), 2, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10724, 5, 51, 1, CAST('2017-10-26' AS Date), 3, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10725, 1, 21, 3, CAST('2017-10-27' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10726, 1, 19, 3, CAST('2017-10-30' AS Date), 2, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10727, 5, 80, 1, CAST('2017-10-30' AS Date), 3, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10728, 1, 62, 3, CAST('2017-10-31' AS Date), 2, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10729, 1, 47, 2, CAST('2017-04-30' AS Date), 2, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10730, 5, 80, 1, CAST('2017-06-01' AS Date), 3, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10731, 2, 44, 7, CAST('2017-06-02' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10732, 2, 1, 7, CAST('2017-11-02' AS Date), 2, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10733, 1, 5, 9, CAST('2017-02-04' AS Date), 2, CAST(45.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10734, 1, 31, 9, CAST('2017-11-03' AS Date), 2, CAST(35.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10735, 2, 17, 7, CAST('2017-11-06' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10736, 1, 37, 9, CAST('2017-11-07' AS Date), 2, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10737, 1, 19, 3, CAST('2017-11-07' AS Date), 2, CAST(63.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10738, 3, 74, 4, CAST('2017-06-08' AS Date), 1, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10739, 1, 19, 9, CAST('2017-11-08' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10740, 1, 89, 3, CAST('2017-06-09' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10741, 1, 4, 9, CAST('2017-11-10' AS Date), 2, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10742, 1, 37, 3, CAST('2017-04-10' AS Date), 2, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10743, 2, 1, 8, CAST('2017-11-13' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10744, 2, 79, 7, CAST('2017-11-13' AS Date), 2, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10745, 2, 63, 8, CAST('2017-06-14' AS Date), 2, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10746, 5, 82, 1, CAST('2017-11-15' AS Date), 3, CAST(34.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10747, 3, 59, 5, CAST('2017-05-15' AS Date), 1, CAST(51.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10748, 2, 1, 7, CAST('2017-11-16' AS Date), 2, CAST(28.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10749, 5, 32, 1, CAST('2017-11-16' AS Date), 3, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10750, 2, 1, 8, CAST('2017-04-17' AS Date), 2, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10751, 1, 37, 3, CAST('2017-06-20' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10752, 1, 53, 2, CAST('2017-05-20' AS Date), 2, CAST(51.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10753, 4, 27, 6, CAST('2017-11-21' AS Date), 1, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10754, 4, 49, 6, CAST('2017-11-21' AS Date), 1, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10755, 3, 59, 5, CAST('2017-11-22' AS Date), 1, CAST(24.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10756, 5, 32, 1, CAST('2017-04-23' AS Date), 3, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10757, 2, 1, 7, CAST('2017-04-23' AS Date), 2, CAST(60.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10758, 5, 32, 1, CAST('2017-01-25' AS Date), 3, CAST(34.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10759, 1, 2, 2, CAST('2017-11-24' AS Date), 2, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10760, 3, 50, 4, CAST('2017-06-27' AS Date), 1, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10761, 1, 19, 9, CAST('2017-11-28' AS Date), 2, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10762, 5, 80, 1, CAST('2017-11-28' AS Date), 3, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10763, 4, 23, 6, CAST('2017-04-29' AS Date), 1, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10764, 2, 1, 8, CAST('2017-11-29' AS Date), 2, CAST(74.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10765, 2, 63, 7, CAST('2017-11-30' AS Date), 2, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10766, 2, 56, 8, CAST('2017-07-01' AS Date), 2, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10767, 3, 76, 4, CAST('2017-12-01' AS Date), 1, CAST(78.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10768, 3, 59, 5, CAST('2017-04-04' AS Date), 1, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10769, 1, 19, 3, CAST('2017-12-04' AS Date), 2, CAST(45.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10770, 1, 34, 3, CAST('2017-12-05' AS Date), 2, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10771, 3, 20, 5, CAST('2017-12-06' AS Date), 1, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10772, 2, 44, 8, CAST('2017-12-06' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10773, 3, 59, 5, CAST('2017-05-07' AS Date), 1, CAST(62.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10774, 2, 24, 8, CAST('2017-05-07' AS Date), 2, CAST(36.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10775, 1, 73, 3, CAST('2017-12-08' AS Date), 2, CAST(55.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10776, 2, 17, 7, CAST('2017-12-11' AS Date), 2, CAST(45.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10777, 1, 31, 3, CAST('2017-12-11' AS Date), 2, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10778, 1, 5, 9, CAST('2017-12-12' AS Date), 2, CAST(33.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10779, 5, 82, 1, CAST('2017-05-12' AS Date), 3, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10780, 1, 46, 3, CAST('2017-12-12' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10781, 2, 44, 8, CAST('2017-12-13' AS Date), 2, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10782, 1, 12, 9, CAST('2017-06-13' AS Date), 2, CAST(42.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10783, 1, 34, 3, CAST('2017-06-14' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10784, 4, 49, 6, CAST('2017-07-14' AS Date), 1, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10785, 1, 33, 9, CAST('2017-12-14' AS Date), 2, CAST(60.0000 AS Numeric(18, 4)), 'C')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10786, 1, 62, 3, CAST('2017-12-15' AS Date), 2, CAST(28.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10787, 1, 73, 9, CAST('2017-12-15' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10788, 2, 63, 8, CAST('2017-12-18' AS Date), 2, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10789, 4, 23, 6, CAST('2017-06-18' AS Date), 1, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10790, 1, 31, 3, CAST('2017-12-18' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10791, 2, 25, 8, CAST('2017-12-19' AS Date), 2, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10792, 2, 91, 8, CAST('2017-07-19' AS Date), 2, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10793, 2, 17, 8, CAST('2017-12-20' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10794, 1, 19, 3, CAST('2017-11-20' AS Date), 2, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10795, 2, 63, 7, CAST('2017-06-20' AS Date), 2, CAST(24.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10796, 1, 35, 3, CAST('2018-06-22' AS Date), 2, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10797, 2, 17, 8, CAST('2018-12-22' AS Date), 2, CAST(79.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10798, 1, 38, 9, CAST('2018-05-23' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10799, 1, 39, 9, CAST('2018-06-23' AS Date), 2, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10800, 1, 37, 9, CAST('2018-12-23' AS Date), 2, CAST(51.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10801, 3, 8, 4, CAST('2018-12-26' AS Date), 1, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10802, 1, 73, 9, CAST('2018-09-26' AS Date), 2, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10803, 1, 73, 3, CAST('2018-12-27' AS Date), 2, CAST(36.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10804, 1, 19, 3, CAST('2018-01-26' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10805, 4, 23, 6, CAST('2018-03-27' AS Date), 1, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10806, 3, 84, 4, CAST('2018-12-28' AS Date), 1, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10807, 4, 27, 6, CAST('2018-06-28' AS Date), 1, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10808, 1, 19, 3, CAST('2018-12-29' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10809, 2, 79, 7, CAST('2018-12-29' AS Date), 2, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10810, 5, 42, 1, CAST('2018-12-29' AS Date), 3, CAST(58.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10811, 1, 47, 3, CAST('2018-06-30' AS Date), 2, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10812, 2, 1, 7, CAST('2018-04-30' AS Date), 2, CAST(28.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10813, 2, 1, 8, CAST('2018-12-02' AS Date), 2, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10814, 3, 84, 4, CAST('2018-01-01' AS Date), 1, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10815, 1, 37, 3, CAST('2018-01-01' AS Date), 2, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10816, 5, 32, 1, CAST('2018-07-03' AS Date), 3, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10817, 1, 39, 3, CAST('2018-07-03' AS Date), 2, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10818, 4, 49, 6, CAST('2018-07-04' AS Date), 1, CAST(59.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10819, 1, 12, 2, CAST('2018-06-04' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10820, 1, 65, 3, CAST('2018-07-04' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10821, 5, 75, 1, CAST('2018-05-05' AS Date), 3, CAST(79.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10822, 5, 82, 1, CAST('2018-07-05' AS Date), 3, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10823, 1, 46, 9, CAST('2018-01-05' AS Date), 2, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10824, 2, 17, 7, CAST('2018-01-05' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10825, 2, 17, 8, CAST('2018-07-06' AS Date), 2, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10826, 3, 7, 4, CAST('2018-12-09' AS Date), 1, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10827, 2, 17, 7, CAST('2018-04-09' AS Date), 2, CAST(60.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10828, 3, 59, 4, CAST('2018-01-09' AS Date), 1, CAST(79.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10829, 1, 38, 9, CAST('2018-01-09' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10830, 1, 81, 2, CAST('2018-05-10' AS Date), 2, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10831, 5, 32, 1, CAST('2018-07-11' AS Date), 3, CAST(78.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10832, 3, 41, 5, CAST('2018-01-10' AS Date), 1, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10833, 2, 56, 8, CAST('2018-05-12' AS Date), 2, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10834, 1, 81, 3, CAST('2018-07-12' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10835, 2, 1, 7, CAST('2018-01-11' AS Date), 2, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10836, 5, 42, 1, CAST('2018-07-13' AS Date), 3, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10837, 1, 5, 9, CAST('2018-01-12' AS Date), 2, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10838, 1, 47, 9, CAST('2018-05-16' AS Date), 2, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10839, 1, 81, 9, CAST('2018-05-16' AS Date), 2, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10840, 1, 47, 9, CAST('2018-06-16' AS Date), 2, CAST(60.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10841, 1, 73, 9, CAST('2018-01-16' AS Date), 2, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10842, 5, 80, 1, CAST('2018-07-17' AS Date), 3, CAST(55.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10843, 3, 84, 4, CAST('2018-01-17' AS Date), 1, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10844, 3, 59, 4, CAST('2018-04-18' AS Date), 1, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10845, 2, 63, 7, CAST('2018-07-18' AS Date), 2, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10846, 3, 76, 4, CAST('2018-01-18' AS Date), 1, CAST(58.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10847, 5, 80, 1, CAST('2018-06-19' AS Date), 3, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10848, 1, 16, 3, CAST('2018-11-20' AS Date), 2, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10849, 1, 39, 9, CAST('2018-01-19' AS Date), 2, CAST(39.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10850, 3, 84, 4, CAST('2018-01-19' AS Date), 1, CAST(59.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10851, 5, 42, 1, CAST('2018-09-23' AS Date), 3, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10852, 2, 1, 8, CAST('2018-01-22' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10853, 2, 6, 8, CAST('2018-01-23' AS Date), 2, CAST(49.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10854, 3, 20, 5, CAST('2018-01-23' AS Date), 1, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10855, 5, 32, 1, CAST('2018-06-24' AS Date), 3, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10856, 1, 3, 9, CAST('2018-01-24' AS Date), 2, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10857, 1, 5, 3, CAST('2018-07-25' AS Date), 2, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10858, 3, 40, 5, CAST('2018-01-25' AS Date), 1, CAST(72.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10859, 2, 25, 8, CAST('2018-02-25' AS Date), 2, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10860, 2, 26, 7, CAST('2018-01-25' AS Date), 2, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10861, 1, 89, 3, CAST('2018-05-27' AS Date), 2, CAST(45.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10862, 2, 44, 7, CAST('2018-01-26' AS Date), 2, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10863, 1, 35, 9, CAST('2018-07-30' AS Date), 2, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10864, 1, 4, 3, CAST('2018-06-30' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10865, 2, 63, 8, CAST('2018-06-30' AS Date), 2, CAST(24.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10866, 1, 5, 3, CAST('2018-03-31' AS Date), 2, CAST(47.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10867, 5, 48, 1, CAST('2018-07-31' AS Date), 3, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10868, 1, 62, 3, CAST('2018-03-01' AS Date), 2, CAST(24.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10869, 5, 32, 1, CAST('2018-08-01' AS Date), 3, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10870, 2, 91, 8, CAST('2018-04-01' AS Date), 2, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10871, 2, 63, 8, CAST('2018-06-02' AS Date), 2, CAST(55.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10872, 3, 30, 5, CAST('2018-12-02' AS Date), 1, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10873, 5, 32, 1, CAST('2018-06-03' AS Date), 3, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10874, 1, 88, 2, CAST('2018-02-02' AS Date), 2, CAST(21.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10875, 1, 5, 9, CAST('2018-06-03' AS Date), 2, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10876, 3, 9, 4, CAST('2018-08-06' AS Date), 1, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10877, 1, 67, 3, CAST('2018-07-06' AS Date), 2, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10878, 2, 63, 7, CAST('2018-08-07' AS Date), 2, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10879, 2, 79, 7, CAST('2018-02-06' AS Date), 2, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10880, 2, 24, 7, CAST('2018-02-06' AS Date), 2, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10881, 1, 12, 3, CAST('2018-08-08' AS Date), 2, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10882, 3, 59, 4, CAST('2018-04-08' AS Date), 1, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10883, 2, 63, 7, CAST('2018-08-09' AS Date), 2, CAST(58.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10884, 1, 19, 9, CAST('2018-07-09' AS Date), 2, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10885, 3, 76, 4, CAST('2018-08-09' AS Date), 1, CAST(49.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10886, 1, 34, 3, CAST('2018-04-10' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10887, 3, 29, 5, CAST('2018-08-10' AS Date), 1, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10888, 3, 30, 5, CAST('2018-03-13' AS Date), 1, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10889, 1, 73, 3, CAST('2018-08-13' AS Date), 2, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10890, 4, 18, 6, CAST('2018-04-13' AS Date), 1, CAST(58.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10891, 2, 44, 8, CAST('2018-08-14' AS Date), 2, CAST(78.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10892, 1, 73, 3, CAST('2018-02-13' AS Date), 2, CAST(40.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10893, 1, 39, 9, CAST('2018-02-14' AS Date), 2, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10894, 2, 17, 7, CAST('2018-08-15' AS Date), 2, CAST(42.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10895, 1, 19, 9, CAST('2018-04-15' AS Date), 2, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10896, 3, 50, 4, CAST('2018-03-16' AS Date), 1, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10897, 1, 37, 9, CAST('2018-08-16' AS Date), 2, CAST(47.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10898, 1, 54, 3, CAST('2018-02-16' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10899, 1, 46, 3, CAST('2018-08-17' AS Date), 2, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10900, 1, 73, 9, CAST('2018-02-16' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10901, 1, 35, 3, CAST('2018-08-20' AS Date), 2, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10902, 2, 24, 7, CAST('2018-02-19' AS Date), 2, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10903, 1, 34, 3, CAST('2018-08-21' AS Date), 2, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10904, 1, 89, 3, CAST('2018-02-20' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10905, 2, 1, 7, CAST('2018-05-21' AS Date), 2, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10906, 2, 91, 8, CAST('2018-08-22' AS Date), 2, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10907, 3, 74, 4, CAST('2018-02-21' AS Date), 1, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10908, 2, 44, 7, CAST('2018-08-23' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10909, 2, 1, 8, CAST('2018-05-23' AS Date), 2, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10910, 1, 90, 9, CAST('2018-08-23' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10911, 3, 30, 5, CAST('2018-05-23' AS Date), 1, CAST(36.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10912, 1, 37, 3, CAST('2018-08-23' AS Date), 2, CAST(60.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10913, 1, 62, 3, CAST('2018-02-22' AS Date), 2, CAST(40.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10914, 1, 62, 3, CAST('2018-08-24' AS Date), 2, CAST(72.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10915, 5, 80, 1, CAST('2018-02-23' AS Date), 3, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10916, 2, 17, 8, CAST('2018-04-24' AS Date), 2, CAST(72.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10917, 3, 69, 5, CAST('2018-02-26' AS Date), 1, CAST(21.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10918, 5, 82, 1, CAST('2018-08-03' AS Date), 3, CAST(34.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10919, 1, 47, 3, CAST('2018-02-26' AS Date), 2, CAST(58.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10920, 2, 63, 8, CAST('2018-08-28' AS Date), 2, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10921, 1, 127, 3, CAST('2018-04-28' AS Date), 2, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10922, 1, 34, 9, CAST('2018-08-28' AS Date), 2, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10923, 3, 41, 4, CAST('2018-07-28' AS Date), 1, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10924, 1, 5, 3, CAST('2018-03-01' AS Date), 2, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10925, 1, 34, 9, CAST('2018-03-01' AS Date), 2, CAST(68.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10926, 1, 2, 3, CAST('2018-08-01' AS Date), 2, CAST(60.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10927, 3, 40, 5, CAST('2018-09-02' AS Date), 1, CAST(27.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10928, 3, 29, 4, CAST('2018-03-02' AS Date), 1, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10929, 2, 25, 8, CAST('2018-05-02' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10930, 5, 82, 1, CAST('2018-12-03' AS Date), 3, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10931, 4, 68, 6, CAST('2018-03-03' AS Date), 1, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10932, 5, 42, 1, CAST('2018-05-03' AS Date), 3, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10933, 1, 19, 3, CAST('2018-03-03' AS Date), 2, CAST(33.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10934, 2, 44, 7, CAST('2018-11-06' AS Date), 2, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10935, 5, 82, 1, CAST('2018-05-06' AS Date), 3, CAST(45.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10936, 5, 32, 1, CAST('2018-03-06' AS Date), 3, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10937, 1, 12, 9, CAST('2018-05-07' AS Date), 2, CAST(49.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10938, 2, 63, 7, CAST('2018-08-07' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10939, 4, 49, 6, CAST('2018-03-07' AS Date), 1, CAST(34.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10940, 1, 73, 9, CAST('2018-09-08' AS Date), 2, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10941, 5, 32, 1, CAST('2018-08-08' AS Date), 3, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10942, 4, 66, 6, CAST('2018-06-08' AS Date), 1, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10943, 5, 42, 1, CAST('2018-03-08' AS Date), 3, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10944, 2, 79, 8, CAST('2018-03-09' AS Date), 2, CAST(72.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10945, 5, 32, 1, CAST('2018-07-09' AS Date), 3, CAST(27.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10946, 1, 37, 9, CAST('2018-09-09' AS Date), 2, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10947, 1, 11, 3, CAST('2018-09-10' AS Date), 2, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10948, 3, 30, 5, CAST('2018-03-10' AS Date), 1, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10949, 5, 10, 1, CAST('2018-12-10' AS Date), 3, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10950, 4, 49, 6, CAST('2018-12-13' AS Date), 1, CAST(59.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10951, 1, 73, 9, CAST('2018-03-13' AS Date), 2, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10952, 2, 1, 7, CAST('2018-03-13' AS Date), 2, CAST(78.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10953, 1, 4, 9, CAST('2018-03-13' AS Date), 2, CAST(30.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10954, 1, 47, 3, CAST('2018-06-14' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10955, 1, 19, 9, CAST('2018-03-14' AS Date), 2, CAST(59.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10956, 2, 6, 8, CAST('2018-04-14' AS Date), 2, CAST(55.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10957, 1, 35, 3, CAST('2018-05-15' AS Date), 2, CAST(49.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10958, 1, 54, 3, CAST('2018-06-15' AS Date), 2, CAST(53.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10959, 1, 31, 9, CAST('2018-03-15' AS Date), 2, CAST(27.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10960, 1, 35, 3, CAST('2018-09-16' AS Date), 2, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10961, 1, 62, 3, CAST('2018-03-16' AS Date), 2, CAST(74.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10962, 2, 63, 7, CAST('2018-09-16' AS Date), 2, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10963, 3, 28, 5, CAST('2018-03-16' AS Date), 1, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10964, 3, 74, 4, CAST('2018-12-17' AS Date), 1, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10965, 2, 79, 8, CAST('2018-09-17' AS Date), 2, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10966, 4, 23, 6, CAST('2018-03-17' AS Date), 1, CAST(23.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10967, 2, 79, 8, CAST('2018-09-20' AS Date), 2, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10968, 5, 32, 1, CAST('2018-04-20' AS Date), 3, CAST(38.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10969, 1, 15, 9, CAST('2018-09-20' AS Date), 2, CAST(35.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10970, 3, 8, 4, CAST('2018-03-21' AS Date), 1, CAST(51.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10971, 2, 26, 8, CAST('2018-09-21' AS Date), 2, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10972, 3, 40, 4, CAST('2018-03-21' AS Date), 1, CAST(51.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10973, 3, 40, 5, CAST('2018-03-21' AS Date), 1, CAST(79.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10974, 5, 75, 1, CAST('2018-03-22' AS Date), 3, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10975, 4, 23, 6, CAST('2018-10-22' AS Date), 1, CAST(43.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10976, 1, 35, 9, CAST('2018-03-22' AS Date), 2, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10977, 5, 82, 1, CAST('2018-03-23' AS Date), 3, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10978, 1, 73, 9, CAST('2018-10-23' AS Date), 2, CAST(42.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10979, 5, 32, 1, CAST('2018-05-23' AS Date), 3, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10980, 1, 19, 3, CAST('2018-10-24' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10981, 1, 34, 9, CAST('2018-12-04' AS Date), 2, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10982, 5, 80, 1, CAST('2018-03-24' AS Date), 3, CAST(21.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10983, 1, 19, 9, CAST('2018-10-24' AS Date), 2, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10984, 1, 33, 3, CAST('2018-05-27' AS Date), 2, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10985, 1, 37, 9, CAST('2018-05-27' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10986, 1, 54, 3, CAST('2018-03-27' AS Date), 2, CAST(62.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10987, 1, 19, 3, CAST('2018-06-28' AS Date), 2, CAST(47.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10988, 5, 32, 1, CAST('2018-03-28' AS Date), 3, CAST(42.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10989, 1, 61, 3, CAST('2018-03-28' AS Date), 2, CAST(62.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10990, 2, 1, 8, CAST('2018-03-29' AS Date), 2, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10991, 2, 63, 8, CAST('2018-03-29' AS Date), 2, CAST(63.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10992, 2, 44, 8, CAST('2018-04-29' AS Date), 2, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10993, 5, 80, 1, CAST('2018-03-29' AS Date), 3, CAST(56.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10994, 2, 1, 7, CAST('2018-10-30' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10995, 2, 58, 8, CAST('2018-03-30' AS Date), 2, CAST(36.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10996, 2, 63, 7, CAST('2018-03-30' AS Date), 2, CAST(33.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10997, 1, 46, 9, CAST('2018-11-30' AS Date), 2, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10998, 2, 91, 8, CAST('2018-03-31' AS Date), 2, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (10999, 2, 56, 7, CAST('2018-11-30' AS Date), 2, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11000, 1, 37, 3, CAST('2018-06-03' AS Date), 2, CAST(77.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11001, 2, 24, 8, CAST('2018-12-03' AS Date), 2, CAST(33.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11002, 1, 37, 9, CAST('2018-02-02' AS Date), 2, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11003, 1, 37, 3, CAST('2018-04-03' AS Date), 2, CAST(29.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11004, 1, 73, 9, CAST('2018-10-04' AS Date), 2, CAST(78.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11005, 2, 1, 8, CAST('2018-05-04' AS Date), 2, CAST(25.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11006, 5, 32, 1, CAST('2018-06-04' AS Date), 3, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11007, 3, 60, 4, CAST('2018-10-05' AS Date), 1, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11008, 2, 17, 7, CAST('2018-04-05' AS Date), 2, CAST(40.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11009, 3, 30, 4, CAST('2018-04-05' AS Date), 1, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11010, 4, 66, 6, CAST('2018-04-06' AS Date), 1, CAST(37.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11011, 2, 1, 7, CAST('2018-11-06' AS Date), 2, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11012, 2, 25, 7, CAST('2018-04-06' AS Date), 2, CAST(41.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11013, 3, 69, 4, CAST('2018-04-06' AS Date), 1, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11014, 1, 47, 3, CAST('2018-04-07' AS Date), 2, CAST(80.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11015, 1, 19, 9, CAST('2018-04-07' AS Date), 2, CAST(42.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11016, 5, 42, 1, CAST('2018-04-07' AS Date), 3, CAST(74.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11017, 2, 44, 7, CAST('2018-12-10' AS Date), 2, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11018, 5, 48, 1, CAST('2018-07-10' AS Date), 3, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11019, 1, 64, 3, CAST('2018-06-10' AS Date), 2, CAST(20.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11020, 2, 56, 7, CAST('2018-01-10' AS Date), 2, CAST(63.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11021, 2, 63, 8, CAST('2018-04-11' AS Date), 2, CAST(52.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11022, 1, 34, 9, CAST('2018-11-11' AS Date), 2, CAST(41.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11023, 1, 73, 3, CAST('2018-04-11' AS Date), 2, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11024, 1, 19, 3, CAST('2018-04-12' AS Date), 2, CAST(27.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11025, 2, 87, 7, CAST('2018-05-12' AS Date), 2, CAST(61.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11026, 4, 27, 6, CAST('2018-05-12' AS Date), 1, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11027, 5, 10, 1, CAST('2018-04-13' AS Date), 3, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11028, 1, 39, 9, CAST('2018-12-13' AS Date), 2, CAST(48.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11029, 2, 79, 8, CAST('2018-05-13' AS Date), 2, CAST(21.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11030, 4, 23, 6, CAST('2018-04-14' AS Date), 1, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11031, 5, 42, 1, CAST('2018-04-14' AS Date), 3, CAST(28.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11032, 1, 89, 9, CAST('2018-05-14' AS Date), 2, CAST(31.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11033, 5, 82, 1, CAST('2018-05-14' AS Date), 3, CAST(73.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11034, 1, 37, 9, CAST('2018-04-17' AS Date), 2, CAST(55.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11035, 3, 76, 5, CAST('2018-10-17' AS Date), 1, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11036, 2, 17, 8, CAST('2018-05-17' AS Date), 2, CAST(47.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11037, 3, 30, 4, CAST('2018-04-18' AS Date), 1, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11038, 4, 23, 6, CAST('2018-04-18' AS Date), 1, CAST(32.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11039, 1, 47, 3, CAST('2018-04-18' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11040, 5, 32, 1, CAST('2018-05-19' AS Date), 3, CAST(51.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11041, 5, 80, 1, CAST('2018-04-19' AS Date), 3, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11042, 3, 59, 5, CAST('2018-04-19' AS Date), 1, CAST(36.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11043, 1, 19, 9, CAST('2018-04-19' AS Date), 2, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11044, 2, 91, 8, CAST('2018-05-20' AS Date), 2, CAST(60.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11045, 5, 10, 1, CAST('2018-04-20' AS Date), 3, CAST(42.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11046, 4, 23, 6, CAST('2018-06-20' AS Date), 1, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11047, 1, 19, 3, CAST('2018-12-21' AS Date), 2, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11048, 5, 10, 1, CAST('2018-04-21' AS Date), 3, CAST(42.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11049, 1, 31, 9, CAST('2018-07-21' AS Date), 2, CAST(22.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11050, 4, 23, 6, CAST('2018-10-24' AS Date), 1, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11051, 2, 1, 8, CAST('2018-04-24' AS Date), 2, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11052, 1, 34, 3, CAST('2018-05-24' AS Date), 2, CAST(54.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11053, 3, 59, 4, CAST('2018-04-24' AS Date), 1, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11054, 1, 12, 9, CAST('2018-04-25' AS Date), 2, CAST(67.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11055, 1, 35, 9, CAST('2018-04-25' AS Date), 2, CAST(55.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11056, 1, 19, 3, CAST('2018-01-24' AS Date), 2, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11057, 1, 53, 2, CAST('2018-04-26' AS Date), 2, CAST(69.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11058, 2, 6, 7, CAST('2018-04-26' AS Date), 2, CAST(58.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11059, 1, 19, 9, CAST('2018-05-26' AS Date), 2, CAST(76.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11060, 4, 27, 6, CAST('2018-04-27' AS Date), 1, CAST(74.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11061, 5, 32, 1, CAST('2018-04-27' AS Date), 3, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11062, 3, 59, 5, CAST('2018-05-27' AS Date), 1, CAST(71.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11063, 1, 37, 3, CAST('2018-04-27' AS Date), 2, CAST(75.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11064, 2, 1, 7, CAST('2018-05-28' AS Date), 2, CAST(51.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11065, 1, 46, 3, CAST('2018-11-28' AS Date), 2, CAST(64.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11066, 1, 89, 9, CAST('2018-04-28' AS Date), 2, CAST(57.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11067, 2, 17, 8, CAST('2018-05-03' AS Date), 2, CAST(33.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11068, 1, 62, 3, CAST('2018-05-04' AS Date), 2, CAST(46.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11069, 5, 80, 1, CAST('2018-05-06' AS Date), 3, CAST(35.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11070, 2, 44, 8, CAST('2018-05-10' AS Date), 2, CAST(44.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11071, 1, 46, 9, CAST('2018-11-11' AS Date), 2, CAST(28.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11072, 5, 32, 1, CAST('2018-05-13' AS Date), 3, CAST(70.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11073, 2, 58, 8, CAST('2018-05-06' AS Date), 2, CAST(26.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11074, 1, 73, 3, CAST('2018-05-07' AS Date), 2, CAST(66.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11075, 4, 68, 6, CAST('2018-11-10' AS Date), 1, CAST(39.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11076, 3, 9, 5, CAST('2018-05-19' AS Date), 1, CAST(58.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11077, 1, 73, 9, CAST('2018-12-02' AS Date), 2, CAST(65.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11078, 3, 22, 4, CAST('2018-01-25' AS Date), 1, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11079, 5, 55, 1, CAST('2018-04-15' AS Date), 3, CAST(50.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11080, 5, 77, 1, CAST('2018-05-27' AS Date), 3, CAST(28.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11081, 5, 78, 1, CAST('2018-12-13' AS Date), 3, CAST(12.0000 AS Numeric(18, 4)), 'F')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11082, 3, 22, 4, CAST('2018-03-26' AS Date), 1, CAST(24.0000 AS Numeric(18, 4)), 'A')

INSERT [dbo].[FactVendas] ([IDVenda], [IDFilial], [IDClientes], [IDEmpregado], [Data], [IDTransportadora], [Frete], [Status]) VALUES (11083, 4, 14, 6, CAST('2017-11-16' AS Date), 1, CAST(45.0000 AS Numeric(18, 4)), 'F')

SET IDENTITY_INSERT [dbo].[FactVendasItens] ON 

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1, 10248, 11, CAST(28.6200 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2, 10248, 42, CAST(14.0400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (3, 10248, 72, CAST(12.7100 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (4, 10249, 14, CAST(22.8000 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (5, 10249, 51, CAST(101.2000 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (6, 10250, 41, CAST(9.5900 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (7, 10250, 51, CAST(97.6700 AS Numeric(18, 4)), 35, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (8, 10250, 65, CAST(9.4700 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (9, 10251, 22, CAST(3.3900 AS Numeric(18, 4)), 6, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (10, 10251, 57, CAST(21.1200 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (11, 10251, 65, CAST(9.2600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (12, 10252, 20, CAST(75.9300 AS Numeric(18, 4)), 40, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (13, 10252, 33, CAST(23.6400 AS Numeric(18, 4)), 25, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (14, 10252, 60, CAST(4.5500 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (15, 10253, 31, CAST(8.2800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (16, 10253, 39, CAST(57.9500 AS Numeric(18, 4)), 42, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (17, 10253, 49, CAST(19.9100 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (18, 10254, 24, CAST(4.5200 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (19, 10254, 55, CAST(40.7600 AS Numeric(18, 4)), 21, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (20, 10254, 74, CAST(29.4000 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (21, 10255, 2, CAST(17.1200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (22, 10255, 16, CAST(9.1700 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (23, 10255, 36, CAST(7.7700 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (24, 10255, 59, CAST(7.8300 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (25, 10256, 53, CAST(60.5300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (26, 10256, 77, CAST(13.5000 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (27, 10257, 27, CAST(43.0900 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (28, 10257, 39, CAST(54.8400 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (29, 10257, 77, CAST(12.8400 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (30, 10258, 2, CAST(20.0200 AS Numeric(18, 4)), 50, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (31, 10258, 5, CAST(6.1300 AS Numeric(18, 4)), 65, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (32, 10258, 32, CAST(19.3500 AS Numeric(18, 4)), 6, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (33, 10259, 21, CAST(10.1400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (34, 10259, 37, CAST(4.3700 AS Numeric(18, 4)), 1, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (35, 10260, 41, CAST(10.0200 AS Numeric(18, 4)), 16, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (36, 10260, 57, CAST(18.5800 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (37, 10260, 62, CAST(28.8200 AS Numeric(18, 4)), 15, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (38, 10260, 70, CAST(29.3700 AS Numeric(18, 4)), 21, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (39, 10261, 21, CAST(10.0100 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (40, 10261, 35, CAST(6.5600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (41, 10262, 5, CAST(5.5800 AS Numeric(18, 4)), 12, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (42, 10262, 7, CAST(38.3000 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (43, 10262, 56, CAST(34.5500 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (44, 10263, 16, CAST(9.4600 AS Numeric(18, 4)), 60, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (45, 10263, 24, CAST(4.0900 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (46, 10263, 30, CAST(26.5700 AS Numeric(18, 4)), 60, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (47, 10263, 74, CAST(27.8700 AS Numeric(18, 4)), 36, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (48, 10264, 2, CAST(20.5500 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (49, 10264, 41, CAST(9.5500 AS Numeric(18, 4)), 25, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (50, 10265, 17, CAST(23.9000 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (51, 10265, 70, CAST(27.8100 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (52, 10266, 12, CAST(10.1600 AS Numeric(18, 4)), 12, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (53, 10267, 40, CAST(18.7100 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (54, 10267, 59, CAST(8.6600 AS Numeric(18, 4)), 70, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (55, 10267, 76, CAST(368.5100 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (56, 10268, 29, CAST(117.3000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (57, 10268, 72, CAST(12.6400 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (58, 10269, 33, CAST(27.4000 AS Numeric(18, 4)), 60, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (59, 10269, 72, CAST(12.1700 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (60, 10270, 36, CAST(7.7800 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (61, 10270, 43, CAST(13.0600 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (62, 10271, 33, CAST(24.0600 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (63, 10272, 20, CAST(88.2500 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (64, 10272, 31, CAST(7.8100 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (65, 10272, 72, CAST(11.7600 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (66, 10273, 10, CAST(6.8800 AS Numeric(18, 4)), 24, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (67, 10273, 31, CAST(8.9500 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (68, 10273, 33, CAST(25.4500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (69, 10273, 40, CAST(19.3500 AS Numeric(18, 4)), 60, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (70, 10273, 76, CAST(412.1600 AS Numeric(18, 4)), 33, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (71, 10274, 71, CAST(31.1700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (72, 10274, 72, CAST(11.9900 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (73, 10275, 24, CAST(4.1200 AS Numeric(18, 4)), 12, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (74, 10275, 59, CAST(8.9200 AS Numeric(18, 4)), 6, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (75, 10276, 10, CAST(6.9200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (76, 10276, 13, CAST(27.4500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (77, 10277, 28, CAST(44.4800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (78, 10277, 62, CAST(30.0800 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (79, 10278, 44, CAST(80.7800 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (80, 10278, 59, CAST(8.5700 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (81, 10278, 63, CAST(21.0200 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (82, 10278, 73, CAST(1.0700 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (83, 10279, 17, CAST(27.0200 AS Numeric(18, 4)), 15, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (84, 10280, 24, CAST(4.2500 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (85, 10280, 55, CAST(42.4700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (86, 10280, 75, CAST(7.2100 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (87, 10281, 19, CAST(9.9000 AS Numeric(18, 4)), 1, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (88, 10281, 24, CAST(4.1800 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (89, 10281, 35, CAST(6.3700 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (90, 10282, 30, CAST(26.3800 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (91, 10282, 57, CAST(21.0200 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (92, 10283, 15, CAST(6.5300 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (93, 10283, 19, CAST(9.1800 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (94, 10283, 60, CAST(5.1800 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (95, 10283, 72, CAST(11.6600 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (96, 10284, 27, CAST(43.0300 AS Numeric(18, 4)), 15, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (97, 10284, 44, CAST(68.3700 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (98, 10284, 60, CAST(4.7300 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (99, 10284, 67, CAST(64.0700 AS Numeric(18, 4)), 5, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (100, 10285, 1, CAST(19.7200 AS Numeric(18, 4)), 45, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (101, 10285, 40, CAST(17.2200 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (102, 10285, 53, CAST(60.9600 AS Numeric(18, 4)), 36, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (103, 10286, 35, CAST(6.0600 AS Numeric(18, 4)), 100, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (104, 10286, 62, CAST(30.2800 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (105, 10287, 16, CAST(8.8800 AS Numeric(18, 4)), 40, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (106, 10287, 34, CAST(7.6700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (107, 10287, 46, CAST(12.2300 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (108, 10288, 54, CAST(33.6200 AS Numeric(18, 4)), 10, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (109, 10288, 68, CAST(11.7600 AS Numeric(18, 4)), 3, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (110, 10289, 3, CAST(20.5400 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (111, 10289, 64, CAST(35.6000 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (112, 10290, 5, CAST(6.5700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (113, 10290, 29, CAST(126.0300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (114, 10290, 49, CAST(19.6600 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (115, 10290, 77, CAST(13.4900 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (116, 10291, 13, CAST(23.0300 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (117, 10291, 44, CAST(82.6800 AS Numeric(18, 4)), 24, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (118, 10291, 51, CAST(106.5600 AS Numeric(18, 4)), 2, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (119, 10292, 20, CAST(84.0700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (120, 10293, 18, CAST(27.3800 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (121, 10293, 24, CAST(4.1100 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (122, 10293, 63, CAST(21.0600 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (123, 10293, 75, CAST(7.6000 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (124, 10294, 1, CAST(21.6600 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (125, 10294, 17, CAST(24.6200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (126, 10294, 43, CAST(12.9000 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (127, 10294, 60, CAST(4.5600 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (128, 10294, 75, CAST(8.2200 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (129, 10295, 56, CAST(34.8400 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (130, 10296, 11, CAST(26.6200 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (131, 10296, 16, CAST(9.3600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (132, 10296, 69, CAST(1.8900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (133, 10297, 39, CAST(59.3500 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (134, 10297, 72, CAST(11.9500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (135, 10298, 2, CAST(17.5400 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (136, 10298, 36, CAST(7.3400 AS Numeric(18, 4)), 40, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (137, 10298, 59, CAST(9.1500 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (138, 10298, 62, CAST(28.0000 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (139, 10299, 19, CAST(9.1700 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (140, 10299, 70, CAST(29.0800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (141, 10300, 66, CAST(19.8900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (142, 10300, 68, CAST(11.2700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (143, 10301, 40, CAST(18.3300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (144, 10301, 56, CAST(39.1700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (145, 10302, 17, CAST(25.6500 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (146, 10302, 28, CAST(42.8100 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (147, 10302, 43, CAST(10.8200 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (148, 10303, 40, CAST(17.6200 AS Numeric(18, 4)), 40, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (149, 10303, 65, CAST(10.7800 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (150, 10303, 68, CAST(12.7700 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (151, 10304, 49, CAST(19.7900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (152, 10304, 59, CAST(7.9100 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (153, 10304, 71, CAST(29.7600 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (154, 10305, 18, CAST(27.5600 AS Numeric(18, 4)), 25, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (155, 10305, 29, CAST(113.9400 AS Numeric(18, 4)), 25, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (156, 10305, 39, CAST(57.2500 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (157, 10306, 30, CAST(28.0200 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (158, 10306, 53, CAST(61.1100 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (159, 10306, 54, CAST(37.8800 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (160, 10307, 62, CAST(27.2700 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (161, 10307, 68, CAST(12.8200 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (162, 10308, 69, CAST(2.1200 AS Numeric(18, 4)), 1, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (163, 10308, 70, CAST(29.5500 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (164, 10309, 4, CAST(21.6400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (165, 10309, 6, CAST(3.6900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (166, 10309, 42, CAST(13.6200 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (167, 10309, 43, CAST(11.8700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (168, 10309, 71, CAST(29.7600 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (169, 10310, 16, CAST(8.5300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (170, 10310, 62, CAST(32.1900 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (171, 10311, 42, CAST(14.9300 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (172, 10311, 69, CAST(1.9800 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (173, 10312, 28, CAST(49.1700 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (174, 10312, 43, CAST(13.1100 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (175, 10312, 53, CAST(63.2300 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (176, 10312, 75, CAST(7.6300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (177, 10313, 36, CAST(8.4700 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (178, 10314, 32, CAST(19.8800 AS Numeric(18, 4)), 40, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (179, 10314, 58, CAST(43.9700 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (180, 10314, 62, CAST(31.4300 AS Numeric(18, 4)), 25, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (181, 10315, 34, CAST(8.3800 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (182, 10315, 70, CAST(29.1300 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (183, 10316, 41, CAST(8.9600 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (184, 10316, 62, CAST(29.3300 AS Numeric(18, 4)), 70, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (185, 10317, 1, CAST(18.1200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (186, 10318, 41, CAST(9.5600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (187, 10318, 76, CAST(369.1600 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (188, 10319, 17, CAST(26.2300 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (189, 10319, 28, CAST(48.7700 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (190, 10319, 76, CAST(403.9700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (191, 10320, 71, CAST(31.4200 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (192, 10321, 35, CAST(5.4300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (193, 10322, 52, CAST(78.0200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (194, 10323, 15, CAST(6.1200 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (195, 10323, 25, CAST(14.3400 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (196, 10323, 39, CAST(61.2100 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (197, 10324, 16, CAST(8.7700 AS Numeric(18, 4)), 21, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (198, 10324, 35, CAST(5.6200 AS Numeric(18, 4)), 70, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (199, 10324, 46, CAST(12.1500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (200, 10324, 59, CAST(8.3100 AS Numeric(18, 4)), 40, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (201, 10324, 63, CAST(20.5900 AS Numeric(18, 4)), 80, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (202, 10325, 6, CAST(3.7100 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (203, 10325, 13, CAST(23.0900 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (204, 10325, 14, CAST(21.1400 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (205, 10325, 31, CAST(7.8000 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (206, 10325, 72, CAST(10.9600 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (207, 10326, 4, CAST(19.8400 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (208, 10326, 57, CAST(17.9400 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (209, 10326, 75, CAST(8.1200 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (210, 10327, 2, CAST(19.2200 AS Numeric(18, 4)), 25, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (211, 10327, 11, CAST(29.1000 AS Numeric(18, 4)), 50, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (212, 10327, 30, CAST(24.0200 AS Numeric(18, 4)), 35, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (213, 10327, 58, CAST(43.9700 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (214, 10328, 59, CAST(8.3900 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (215, 10328, 65, CAST(10.3600 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (216, 10328, 68, CAST(12.1300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (217, 10329, 19, CAST(8.5000 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (218, 10329, 30, CAST(24.6100 AS Numeric(18, 4)), 8, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (219, 10329, 38, CAST(77.3600 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (220, 10329, 56, CAST(40.1300 AS Numeric(18, 4)), 12, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (221, 10330, 26, CAST(32.7400 AS Numeric(18, 4)), 50, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (222, 10330, 72, CAST(10.8400 AS Numeric(18, 4)), 25, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (223, 10331, 54, CAST(37.9700 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (224, 10332, 18, CAST(24.8200 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (225, 10332, 42, CAST(15.1300 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (226, 10332, 47, CAST(24.5700 AS Numeric(18, 4)), 16, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (227, 10333, 14, CAST(24.8700 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (228, 10333, 21, CAST(10.5000 AS Numeric(18, 4)), 10, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (229, 10333, 71, CAST(31.0100 AS Numeric(18, 4)), 40, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (230, 10334, 52, CAST(72.7600 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (231, 10334, 68, CAST(12.7400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (232, 10335, 2, CAST(19.5100 AS Numeric(18, 4)), 7, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (233, 10335, 31, CAST(8.4800 AS Numeric(18, 4)), 25, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (234, 10335, 32, CAST(18.6400 AS Numeric(18, 4)), 6, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (235, 10335, 51, CAST(104.2900 AS Numeric(18, 4)), 48, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (236, 10336, 4, CAST(23.2300 AS Numeric(18, 4)), 18, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (237, 10337, 23, CAST(9.0000 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (238, 10337, 26, CAST(33.5500 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (239, 10337, 36, CAST(7.9900 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (240, 10337, 37, CAST(3.9000 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (241, 10337, 72, CAST(12.0300 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (242, 10338, 17, CAST(26.2400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (243, 10338, 30, CAST(25.4000 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (244, 10339, 4, CAST(21.3200 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (245, 10339, 17, CAST(24.4600 AS Numeric(18, 4)), 70, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (246, 10339, 62, CAST(30.6100 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (247, 10340, 18, CAST(24.3000 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (248, 10340, 41, CAST(9.1300 AS Numeric(18, 4)), 12, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (249, 10340, 43, CAST(11.9300 AS Numeric(18, 4)), 40, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (250, 10341, 33, CAST(26.4500 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (251, 10341, 59, CAST(8.2700 AS Numeric(18, 4)), 9, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (252, 10342, 2, CAST(19.6600 AS Numeric(18, 4)), 24, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (253, 10342, 31, CAST(8.7200 AS Numeric(18, 4)), 56, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (254, 10342, 36, CAST(7.5600 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (255, 10342, 55, CAST(37.5200 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (256, 10343, 64, CAST(33.9500 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (257, 10343, 68, CAST(11.5500 AS Numeric(18, 4)), 4, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (258, 10343, 76, CAST(390.8200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (259, 10344, 4, CAST(20.7800 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (260, 10344, 8, CAST(19.4000 AS Numeric(18, 4)), 70, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (261, 10345, 8, CAST(20.4600 AS Numeric(18, 4)), 70, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (262, 10345, 19, CAST(10.0800 AS Numeric(18, 4)), 80, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (263, 10345, 42, CAST(15.1900 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (264, 10346, 17, CAST(24.7100 AS Numeric(18, 4)), 36, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (265, 10346, 56, CAST(40.5100 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (266, 10347, 25, CAST(13.2100 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (267, 10347, 39, CAST(58.7200 AS Numeric(18, 4)), 50, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (268, 10347, 40, CAST(17.0000 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (269, 10347, 75, CAST(7.7500 AS Numeric(18, 4)), 6, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (270, 10348, 1, CAST(19.4100 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (271, 10348, 23, CAST(9.2300 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (272, 10349, 54, CAST(34.1800 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (273, 10350, 50, CAST(16.4900 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (274, 10350, 69, CAST(1.8300 AS Numeric(18, 4)), 18, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (275, 10351, 38, CAST(75.0400 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (276, 10351, 41, CAST(10.4200 AS Numeric(18, 4)), 13, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (277, 10351, 44, CAST(73.7400 AS Numeric(18, 4)), 77, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (278, 10351, 65, CAST(10.0800 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (279, 10352, 24, CAST(4.7300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (280, 10352, 54, CAST(37.9000 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (281, 10353, 11, CAST(29.7500 AS Numeric(18, 4)), 12, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (282, 10353, 38, CAST(75.4000 AS Numeric(18, 4)), 50, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (283, 10354, 1, CAST(21.6500 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (284, 10354, 29, CAST(130.3400 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (285, 10355, 24, CAST(4.6600 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (286, 10355, 57, CAST(17.7000 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (287, 10356, 31, CAST(9.2200 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (288, 10356, 55, CAST(40.6500 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (289, 10356, 69, CAST(2.0500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (290, 10357, 10, CAST(6.5100 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (291, 10357, 26, CAST(29.4400 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (292, 10357, 60, CAST(4.8600 AS Numeric(18, 4)), 8, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (293, 10358, 24, CAST(4.2400 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (294, 10358, 34, CAST(8.2600 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (295, 10358, 36, CAST(7.6100 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (296, 10359, 16, CAST(10.2400 AS Numeric(18, 4)), 56, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (297, 10359, 31, CAST(8.7000 AS Numeric(18, 4)), 70, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (298, 10359, 60, CAST(5.4600 AS Numeric(18, 4)), 80, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (299, 10360, 28, CAST(42.0700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (300, 10360, 29, CAST(135.7600 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (301, 10360, 38, CAST(80.7400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (302, 10360, 49, CAST(18.2900 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (303, 10360, 54, CAST(36.7300 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (304, 10361, 39, CAST(60.5400 AS Numeric(18, 4)), 54, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (305, 10361, 60, CAST(4.6700 AS Numeric(18, 4)), 55, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (306, 10362, 25, CAST(15.0400 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (307, 10362, 51, CAST(109.7900 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (308, 10362, 54, CAST(37.0700 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (309, 10363, 31, CAST(9.3000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (310, 10363, 75, CAST(8.0600 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (311, 10363, 76, CAST(432.5300 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (312, 10364, 69, CAST(2.0500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (313, 10364, 71, CAST(29.7300 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (314, 10365, 11, CAST(29.4800 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (315, 10366, 65, CAST(9.1200 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (316, 10366, 77, CAST(12.7100 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (317, 10367, 34, CAST(7.5600 AS Numeric(18, 4)), 36, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (318, 10367, 54, CAST(37.3700 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (319, 10367, 65, CAST(9.4100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (320, 10367, 77, CAST(14.2300 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (321, 10368, 21, CAST(10.5300 AS Numeric(18, 4)), 5, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (322, 10368, 28, CAST(47.4700 AS Numeric(18, 4)), 13, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (323, 10368, 57, CAST(18.0500 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (324, 10368, 64, CAST(32.3400 AS Numeric(18, 4)), 35, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (325, 10369, 29, CAST(117.7800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (326, 10369, 56, CAST(39.4200 AS Numeric(18, 4)), 18, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (327, 10370, 1, CAST(21.5600 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (328, 10370, 64, CAST(34.0200 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (329, 10370, 74, CAST(32.6400 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (330, 10371, 36, CAST(7.7700 AS Numeric(18, 4)), 6, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (331, 10372, 20, CAST(81.2400 AS Numeric(18, 4)), 12, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (332, 10372, 38, CAST(77.9400 AS Numeric(18, 4)), 40, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (333, 10372, 60, CAST(5.3000 AS Numeric(18, 4)), 70, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (334, 10372, 72, CAST(10.7500 AS Numeric(18, 4)), 42, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (335, 10373, 58, CAST(53.0700 AS Numeric(18, 4)), 80, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (336, 10373, 71, CAST(31.7900 AS Numeric(18, 4)), 50, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (337, 10374, 31, CAST(9.1100 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (338, 10374, 58, CAST(51.5700 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (339, 10375, 14, CAST(21.5900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (340, 10375, 54, CAST(32.9500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (341, 10376, 31, CAST(7.7400 AS Numeric(18, 4)), 42, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (342, 10377, 28, CAST(41.1800 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (343, 10377, 39, CAST(59.7800 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (344, 10378, 71, CAST(28.1900 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (345, 10379, 41, CAST(9.3300 AS Numeric(18, 4)), 8, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (346, 10379, 63, CAST(20.3500 AS Numeric(18, 4)), 16, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (347, 10379, 65, CAST(10.0000 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (348, 10380, 30, CAST(25.5100 AS Numeric(18, 4)), 18, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (349, 10380, 53, CAST(60.9600 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (350, 10380, 60, CAST(4.8000 AS Numeric(18, 4)), 6, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (351, 10380, 70, CAST(27.1500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (352, 10381, 74, CAST(30.5900 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (353, 10382, 5, CAST(5.6200 AS Numeric(18, 4)), 32, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (354, 10382, 18, CAST(26.7800 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (355, 10382, 29, CAST(129.3800 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (356, 10382, 33, CAST(27.4900 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (357, 10382, 74, CAST(27.2100 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (358, 10383, 13, CAST(26.1800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (359, 10383, 50, CAST(15.4300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (360, 10383, 56, CAST(41.3200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (361, 10384, 20, CAST(86.5100 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (362, 10384, 60, CAST(5.3200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (363, 10385, 7, CAST(36.1300 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (364, 10385, 60, CAST(4.9900 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (365, 10385, 68, CAST(13.6500 AS Numeric(18, 4)), 8, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (366, 10386, 24, CAST(4.1100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (367, 10386, 34, CAST(8.4800 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (368, 10387, 24, CAST(4.8500 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (369, 10387, 28, CAST(47.5100 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (370, 10387, 59, CAST(8.8700 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (371, 10387, 71, CAST(28.9900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (372, 10388, 45, CAST(8.7000 AS Numeric(18, 4)), 15, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (373, 10388, 52, CAST(82.6500 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (374, 10388, 53, CAST(62.7900 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (375, 10389, 10, CAST(6.3300 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (376, 10389, 55, CAST(37.4900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (377, 10389, 62, CAST(31.6800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (378, 10389, 70, CAST(27.9600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (379, 10390, 31, CAST(9.0300 AS Numeric(18, 4)), 60, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (380, 10390, 35, CAST(6.5600 AS Numeric(18, 4)), 40, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (381, 10390, 46, CAST(10.8300 AS Numeric(18, 4)), 45, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (382, 10390, 72, CAST(10.9400 AS Numeric(18, 4)), 24, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (383, 10391, 13, CAST(23.1200 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (384, 10392, 69, CAST(2.0900 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (385, 10393, 2, CAST(19.1700 AS Numeric(18, 4)), 25, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (386, 10393, 14, CAST(21.8300 AS Numeric(18, 4)), 42, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (387, 10393, 25, CAST(14.4200 AS Numeric(18, 4)), 7, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (388, 10393, 26, CAST(31.4200 AS Numeric(18, 4)), 70, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (389, 10393, 31, CAST(8.0500 AS Numeric(18, 4)), 32, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (390, 10394, 13, CAST(27.0400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (391, 10394, 62, CAST(26.6700 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (392, 10395, 46, CAST(11.6200 AS Numeric(18, 4)), 28, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (393, 10395, 53, CAST(66.3600 AS Numeric(18, 4)), 70, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (394, 10395, 69, CAST(1.8700 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (395, 10396, 23, CAST(8.6000 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (396, 10396, 71, CAST(29.6700 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (397, 10396, 72, CAST(10.9600 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (398, 10397, 21, CAST(10.7100 AS Numeric(18, 4)), 10, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (399, 10397, 51, CAST(100.9200 AS Numeric(18, 4)), 18, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (400, 10398, 35, CAST(5.4500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (401, 10398, 55, CAST(37.3900 AS Numeric(18, 4)), 120, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (402, 10399, 68, CAST(13.2400 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (403, 10399, 71, CAST(27.6600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (404, 10399, 76, CAST(381.9100 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (405, 10399, 77, CAST(12.0100 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (406, 10400, 29, CAST(121.6500 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (407, 10400, 35, CAST(5.8000 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (408, 10400, 49, CAST(21.5500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (409, 10401, 30, CAST(26.0700 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (410, 10401, 56, CAST(40.0600 AS Numeric(18, 4)), 70, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (411, 10401, 65, CAST(9.0600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (412, 10401, 71, CAST(30.3900 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (413, 10402, 23, CAST(9.0700 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (414, 10402, 63, CAST(18.9400 AS Numeric(18, 4)), 65, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (415, 10403, 16, CAST(10.1500 AS Numeric(18, 4)), 21, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (416, 10403, 48, CAST(31.8300 AS Numeric(18, 4)), 70, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (417, 10404, 26, CAST(33.9300 AS Numeric(18, 4)), 30, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (418, 10404, 42, CAST(13.3700 AS Numeric(18, 4)), 40, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (419, 10404, 49, CAST(19.8200 AS Numeric(18, 4)), 30, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (420, 10405, 3, CAST(18.4800 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (421, 10406, 1, CAST(19.7600 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (422, 10406, 21, CAST(10.5100 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (423, 10406, 28, CAST(47.3400 AS Numeric(18, 4)), 42, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (424, 10406, 36, CAST(7.8800 AS Numeric(18, 4)), 5, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (425, 10406, 40, CAST(18.9300 AS Numeric(18, 4)), 2, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (426, 10407, 11, CAST(25.5200 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (427, 10407, 69, CAST(2.1100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (428, 10407, 71, CAST(32.3300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (429, 10408, 37, CAST(3.9200 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (430, 10408, 54, CAST(34.0900 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (431, 10408, 62, CAST(31.1100 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (432, 10409, 14, CAST(24.5800 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (433, 10409, 21, CAST(10.9600 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (434, 10410, 33, CAST(25.9600 AS Numeric(18, 4)), 49, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (435, 10410, 59, CAST(9.3200 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (436, 10411, 41, CAST(9.2400 AS Numeric(18, 4)), 25, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (437, 10411, 44, CAST(68.7200 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (438, 10411, 59, CAST(9.1600 AS Numeric(18, 4)), 9, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (439, 10412, 14, CAST(25.4900 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (440, 10413, 1, CAST(21.0100 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (441, 10413, 62, CAST(30.3700 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (442, 10413, 76, CAST(414.9600 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (443, 10414, 19, CAST(8.8000 AS Numeric(18, 4)), 18, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (444, 10414, 33, CAST(25.8100 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (445, 10415, 17, CAST(22.6700 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (446, 10415, 33, CAST(25.8400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (447, 10416, 19, CAST(9.3800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (448, 10416, 53, CAST(55.3200 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (449, 10416, 57, CAST(18.7400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (450, 10417, 38, CAST(79.2100 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (451, 10417, 46, CAST(12.6200 AS Numeric(18, 4)), 2, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (452, 10417, 68, CAST(12.5600 AS Numeric(18, 4)), 36, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (453, 10417, 77, CAST(13.3000 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (454, 10418, 2, CAST(19.4100 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (455, 10418, 47, CAST(25.6500 AS Numeric(18, 4)), 55, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (456, 10418, 61, CAST(24.3000 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (457, 10418, 74, CAST(30.9100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (458, 10419, 60, CAST(4.5900 AS Numeric(18, 4)), 60, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (459, 10419, 69, CAST(1.8700 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (460, 10420, 9, CAST(36.6800 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (461, 10420, 13, CAST(26.8800 AS Numeric(18, 4)), 2, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (462, 10420, 70, CAST(31.3700 AS Numeric(18, 4)), 8, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (463, 10420, 73, CAST(1.0800 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (464, 10421, 19, CAST(9.1400 AS Numeric(18, 4)), 4, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (465, 10421, 26, CAST(31.8600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (466, 10421, 53, CAST(55.9000 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (467, 10421, 77, CAST(12.0300 AS Numeric(18, 4)), 10, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (468, 10422, 26, CAST(28.3300 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (469, 10423, 31, CAST(7.6900 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (470, 10423, 59, CAST(8.9200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (471, 10424, 35, CAST(5.5500 AS Numeric(18, 4)), 60, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (472, 10424, 38, CAST(86.2000 AS Numeric(18, 4)), 49, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (473, 10424, 68, CAST(12.5200 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (474, 10425, 55, CAST(36.0400 AS Numeric(18, 4)), 10, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (475, 10425, 76, CAST(361.4300 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (476, 10426, 56, CAST(36.2900 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (477, 10426, 64, CAST(33.3200 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (478, 10427, 14, CAST(24.3300 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (479, 10428, 46, CAST(12.0700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (480, 10429, 50, CAST(17.1500 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (481, 10429, 63, CAST(21.7500 AS Numeric(18, 4)), 35, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (482, 10430, 17, CAST(22.5400 AS Numeric(18, 4)), 45, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (483, 10430, 21, CAST(10.2600 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (484, 10430, 56, CAST(36.2500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (485, 10430, 59, CAST(8.5600 AS Numeric(18, 4)), 70, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (486, 10431, 17, CAST(25.3700 AS Numeric(18, 4)), 50, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (487, 10431, 40, CAST(17.9000 AS Numeric(18, 4)), 50, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (488, 10431, 47, CAST(26.9900 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (489, 10432, 26, CAST(30.0400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (490, 10432, 54, CAST(34.1200 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (491, 10433, 56, CAST(38.3100 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (492, 10434, 11, CAST(26.1300 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (493, 10434, 76, CAST(431.4900 AS Numeric(18, 4)), 18, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (494, 10435, 2, CAST(20.0500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (495, 10435, 22, CAST(3.7500 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (496, 10435, 72, CAST(12.6000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (497, 10436, 46, CAST(12.8500 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (498, 10436, 56, CAST(37.7600 AS Numeric(18, 4)), 40, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (499, 10436, 64, CAST(36.3400 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (500, 10436, 75, CAST(7.1800 AS Numeric(18, 4)), 24, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (501, 10437, 53, CAST(58.1700 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (502, 10438, 19, CAST(9.5200 AS Numeric(18, 4)), 15, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (503, 10438, 34, CAST(7.4800 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (504, 10438, 57, CAST(20.3000 AS Numeric(18, 4)), 15, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (505, 10439, 12, CAST(10.2200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (506, 10439, 16, CAST(9.9800 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (507, 10439, 64, CAST(35.0200 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (508, 10439, 74, CAST(32.8500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (509, 10440, 2, CAST(20.2200 AS Numeric(18, 4)), 45, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (510, 10440, 16, CAST(9.2400 AS Numeric(18, 4)), 49, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (511, 10440, 29, CAST(129.1500 AS Numeric(18, 4)), 24, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (512, 10440, 61, CAST(25.9500 AS Numeric(18, 4)), 90, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (513, 10441, 27, CAST(44.2500 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (514, 10442, 11, CAST(30.6400 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (515, 10442, 54, CAST(36.4200 AS Numeric(18, 4)), 80, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (516, 10442, 66, CAST(19.4800 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (517, 10443, 11, CAST(26.7100 AS Numeric(18, 4)), 6, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (518, 10443, 28, CAST(43.5200 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (519, 10444, 17, CAST(27.0000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (520, 10444, 26, CAST(30.9700 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (521, 10444, 35, CAST(5.7000 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (522, 10444, 41, CAST(9.1900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (523, 10445, 39, CAST(58.5700 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (524, 10445, 54, CAST(35.3200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (525, 10446, 19, CAST(9.2600 AS Numeric(18, 4)), 12, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (526, 10446, 24, CAST(4.2100 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (527, 10446, 31, CAST(8.2700 AS Numeric(18, 4)), 3, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (528, 10446, 52, CAST(76.7600 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (529, 10447, 19, CAST(8.5300 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (530, 10447, 65, CAST(10.4800 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (531, 10447, 71, CAST(28.5400 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (532, 10448, 26, CAST(32.5300 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (533, 10448, 40, CAST(18.6500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (534, 10449, 10, CAST(6.9900 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (535, 10449, 52, CAST(87.9800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (536, 10449, 62, CAST(29.8400 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (537, 10450, 10, CAST(7.6400 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (538, 10450, 54, CAST(35.2200 AS Numeric(18, 4)), 6, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (539, 10451, 55, CAST(40.0300 AS Numeric(18, 4)), 120, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (540, 10451, 64, CAST(35.9400 AS Numeric(18, 4)), 35, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (541, 10451, 65, CAST(10.6600 AS Numeric(18, 4)), 28, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (542, 10451, 77, CAST(12.5100 AS Numeric(18, 4)), 55, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (543, 10452, 28, CAST(49.0900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (544, 10452, 44, CAST(80.9100 AS Numeric(18, 4)), 100, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (545, 10453, 48, CAST(35.9000 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (546, 10453, 70, CAST(30.4300 AS Numeric(18, 4)), 25, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (547, 10454, 16, CAST(8.8800 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (548, 10454, 33, CAST(27.8700 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (549, 10454, 46, CAST(11.9700 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (550, 10455, 39, CAST(64.8900 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (551, 10455, 53, CAST(62.3100 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (552, 10455, 61, CAST(26.7500 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (553, 10455, 71, CAST(27.8500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (554, 10456, 21, CAST(9.1900 AS Numeric(18, 4)), 40, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (555, 10456, 49, CAST(20.0800 AS Numeric(18, 4)), 21, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (556, 10457, 59, CAST(7.8500 AS Numeric(18, 4)), 36, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (557, 10458, 26, CAST(28.2100 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (558, 10458, 28, CAST(48.1900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (559, 10458, 43, CAST(12.6400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (560, 10458, 56, CAST(40.3200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (561, 10458, 71, CAST(30.0400 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (562, 10459, 7, CAST(39.0400 AS Numeric(18, 4)), 16, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (563, 10459, 46, CAST(11.9800 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (564, 10459, 72, CAST(12.8100 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (565, 10460, 68, CAST(11.8300 AS Numeric(18, 4)), 21, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (566, 10460, 75, CAST(7.9200 AS Numeric(18, 4)), 4, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (567, 10461, 21, CAST(9.8600 AS Numeric(18, 4)), 40, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (568, 10461, 30, CAST(27.2900 AS Numeric(18, 4)), 28, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (569, 10461, 55, CAST(35.2400 AS Numeric(18, 4)), 60, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (570, 10462, 13, CAST(27.0900 AS Numeric(18, 4)), 1, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (571, 10462, 23, CAST(8.5000 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (572, 10463, 19, CAST(9.6700 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (573, 10463, 42, CAST(14.8600 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (574, 10464, 4, CAST(22.3900 AS Numeric(18, 4)), 16, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (575, 10464, 43, CAST(11.1800 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (576, 10464, 56, CAST(39.3700 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (577, 10464, 60, CAST(5.1800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (578, 10465, 24, CAST(4.4100 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (579, 10465, 29, CAST(133.6800 AS Numeric(18, 4)), 18, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (580, 10465, 40, CAST(19.3500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (581, 10465, 45, CAST(10.2900 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (582, 10465, 50, CAST(15.1300 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (583, 10466, 11, CAST(25.7300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (584, 10466, 46, CAST(11.8500 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (585, 10467, 24, CAST(4.6000 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (586, 10467, 25, CAST(13.4600 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (587, 10468, 30, CAST(23.5500 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (588, 10468, 43, CAST(11.5900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (589, 10469, 2, CAST(17.5600 AS Numeric(18, 4)), 40, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (590, 10469, 16, CAST(9.5600 AS Numeric(18, 4)), 35, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (591, 10469, 44, CAST(68.1800 AS Numeric(18, 4)), 2, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (592, 10470, 18, CAST(25.1900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (593, 10470, 23, CAST(8.9100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (594, 10470, 64, CAST(36.3900 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (595, 10471, 7, CAST(39.7400 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (596, 10471, 56, CAST(39.8200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (597, 10472, 24, CAST(4.1900 AS Numeric(18, 4)), 80, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (598, 10472, 51, CAST(90.6900 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (599, 10473, 33, CAST(26.5900 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (600, 10473, 71, CAST(32.6200 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (601, 10474, 14, CAST(24.6500 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (602, 10474, 28, CAST(43.8700 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (603, 10474, 40, CAST(17.8200 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (604, 10474, 75, CAST(7.6300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (605, 10475, 31, CAST(9.3100 AS Numeric(18, 4)), 35, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (606, 10475, 66, CAST(17.2400 AS Numeric(18, 4)), 60, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (607, 10475, 76, CAST(414.9500 AS Numeric(18, 4)), 42, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (608, 10476, 55, CAST(37.6400 AS Numeric(18, 4)), 2, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (609, 10476, 70, CAST(26.1400 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (610, 10477, 1, CAST(21.1100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (611, 10477, 21, CAST(9.0200 AS Numeric(18, 4)), 21, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (612, 10477, 39, CAST(57.1000 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (613, 10478, 10, CAST(6.6000 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (614, 10479, 38, CAST(83.0700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (615, 10479, 53, CAST(65.4700 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (616, 10479, 59, CAST(8.2200 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (617, 10479, 64, CAST(34.8300 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (618, 10480, 47, CAST(26.0100 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (619, 10480, 59, CAST(8.1400 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (620, 10481, 49, CAST(18.9500 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (621, 10481, 60, CAST(5.1200 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (622, 10482, 40, CAST(17.5900 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (623, 10483, 34, CAST(8.0000 AS Numeric(18, 4)), 35, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (624, 10483, 77, CAST(14.0700 AS Numeric(18, 4)), 30, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (625, 10484, 21, CAST(9.5800 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (626, 10484, 40, CAST(18.4000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (627, 10484, 51, CAST(90.9600 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (628, 10485, 2, CAST(17.4400 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (629, 10485, 3, CAST(21.6800 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (630, 10485, 55, CAST(35.2100 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (631, 10485, 70, CAST(26.8000 AS Numeric(18, 4)), 60, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (632, 10486, 11, CAST(28.3800 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (633, 10486, 51, CAST(96.8500 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (634, 10486, 74, CAST(27.4900 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (635, 10487, 19, CAST(9.6900 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (636, 10487, 26, CAST(33.4000 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (637, 10487, 54, CAST(33.6100 AS Numeric(18, 4)), 24, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (638, 10488, 59, CAST(8.8000 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (639, 10488, 73, CAST(1.2100 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (640, 10489, 11, CAST(28.2400 AS Numeric(18, 4)), 15, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (641, 10489, 16, CAST(8.8800 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (642, 10490, 59, CAST(8.6400 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (643, 10490, 68, CAST(13.2900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (644, 10490, 75, CAST(7.5000 AS Numeric(18, 4)), 36, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (645, 10491, 44, CAST(82.3400 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (646, 10491, 77, CAST(14.2000 AS Numeric(18, 4)), 7, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (647, 10492, 25, CAST(13.7800 AS Numeric(18, 4)), 60, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (648, 10492, 42, CAST(13.8200 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (649, 10493, 65, CAST(9.4900 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (650, 10493, 66, CAST(19.9300 AS Numeric(18, 4)), 10, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (651, 10493, 69, CAST(1.8700 AS Numeric(18, 4)), 10, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (652, 10494, 56, CAST(35.3700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (653, 10495, 23, CAST(8.3300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (654, 10495, 41, CAST(10.2200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (655, 10495, 77, CAST(13.1200 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (656, 10496, 31, CAST(8.1700 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (657, 10497, 56, CAST(41.3900 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (658, 10497, 72, CAST(11.1200 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (659, 10497, 77, CAST(12.1200 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (660, 10498, 24, CAST(4.9000 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (661, 10498, 40, CAST(18.0000 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (662, 10498, 42, CAST(15.1000 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (663, 10499, 28, CAST(43.6400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (664, 10499, 49, CAST(19.0600 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (665, 10500, 15, CAST(6.4300 AS Numeric(18, 4)), 12, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (666, 10500, 28, CAST(46.9200 AS Numeric(18, 4)), 8, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (667, 10501, 54, CAST(37.7900 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (668, 10502, 45, CAST(10.0000 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (669, 10502, 53, CAST(66.8300 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (670, 10502, 67, CAST(63.3200 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (671, 10503, 14, CAST(24.9100 AS Numeric(18, 4)), 70, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (672, 10503, 65, CAST(9.8700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (673, 10504, 2, CAST(20.5000 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (674, 10504, 21, CAST(10.7500 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (675, 10504, 53, CAST(62.3200 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (676, 10504, 61, CAST(26.0200 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (677, 10505, 62, CAST(31.3600 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (678, 10506, 25, CAST(14.7700 AS Numeric(18, 4)), 18, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (679, 10506, 70, CAST(30.7500 AS Numeric(18, 4)), 14, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (680, 10507, 43, CAST(11.4100 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (681, 10507, 48, CAST(31.9500 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (682, 10508, 13, CAST(24.0900 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (683, 10508, 39, CAST(64.0200 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (684, 10509, 28, CAST(49.9200 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (685, 10510, 29, CAST(132.3400 AS Numeric(18, 4)), 36, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (686, 10510, 75, CAST(7.8900 AS Numeric(18, 4)), 36, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (687, 10511, 4, CAST(23.8600 AS Numeric(18, 4)), 50, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (688, 10511, 7, CAST(42.4800 AS Numeric(18, 4)), 50, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (689, 10511, 8, CAST(21.9700 AS Numeric(18, 4)), 10, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (690, 10512, 24, CAST(4.6000 AS Numeric(18, 4)), 10, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (691, 10512, 46, CAST(12.5500 AS Numeric(18, 4)), 9, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (692, 10512, 47, CAST(26.6500 AS Numeric(18, 4)), 6, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (693, 10512, 60, CAST(5.2500 AS Numeric(18, 4)), 12, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (694, 10513, 21, CAST(9.9100 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (695, 10513, 32, CAST(17.9900 AS Numeric(18, 4)), 50, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (696, 10513, 61, CAST(25.5700 AS Numeric(18, 4)), 15, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (697, 10514, 20, CAST(88.0300 AS Numeric(18, 4)), 39, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (698, 10514, 28, CAST(46.2300 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (699, 10514, 56, CAST(38.2100 AS Numeric(18, 4)), 70, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (700, 10514, 65, CAST(11.0000 AS Numeric(18, 4)), 39, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (701, 10514, 75, CAST(7.3700 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (702, 10515, 9, CAST(42.0500 AS Numeric(18, 4)), 16, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (703, 10515, 16, CAST(8.6800 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (704, 10515, 27, CAST(41.7000 AS Numeric(18, 4)), 120, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (705, 10515, 33, CAST(28.0100 AS Numeric(18, 4)), 16, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (706, 10515, 60, CAST(5.3500 AS Numeric(18, 4)), 84, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (707, 10516, 18, CAST(27.2500 AS Numeric(18, 4)), 25, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (708, 10516, 41, CAST(10.5000 AS Numeric(18, 4)), 80, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (709, 10516, 42, CAST(14.5700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (710, 10517, 52, CAST(85.4900 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (711, 10517, 59, CAST(8.3000 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (712, 10517, 70, CAST(31.0900 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (713, 10518, 24, CAST(4.3300 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (714, 10518, 38, CAST(76.6900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (715, 10518, 44, CAST(76.8100 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (716, 10519, 10, CAST(7.5500 AS Numeric(18, 4)), 16, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (717, 10519, 56, CAST(40.7300 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (718, 10519, 60, CAST(5.1100 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (719, 10520, 24, CAST(4.6800 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (720, 10520, 53, CAST(56.9000 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (721, 10521, 35, CAST(6.2400 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (722, 10521, 41, CAST(9.6300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (723, 10521, 68, CAST(12.7800 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (724, 10522, 1, CAST(21.6300 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (725, 10522, 8, CAST(20.9300 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (726, 10522, 30, CAST(25.8800 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (727, 10522, 40, CAST(18.2500 AS Numeric(18, 4)), 25, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (728, 10523, 17, CAST(24.4500 AS Numeric(18, 4)), 25, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (729, 10523, 20, CAST(83.9400 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (730, 10523, 37, CAST(4.0300 AS Numeric(18, 4)), 18, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (731, 10523, 41, CAST(10.4000 AS Numeric(18, 4)), 6, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (732, 10524, 10, CAST(7.4900 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (733, 10524, 30, CAST(27.2500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (734, 10524, 43, CAST(13.0000 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (735, 10524, 54, CAST(34.2300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (736, 10525, 36, CAST(7.3100 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (737, 10525, 40, CAST(18.4600 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (738, 10526, 1, CAST(19.5300 AS Numeric(18, 4)), 8, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (739, 10526, 13, CAST(26.2400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (740, 10526, 56, CAST(41.6900 AS Numeric(18, 4)), 30, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (741, 10527, 4, CAST(23.5300 AS Numeric(18, 4)), 50, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (742, 10527, 36, CAST(8.4000 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (743, 10528, 11, CAST(29.3700 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (744, 10528, 33, CAST(27.2300 AS Numeric(18, 4)), 8, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (745, 10528, 72, CAST(10.6600 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (746, 10529, 55, CAST(36.9700 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (747, 10529, 68, CAST(13.7300 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (748, 10529, 69, CAST(2.0600 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (749, 10530, 17, CAST(24.2000 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (750, 10530, 43, CAST(10.9100 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (751, 10530, 61, CAST(27.7100 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (752, 10530, 76, CAST(391.1500 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (753, 10531, 59, CAST(7.9000 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (754, 10532, 30, CAST(24.6600 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (755, 10532, 66, CAST(18.7200 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (756, 10533, 4, CAST(20.2100 AS Numeric(18, 4)), 50, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (757, 10533, 72, CAST(11.0300 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (758, 10533, 73, CAST(1.0200 AS Numeric(18, 4)), 24, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (759, 10534, 30, CAST(26.3100 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (760, 10534, 40, CAST(18.4800 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (761, 10534, 54, CAST(36.9500 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (762, 10535, 11, CAST(28.3000 AS Numeric(18, 4)), 50, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (763, 10535, 40, CAST(19.4000 AS Numeric(18, 4)), 10, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (764, 10535, 57, CAST(20.3800 AS Numeric(18, 4)), 5, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (765, 10535, 59, CAST(7.6600 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (766, 10536, 12, CAST(9.7000 AS Numeric(18, 4)), 15, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (767, 10536, 31, CAST(8.9100 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (768, 10536, 33, CAST(23.0800 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (769, 10536, 60, CAST(4.8700 AS Numeric(18, 4)), 35, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (770, 10537, 31, CAST(8.0000 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (771, 10537, 51, CAST(92.1400 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (772, 10537, 58, CAST(52.1700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (773, 10537, 72, CAST(11.1200 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (774, 10537, 73, CAST(1.0400 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (775, 10538, 70, CAST(30.3600 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (776, 10538, 72, CAST(11.5800 AS Numeric(18, 4)), 1, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (777, 10539, 13, CAST(24.8900 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (778, 10539, 21, CAST(10.9100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (779, 10539, 33, CAST(27.6400 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (780, 10539, 49, CAST(20.9000 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (781, 10540, 3, CAST(19.1000 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (782, 10540, 26, CAST(34.2100 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (783, 10540, 38, CAST(84.2400 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (784, 10540, 68, CAST(13.0400 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (785, 10541, 24, CAST(4.2200 AS Numeric(18, 4)), 35, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (786, 10541, 38, CAST(77.4600 AS Numeric(18, 4)), 4, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (787, 10541, 65, CAST(9.2500 AS Numeric(18, 4)), 36, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (788, 10541, 71, CAST(27.7100 AS Numeric(18, 4)), 9, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (789, 10542, 11, CAST(28.2100 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (790, 10542, 54, CAST(32.6200 AS Numeric(18, 4)), 24, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (791, 10543, 12, CAST(10.4000 AS Numeric(18, 4)), 30, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (792, 10543, 23, CAST(9.6000 AS Numeric(18, 4)), 70, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (793, 10544, 28, CAST(43.4500 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (794, 10544, 67, CAST(64.8000 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (795, 10545, 11, CAST(26.3700 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (796, 10546, 7, CAST(43.4600 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (797, 10546, 35, CAST(6.0600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (798, 10546, 62, CAST(29.5100 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (799, 10547, 32, CAST(17.8400 AS Numeric(18, 4)), 24, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (800, 10547, 36, CAST(8.5800 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (801, 10548, 34, CAST(8.7300 AS Numeric(18, 4)), 10, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (802, 10548, 41, CAST(10.4800 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (803, 10549, 31, CAST(7.7000 AS Numeric(18, 4)), 55, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (804, 10549, 45, CAST(9.4300 AS Numeric(18, 4)), 100, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (805, 10549, 51, CAST(97.6600 AS Numeric(18, 4)), 48, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (806, 10550, 17, CAST(25.6400 AS Numeric(18, 4)), 8, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (807, 10550, 19, CAST(9.5200 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (808, 10550, 21, CAST(9.5000 AS Numeric(18, 4)), 6, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (809, 10550, 61, CAST(25.6500 AS Numeric(18, 4)), 10, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (810, 10551, 16, CAST(8.5100 AS Numeric(18, 4)), 40, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (811, 10551, 35, CAST(5.6600 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (812, 10551, 44, CAST(68.4900 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (813, 10552, 69, CAST(1.9200 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (814, 10552, 75, CAST(7.1600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (815, 10553, 11, CAST(30.2900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (816, 10553, 16, CAST(9.1300 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (817, 10553, 22, CAST(3.2800 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (818, 10553, 31, CAST(8.2700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (819, 10553, 35, CAST(6.2500 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (820, 10554, 16, CAST(9.8100 AS Numeric(18, 4)), 30, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (821, 10554, 23, CAST(9.4200 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (822, 10554, 62, CAST(26.8000 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (823, 10554, 77, CAST(13.6200 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (824, 10555, 14, CAST(21.4600 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (825, 10555, 19, CAST(8.5000 AS Numeric(18, 4)), 35, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (826, 10555, 24, CAST(4.1000 AS Numeric(18, 4)), 18, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (827, 10555, 51, CAST(101.7100 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (828, 10555, 56, CAST(39.9000 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (829, 10556, 72, CAST(11.7200 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (830, 10557, 64, CAST(36.1500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (831, 10557, 75, CAST(7.8800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (832, 10558, 47, CAST(24.7600 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (833, 10558, 51, CAST(91.4300 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (834, 10558, 52, CAST(85.1400 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (835, 10558, 53, CAST(56.3300 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (836, 10558, 73, CAST(0.9900 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (837, 10559, 41, CAST(8.7200 AS Numeric(18, 4)), 12, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (838, 10559, 55, CAST(38.9600 AS Numeric(18, 4)), 18, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (839, 10560, 30, CAST(25.6200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (840, 10560, 62, CAST(31.2000 AS Numeric(18, 4)), 15, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (841, 10561, 44, CAST(68.8900 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (842, 10561, 51, CAST(100.8500 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (843, 10562, 33, CAST(26.3200 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (844, 10562, 62, CAST(29.1200 AS Numeric(18, 4)), 10, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (845, 10563, 36, CAST(8.0800 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (846, 10563, 52, CAST(81.2700 AS Numeric(18, 4)), 70, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (847, 10564, 17, CAST(25.1400 AS Numeric(18, 4)), 16, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (848, 10564, 31, CAST(7.7000 AS Numeric(18, 4)), 6, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (849, 10564, 55, CAST(35.4500 AS Numeric(18, 4)), 25, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (850, 10565, 24, CAST(4.4300 AS Numeric(18, 4)), 25, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (851, 10565, 64, CAST(35.2400 AS Numeric(18, 4)), 18, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (852, 10566, 11, CAST(26.2000 AS Numeric(18, 4)), 35, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (853, 10566, 18, CAST(26.3600 AS Numeric(18, 4)), 18, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (854, 10566, 76, CAST(398.6300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (855, 10567, 31, CAST(8.6700 AS Numeric(18, 4)), 60, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (856, 10567, 51, CAST(108.0200 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (857, 10567, 59, CAST(8.0600 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (858, 10568, 10, CAST(6.4900 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (859, 10569, 31, CAST(8.5300 AS Numeric(18, 4)), 35, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (860, 10569, 76, CAST(374.3300 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (861, 10570, 11, CAST(30.7800 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (862, 10570, 56, CAST(40.1700 AS Numeric(18, 4)), 60, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (863, 10571, 14, CAST(21.9900 AS Numeric(18, 4)), 11, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (864, 10571, 42, CAST(13.5400 AS Numeric(18, 4)), 28, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (865, 10572, 16, CAST(9.9800 AS Numeric(18, 4)), 12, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (866, 10572, 32, CAST(20.3600 AS Numeric(18, 4)), 10, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (867, 10572, 40, CAST(19.4300 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (868, 10572, 75, CAST(8.3200 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (869, 10573, 17, CAST(24.3700 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (870, 10573, 34, CAST(7.3800 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (871, 10573, 53, CAST(65.6100 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (872, 10574, 33, CAST(27.6500 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (873, 10574, 40, CAST(19.2900 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (874, 10574, 62, CAST(30.0300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (875, 10574, 64, CAST(35.4800 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (876, 10575, 59, CAST(9.3400 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (877, 10575, 63, CAST(19.7100 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (878, 10575, 72, CAST(11.1700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (879, 10575, 76, CAST(406.0800 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (880, 10576, 1, CAST(21.9400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (881, 10576, 31, CAST(8.2500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (882, 10576, 44, CAST(76.7600 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (883, 10577, 39, CAST(62.7200 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (884, 10577, 75, CAST(8.3600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (885, 10577, 77, CAST(11.9500 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (886, 10578, 35, CAST(6.4700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (887, 10578, 57, CAST(19.6300 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (888, 10579, 15, CAST(7.0900 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (889, 10579, 75, CAST(7.8700 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (890, 10580, 14, CAST(23.0700 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (891, 10580, 41, CAST(9.7400 AS Numeric(18, 4)), 9, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (892, 10580, 65, CAST(9.2800 AS Numeric(18, 4)), 30, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (893, 10581, 75, CAST(7.7900 AS Numeric(18, 4)), 50, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (894, 10582, 57, CAST(17.6600 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (895, 10582, 76, CAST(394.5200 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (896, 10583, 29, CAST(115.7600 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (897, 10583, 60, CAST(5.1200 AS Numeric(18, 4)), 24, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (898, 10583, 69, CAST(1.9300 AS Numeric(18, 4)), 10, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (899, 10584, 31, CAST(9.1500 AS Numeric(18, 4)), 50, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (900, 10585, 47, CAST(25.0400 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (901, 10586, 52, CAST(81.6100 AS Numeric(18, 4)), 4, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (902, 10587, 26, CAST(33.2900 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (903, 10587, 35, CAST(6.4200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (904, 10587, 77, CAST(12.3200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (905, 10588, 18, CAST(26.3000 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (906, 10588, 42, CAST(13.9100 AS Numeric(18, 4)), 100, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (907, 10589, 35, CAST(6.0800 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (908, 10590, 1, CAST(20.1800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (909, 10590, 77, CAST(14.0600 AS Numeric(18, 4)), 60, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (910, 10591, 3, CAST(19.4800 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (911, 10591, 7, CAST(38.5600 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (912, 10591, 54, CAST(37.0200 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (913, 10592, 15, CAST(5.9200 AS Numeric(18, 4)), 25, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (914, 10592, 26, CAST(28.8600 AS Numeric(18, 4)), 5, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (915, 10593, 20, CAST(83.1900 AS Numeric(18, 4)), 21, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (916, 10593, 69, CAST(1.9600 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (917, 10593, 76, CAST(418.9500 AS Numeric(18, 4)), 4, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (918, 10594, 52, CAST(81.8400 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (919, 10594, 58, CAST(45.6300 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (920, 10595, 35, CAST(5.8600 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (921, 10595, 61, CAST(25.9800 AS Numeric(18, 4)), 120, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (922, 10595, 69, CAST(1.8000 AS Numeric(18, 4)), 65, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (923, 10596, 56, CAST(35.9100 AS Numeric(18, 4)), 5, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (924, 10596, 63, CAST(18.8600 AS Numeric(18, 4)), 24, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (925, 10596, 75, CAST(7.4700 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (926, 10597, 24, CAST(4.9200 AS Numeric(18, 4)), 35, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (927, 10597, 57, CAST(18.1800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (928, 10597, 65, CAST(9.4800 AS Numeric(18, 4)), 12, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (929, 10598, 27, CAST(41.4900 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (930, 10598, 71, CAST(28.4400 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (931, 10599, 62, CAST(30.5100 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (932, 10600, 54, CAST(35.3600 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (933, 10600, 73, CAST(1.1700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (934, 10601, 13, CAST(23.7000 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (935, 10601, 59, CAST(8.6600 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (936, 10602, 77, CAST(13.0900 AS Numeric(18, 4)), 5, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (937, 10603, 22, CAST(3.3300 AS Numeric(18, 4)), 48, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (938, 10603, 49, CAST(19.3300 AS Numeric(18, 4)), 25, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (939, 10604, 48, CAST(33.4100 AS Numeric(18, 4)), 6, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (940, 10604, 76, CAST(369.8400 AS Numeric(18, 4)), 10, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (941, 10605, 16, CAST(9.4600 AS Numeric(18, 4)), 30, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (942, 10605, 59, CAST(7.9500 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (943, 10605, 60, CAST(5.4400 AS Numeric(18, 4)), 70, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (944, 10605, 71, CAST(32.2900 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (945, 10606, 4, CAST(22.8600 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (946, 10606, 55, CAST(41.7700 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (947, 10606, 62, CAST(29.3100 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (948, 10607, 7, CAST(36.2100 AS Numeric(18, 4)), 45, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (949, 10607, 17, CAST(24.3600 AS Numeric(18, 4)), 100, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (950, 10607, 33, CAST(24.3000 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (951, 10607, 40, CAST(16.6700 AS Numeric(18, 4)), 42, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (952, 10607, 72, CAST(12.5500 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (953, 10608, 56, CAST(41.2600 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (954, 10609, 1, CAST(18.5000 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (955, 10609, 10, CAST(6.5700 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (956, 10609, 21, CAST(10.6900 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (957, 10610, 36, CAST(7.5800 AS Numeric(18, 4)), 21, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (958, 10611, 1, CAST(19.7500 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (959, 10611, 2, CAST(20.5500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (960, 10611, 60, CAST(5.2800 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (961, 10612, 10, CAST(7.1000 AS Numeric(18, 4)), 70, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (962, 10612, 36, CAST(7.2900 AS Numeric(18, 4)), 55, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (963, 10612, 49, CAST(18.0000 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (964, 10612, 60, CAST(4.5700 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (965, 10612, 76, CAST(400.9400 AS Numeric(18, 4)), 80, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (966, 10613, 13, CAST(27.4000 AS Numeric(18, 4)), 8, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (967, 10613, 75, CAST(8.5200 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (968, 10614, 11, CAST(26.1100 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (969, 10614, 21, CAST(10.9200 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (970, 10614, 39, CAST(59.6100 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (971, 10615, 55, CAST(41.8500 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (972, 10616, 38, CAST(75.6700 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (973, 10616, 56, CAST(40.1100 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (974, 10616, 70, CAST(26.4400 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (975, 10616, 71, CAST(30.2900 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (976, 10617, 59, CAST(8.7500 AS Numeric(18, 4)), 30, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (977, 10618, 6, CAST(3.8700 AS Numeric(18, 4)), 70, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (978, 10618, 56, CAST(41.6000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (979, 10618, 68, CAST(12.3300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (980, 10619, 21, CAST(9.1400 AS Numeric(18, 4)), 42, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (981, 10619, 22, CAST(3.2700 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (982, 10620, 24, CAST(4.4100 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (983, 10620, 52, CAST(83.0800 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (984, 10621, 19, CAST(9.8900 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (985, 10621, 23, CAST(9.6400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (986, 10621, 70, CAST(27.3400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (987, 10621, 71, CAST(32.4700 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (988, 10622, 2, CAST(17.7600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (989, 10622, 68, CAST(12.9300 AS Numeric(18, 4)), 18, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (990, 10623, 14, CAST(24.2100 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (991, 10623, 19, CAST(9.3500 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (992, 10623, 21, CAST(10.0500 AS Numeric(18, 4)), 25, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (993, 10623, 24, CAST(4.3700 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (994, 10623, 35, CAST(6.1300 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (995, 10624, 28, CAST(44.8600 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (996, 10624, 29, CAST(120.9500 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (997, 10624, 44, CAST(82.5400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (998, 10625, 14, CAST(24.2500 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (999, 10625, 42, CAST(14.9200 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1000, 10625, 60, CAST(4.8700 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1001, 10626, 53, CAST(63.4400 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1002, 10626, 60, CAST(4.9500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1003, 10626, 71, CAST(33.1600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1004, 10627, 62, CAST(30.7200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1005, 10627, 73, CAST(1.1800 AS Numeric(18, 4)), 35, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1006, 10628, 1, CAST(18.2300 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1007, 10629, 29, CAST(119.4900 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1008, 10629, 64, CAST(30.4500 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1009, 10630, 55, CAST(35.2800 AS Numeric(18, 4)), 12, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1010, 10630, 76, CAST(402.2300 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1011, 10631, 75, CAST(7.0300 AS Numeric(18, 4)), 8, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1012, 10632, 2, CAST(19.2700 AS Numeric(18, 4)), 30, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1013, 10632, 33, CAST(24.8800 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1014, 10633, 12, CAST(9.7400 AS Numeric(18, 4)), 36, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1015, 10633, 13, CAST(24.1600 AS Numeric(18, 4)), 13, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1016, 10633, 26, CAST(31.9100 AS Numeric(18, 4)), 35, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1017, 10633, 62, CAST(29.0000 AS Numeric(18, 4)), 80, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1018, 10634, 7, CAST(36.8700 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1019, 10634, 18, CAST(27.6300 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1020, 10634, 51, CAST(100.9900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1021, 10634, 75, CAST(7.5400 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1022, 10635, 4, CAST(23.9100 AS Numeric(18, 4)), 10, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1023, 10635, 5, CAST(5.7900 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1024, 10635, 22, CAST(3.2300 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1025, 10636, 4, CAST(20.6300 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1026, 10636, 58, CAST(47.6300 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1027, 10637, 11, CAST(26.7700 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1028, 10637, 50, CAST(15.8500 AS Numeric(18, 4)), 25, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1029, 10637, 56, CAST(36.7400 AS Numeric(18, 4)), 60, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1030, 10638, 45, CAST(8.8600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1031, 10638, 65, CAST(10.1400 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1032, 10638, 72, CAST(10.7700 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1033, 10639, 18, CAST(24.1700 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1034, 10640, 69, CAST(1.8400 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1035, 10640, 70, CAST(27.5200 AS Numeric(18, 4)), 15, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1036, 10641, 2, CAST(18.5800 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1037, 10641, 40, CAST(19.7900 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1038, 10642, 21, CAST(10.5900 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1039, 10642, 61, CAST(26.8300 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1040, 10643, 28, CAST(46.5600 AS Numeric(18, 4)), 15, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1041, 10643, 39, CAST(56.3200 AS Numeric(18, 4)), 21, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1042, 10643, 46, CAST(11.1500 AS Numeric(18, 4)), 2, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1043, 10644, 18, CAST(25.9600 AS Numeric(18, 4)), 4, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1044, 10644, 43, CAST(13.1000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1045, 10644, 46, CAST(13.0000 AS Numeric(18, 4)), 21, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1046, 10645, 18, CAST(26.2600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1047, 10645, 36, CAST(7.9300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1048, 10646, 1, CAST(19.4500 AS Numeric(18, 4)), 15, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1049, 10646, 10, CAST(6.3500 AS Numeric(18, 4)), 18, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1050, 10646, 71, CAST(30.0000 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1051, 10646, 77, CAST(13.1700 AS Numeric(18, 4)), 35, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1052, 10647, 19, CAST(9.0400 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1053, 10647, 39, CAST(63.2000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1054, 10648, 22, CAST(3.5100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1055, 10648, 24, CAST(4.8500 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1056, 10649, 28, CAST(47.4300 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1057, 10649, 72, CAST(12.1900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1058, 10650, 30, CAST(27.5100 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1059, 10650, 53, CAST(62.3000 AS Numeric(18, 4)), 25, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1060, 10650, 54, CAST(35.3500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1061, 10651, 19, CAST(9.1500 AS Numeric(18, 4)), 12, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1062, 10651, 22, CAST(3.5500 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1063, 10652, 30, CAST(26.2400 AS Numeric(18, 4)), 2, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1064, 10652, 42, CAST(13.3800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1065, 10653, 16, CAST(9.9700 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1066, 10653, 60, CAST(4.9500 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1067, 10654, 4, CAST(22.4700 AS Numeric(18, 4)), 12, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1068, 10654, 39, CAST(63.5400 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1069, 10654, 54, CAST(32.2500 AS Numeric(18, 4)), 6, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1070, 10655, 41, CAST(10.4700 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1071, 10656, 14, CAST(25.1300 AS Numeric(18, 4)), 3, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1072, 10656, 44, CAST(68.0200 AS Numeric(18, 4)), 28, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1073, 10656, 47, CAST(23.7300 AS Numeric(18, 4)), 6, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1074, 10657, 15, CAST(6.2700 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1075, 10657, 41, CAST(10.2100 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1076, 10657, 46, CAST(12.9800 AS Numeric(18, 4)), 45, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1077, 10657, 47, CAST(25.3200 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1078, 10657, 56, CAST(40.2100 AS Numeric(18, 4)), 45, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1079, 10657, 60, CAST(4.8200 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1080, 10658, 21, CAST(9.7000 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1081, 10658, 40, CAST(19.9000 AS Numeric(18, 4)), 70, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1082, 10658, 60, CAST(4.6000 AS Numeric(18, 4)), 55, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1083, 10658, 77, CAST(12.7600 AS Numeric(18, 4)), 70, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1084, 10659, 31, CAST(8.2400 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1085, 10659, 40, CAST(19.4500 AS Numeric(18, 4)), 24, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1086, 10659, 70, CAST(26.1600 AS Numeric(18, 4)), 40, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1087, 10660, 20, CAST(86.5500 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1088, 10661, 39, CAST(65.6300 AS Numeric(18, 4)), 3, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1089, 10661, 58, CAST(52.3000 AS Numeric(18, 4)), 49, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1090, 10662, 68, CAST(12.9100 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1091, 10663, 40, CAST(19.3400 AS Numeric(18, 4)), 30, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1092, 10663, 42, CAST(14.7600 AS Numeric(18, 4)), 30, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1093, 10663, 51, CAST(96.8300 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1094, 10664, 10, CAST(6.8500 AS Numeric(18, 4)), 24, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1095, 10664, 56, CAST(41.5600 AS Numeric(18, 4)), 12, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1096, 10664, 65, CAST(9.9500 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1097, 10665, 51, CAST(94.0300 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1098, 10665, 59, CAST(8.0300 AS Numeric(18, 4)), 1, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1099, 10665, 76, CAST(361.0500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1100, 10666, 29, CAST(130.8000 AS Numeric(18, 4)), 36, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1101, 10666, 65, CAST(11.0400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1102, 10667, 69, CAST(2.1600 AS Numeric(18, 4)), 45, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1103, 10667, 71, CAST(31.1100 AS Numeric(18, 4)), 14, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1104, 10668, 31, CAST(8.1700 AS Numeric(18, 4)), 8, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1105, 10668, 55, CAST(41.2000 AS Numeric(18, 4)), 4, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1106, 10668, 64, CAST(36.1700 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1107, 10669, 36, CAST(8.0600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1108, 10670, 23, CAST(8.5900 AS Numeric(18, 4)), 32, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1109, 10670, 46, CAST(12.4300 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1110, 10670, 67, CAST(58.7300 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1111, 10670, 73, CAST(1.1300 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1112, 10670, 75, CAST(7.3800 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1113, 10671, 16, CAST(10.1000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1114, 10671, 62, CAST(27.3500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1115, 10671, 65, CAST(10.1600 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1116, 10672, 38, CAST(82.9000 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1117, 10672, 71, CAST(32.4700 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1118, 10673, 16, CAST(9.6700 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1119, 10673, 42, CAST(13.5300 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1120, 10673, 43, CAST(12.3900 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1121, 10674, 23, CAST(9.7100 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1122, 10675, 14, CAST(21.7900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1123, 10675, 53, CAST(66.1800 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1124, 10675, 58, CAST(44.5900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1125, 10676, 10, CAST(6.4800 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1126, 10676, 19, CAST(9.6500 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1127, 10676, 44, CAST(74.5600 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1128, 10677, 26, CAST(33.5800 AS Numeric(18, 4)), 30, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1129, 10677, 33, CAST(26.5100 AS Numeric(18, 4)), 8, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1130, 10678, 12, CAST(9.6000 AS Numeric(18, 4)), 100, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1131, 10678, 33, CAST(25.2000 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1132, 10678, 41, CAST(10.1300 AS Numeric(18, 4)), 120, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1133, 10678, 54, CAST(35.8100 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1134, 10679, 59, CAST(8.5100 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1135, 10680, 16, CAST(8.5300 AS Numeric(18, 4)), 50, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1136, 10680, 31, CAST(7.8100 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1137, 10680, 42, CAST(13.8700 AS Numeric(18, 4)), 40, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1138, 10681, 19, CAST(9.6900 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1139, 10681, 21, CAST(9.2700 AS Numeric(18, 4)), 12, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1140, 10681, 64, CAST(32.1200 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1141, 10682, 33, CAST(25.4700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1142, 10682, 66, CAST(18.5400 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1143, 10682, 75, CAST(8.2500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1144, 10683, 52, CAST(76.4900 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1145, 10684, 40, CAST(18.2400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1146, 10684, 47, CAST(26.2900 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1147, 10684, 60, CAST(5.4900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1148, 10685, 10, CAST(7.5300 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1149, 10685, 41, CAST(9.2100 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1150, 10685, 47, CAST(25.0200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1151, 10686, 17, CAST(22.6000 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1152, 10686, 26, CAST(29.5500 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1153, 10687, 9, CAST(41.1700 AS Numeric(18, 4)), 50, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1154, 10687, 29, CAST(132.1200 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1155, 10687, 36, CAST(7.7400 AS Numeric(18, 4)), 6, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1156, 10688, 10, CAST(7.0800 AS Numeric(18, 4)), 18, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1157, 10688, 28, CAST(43.2800 AS Numeric(18, 4)), 60, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1158, 10688, 34, CAST(7.9900 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1159, 10689, 1, CAST(18.3800 AS Numeric(18, 4)), 35, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1160, 10690, 56, CAST(41.0500 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1161, 10690, 77, CAST(13.4000 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1162, 10691, 1, CAST(21.3000 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1163, 10691, 29, CAST(120.6200 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1164, 10691, 43, CAST(11.4400 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1165, 10691, 44, CAST(74.2100 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1166, 10691, 62, CAST(27.6300 AS Numeric(18, 4)), 48, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1167, 10692, 63, CAST(19.2500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1168, 10693, 9, CAST(35.3000 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1169, 10693, 54, CAST(37.0400 AS Numeric(18, 4)), 60, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1170, 10693, 69, CAST(2.1700 AS Numeric(18, 4)), 30, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1171, 10693, 73, CAST(1.1800 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1172, 10694, 7, CAST(37.3300 AS Numeric(18, 4)), 90, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1173, 10694, 59, CAST(8.1000 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1174, 10694, 70, CAST(27.0100 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1175, 10695, 8, CAST(18.2000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1176, 10695, 12, CAST(9.8200 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1177, 10695, 24, CAST(4.9200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1178, 10696, 17, CAST(25.4800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1179, 10696, 46, CAST(12.0200 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1180, 10697, 19, CAST(8.4200 AS Numeric(18, 4)), 7, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1181, 10697, 35, CAST(6.0100 AS Numeric(18, 4)), 9, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1182, 10697, 58, CAST(43.7800 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1183, 10697, 70, CAST(27.7500 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1184, 10698, 11, CAST(26.1700 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1185, 10698, 17, CAST(23.9700 AS Numeric(18, 4)), 8, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1186, 10698, 29, CAST(124.6700 AS Numeric(18, 4)), 12, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1187, 10698, 65, CAST(10.0800 AS Numeric(18, 4)), 65, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1188, 10698, 70, CAST(29.8700 AS Numeric(18, 4)), 8, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1189, 10699, 47, CAST(23.8800 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1190, 10700, 1, CAST(20.3100 AS Numeric(18, 4)), 5, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1191, 10700, 34, CAST(8.7400 AS Numeric(18, 4)), 12, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1192, 10700, 68, CAST(13.5300 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1193, 10700, 71, CAST(28.7200 AS Numeric(18, 4)), 60, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1194, 10701, 59, CAST(8.7100 AS Numeric(18, 4)), 42, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1195, 10701, 71, CAST(32.1600 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1196, 10701, 76, CAST(359.1600 AS Numeric(18, 4)), 35, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1197, 10702, 3, CAST(20.1600 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1198, 10702, 76, CAST(428.6900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1199, 10703, 2, CAST(18.5600 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1200, 10703, 59, CAST(8.8800 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1201, 10703, 73, CAST(1.0900 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1202, 10704, 4, CAST(24.1400 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1203, 10704, 24, CAST(4.5800 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1204, 10704, 48, CAST(29.6700 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1205, 10705, 31, CAST(9.1500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1206, 10705, 32, CAST(19.6800 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1207, 10706, 16, CAST(8.9600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1208, 10706, 43, CAST(11.7400 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1209, 10706, 59, CAST(8.5300 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1210, 10707, 55, CAST(41.8100 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1211, 10707, 57, CAST(19.1100 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1212, 10707, 70, CAST(29.6200 AS Numeric(18, 4)), 28, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1213, 10708, 5, CAST(5.4100 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1214, 10708, 36, CAST(8.3800 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1215, 10709, 8, CAST(20.3300 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1216, 10709, 51, CAST(91.4800 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1217, 10709, 60, CAST(4.9100 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1218, 10710, 19, CAST(8.4500 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1219, 10710, 47, CAST(26.3100 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1220, 10711, 19, CAST(8.7700 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1221, 10711, 41, CAST(9.3800 AS Numeric(18, 4)), 42, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1222, 10711, 53, CAST(62.9000 AS Numeric(18, 4)), 120, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1223, 10712, 53, CAST(58.9000 AS Numeric(18, 4)), 3, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1224, 10712, 56, CAST(35.6200 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1225, 10713, 10, CAST(6.4600 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1226, 10713, 26, CAST(31.3900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1227, 10713, 45, CAST(10.2700 AS Numeric(18, 4)), 110, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1228, 10713, 46, CAST(11.4100 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1229, 10714, 2, CAST(17.4200 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1230, 10714, 17, CAST(24.1900 AS Numeric(18, 4)), 27, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1231, 10714, 47, CAST(27.9500 AS Numeric(18, 4)), 50, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1232, 10714, 56, CAST(34.4800 AS Numeric(18, 4)), 18, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1233, 10714, 58, CAST(43.4600 AS Numeric(18, 4)), 12, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1234, 10715, 10, CAST(6.5600 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1235, 10715, 71, CAST(31.7900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1236, 10716, 21, CAST(9.7400 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1237, 10716, 51, CAST(104.3600 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1238, 10716, 61, CAST(25.5700 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1239, 10717, 21, CAST(10.1100 AS Numeric(18, 4)), 32, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1240, 10717, 54, CAST(34.9100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1241, 10717, 69, CAST(1.9100 AS Numeric(18, 4)), 25, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1242, 10718, 12, CAST(10.1100 AS Numeric(18, 4)), 36, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1243, 10718, 16, CAST(9.0700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1244, 10718, 36, CAST(7.8500 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1245, 10718, 62, CAST(30.1600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1246, 10719, 18, CAST(27.2300 AS Numeric(18, 4)), 12, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1247, 10719, 30, CAST(26.8400 AS Numeric(18, 4)), 3, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1248, 10719, 54, CAST(34.2500 AS Numeric(18, 4)), 40, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1249, 10720, 35, CAST(6.5800 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1250, 10720, 71, CAST(29.7800 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1251, 10721, 44, CAST(75.5700 AS Numeric(18, 4)), 50, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1252, 10722, 2, CAST(19.4700 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1253, 10722, 31, CAST(7.8500 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1254, 10722, 68, CAST(11.7300 AS Numeric(18, 4)), 45, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1255, 10722, 75, CAST(7.3600 AS Numeric(18, 4)), 42, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1256, 10723, 26, CAST(32.0500 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1257, 10724, 10, CAST(7.6900 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1258, 10724, 61, CAST(26.8200 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1259, 10725, 41, CAST(10.2800 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1260, 10725, 52, CAST(72.7100 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1261, 10725, 55, CAST(41.6000 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1262, 10726, 4, CAST(22.6200 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1263, 10726, 11, CAST(29.3900 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1264, 10727, 17, CAST(27.4800 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1265, 10727, 56, CAST(41.4700 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1266, 10727, 59, CAST(8.2500 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1267, 10728, 30, CAST(23.7500 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1268, 10728, 40, CAST(17.8200 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1269, 10728, 55, CAST(37.5700 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1270, 10728, 60, CAST(5.3300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1271, 10729, 1, CAST(20.5200 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1272, 10729, 21, CAST(9.4900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1273, 10729, 50, CAST(16.5100 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1274, 10730, 16, CAST(8.7500 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1275, 10730, 31, CAST(8.7200 AS Numeric(18, 4)), 3, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1276, 10730, 65, CAST(9.0600 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1277, 10731, 21, CAST(9.8100 AS Numeric(18, 4)), 40, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1278, 10731, 51, CAST(93.9600 AS Numeric(18, 4)), 30, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1279, 10732, 76, CAST(412.5000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1280, 10733, 14, CAST(21.7700 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1281, 10733, 28, CAST(49.9400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1282, 10733, 52, CAST(85.9000 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1283, 10734, 6, CAST(4.0300 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1284, 10734, 30, CAST(23.4200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1285, 10734, 76, CAST(412.6200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1286, 10735, 61, CAST(25.9300 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1287, 10735, 77, CAST(12.5500 AS Numeric(18, 4)), 2, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1288, 10736, 65, CAST(9.3500 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1289, 10736, 75, CAST(7.5500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1290, 10737, 13, CAST(25.5600 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1291, 10737, 41, CAST(10.1200 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1292, 10738, 16, CAST(8.6600 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1293, 10739, 36, CAST(7.4600 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1294, 10739, 52, CAST(79.5400 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1295, 10740, 28, CAST(42.1100 AS Numeric(18, 4)), 5, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1296, 10740, 35, CAST(6.0000 AS Numeric(18, 4)), 35, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1297, 10740, 45, CAST(9.3300 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1298, 10740, 56, CAST(39.6400 AS Numeric(18, 4)), 14, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1299, 10741, 2, CAST(18.0300 AS Numeric(18, 4)), 15, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1300, 10742, 3, CAST(19.7000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1301, 10742, 60, CAST(5.3500 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1302, 10742, 72, CAST(11.2500 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1303, 10743, 46, CAST(13.0300 AS Numeric(18, 4)), 28, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1304, 10744, 40, CAST(19.7900 AS Numeric(18, 4)), 50, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1305, 10745, 18, CAST(27.4600 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1306, 10745, 44, CAST(71.6300 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1307, 10745, 59, CAST(8.6900 AS Numeric(18, 4)), 45, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1308, 10745, 72, CAST(12.1600 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1309, 10746, 13, CAST(24.0800 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1310, 10746, 42, CAST(14.8700 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1311, 10746, 62, CAST(28.4800 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1312, 10746, 69, CAST(2.0700 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1313, 10747, 31, CAST(8.2400 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1314, 10747, 41, CAST(9.0500 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1315, 10747, 63, CAST(20.5000 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1316, 10747, 69, CAST(2.1300 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1317, 10748, 23, CAST(9.5400 AS Numeric(18, 4)), 44, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1318, 10748, 40, CAST(18.0100 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1319, 10748, 56, CAST(36.9600 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1320, 10749, 56, CAST(40.8100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1321, 10749, 59, CAST(8.8000 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1322, 10749, 76, CAST(419.2300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1323, 10750, 14, CAST(21.7700 AS Numeric(18, 4)), 5, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1324, 10750, 45, CAST(8.8200 AS Numeric(18, 4)), 40, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1325, 10750, 59, CAST(9.0500 AS Numeric(18, 4)), 25, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1326, 10751, 26, CAST(30.4700 AS Numeric(18, 4)), 12, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1327, 10751, 30, CAST(23.6100 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1328, 10751, 50, CAST(15.0200 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1329, 10751, 73, CAST(1.0400 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1330, 10752, 1, CAST(18.0200 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1331, 10752, 69, CAST(2.1900 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1332, 10753, 45, CAST(8.9700 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1333, 10753, 74, CAST(32.7600 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1334, 10754, 40, CAST(17.2100 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1335, 10755, 47, CAST(27.8600 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1336, 10755, 56, CAST(41.5600 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1337, 10755, 57, CAST(20.5200 AS Numeric(18, 4)), 14, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1338, 10755, 69, CAST(1.9900 AS Numeric(18, 4)), 25, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1339, 10756, 18, CAST(25.5400 AS Numeric(18, 4)), 21, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1340, 10756, 36, CAST(7.4100 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1341, 10756, 68, CAST(11.6000 AS Numeric(18, 4)), 6, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1342, 10756, 69, CAST(2.1500 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1343, 10757, 34, CAST(7.7500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1344, 10757, 59, CAST(7.8200 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1345, 10757, 62, CAST(27.9600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1346, 10757, 64, CAST(35.3500 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1347, 10758, 26, CAST(28.8700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1348, 10758, 52, CAST(76.3200 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1349, 10758, 70, CAST(30.7500 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1350, 10759, 32, CAST(19.8500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1351, 10760, 25, CAST(12.8000 AS Numeric(18, 4)), 12, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1352, 10760, 27, CAST(39.8000 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1353, 10760, 43, CAST(12.3800 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1354, 10761, 25, CAST(14.2300 AS Numeric(18, 4)), 35, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1355, 10761, 75, CAST(7.6100 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1356, 10762, 39, CAST(54.7000 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1357, 10762, 47, CAST(23.4500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1358, 10762, 51, CAST(97.9500 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1359, 10762, 56, CAST(36.4600 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1360, 10763, 21, CAST(10.5900 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1361, 10763, 22, CAST(3.6600 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1362, 10763, 24, CAST(4.3700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1363, 10764, 3, CAST(20.0000 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1364, 10764, 39, CAST(54.5300 AS Numeric(18, 4)), 130, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1365, 10765, 65, CAST(9.5700 AS Numeric(18, 4)), 80, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1366, 10766, 2, CAST(19.7000 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1367, 10766, 7, CAST(37.6800 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1368, 10766, 68, CAST(11.6100 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1369, 10767, 42, CAST(13.3500 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1370, 10768, 22, CAST(3.4200 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1371, 10768, 31, CAST(8.4600 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1372, 10768, 60, CAST(4.5900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1373, 10768, 71, CAST(31.7600 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1374, 10769, 41, CAST(8.9900 AS Numeric(18, 4)), 30, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1375, 10769, 52, CAST(81.5500 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1376, 10769, 61, CAST(27.1100 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1377, 10769, 62, CAST(30.8300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1378, 10770, 11, CAST(25.4000 AS Numeric(18, 4)), 15, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1379, 10771, 71, CAST(30.4300 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1380, 10772, 29, CAST(122.5800 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1381, 10772, 59, CAST(8.3400 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1382, 10773, 17, CAST(25.9400 AS Numeric(18, 4)), 33, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1383, 10773, 31, CAST(9.0700 AS Numeric(18, 4)), 70, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1384, 10773, 75, CAST(7.3600 AS Numeric(18, 4)), 7, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1385, 10774, 31, CAST(7.8800 AS Numeric(18, 4)), 2, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1386, 10774, 66, CAST(18.4600 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1387, 10775, 10, CAST(6.4700 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1388, 10775, 67, CAST(57.0100 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1389, 10776, 31, CAST(7.9500 AS Numeric(18, 4)), 16, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1390, 10776, 42, CAST(14.8200 AS Numeric(18, 4)), 12, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1391, 10776, 45, CAST(9.1100 AS Numeric(18, 4)), 27, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1392, 10776, 51, CAST(92.5800 AS Numeric(18, 4)), 120, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1393, 10777, 42, CAST(15.0400 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1394, 10778, 41, CAST(9.0600 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1395, 10779, 16, CAST(9.6000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1396, 10779, 62, CAST(30.2300 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1397, 10780, 70, CAST(28.7400 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1398, 10780, 77, CAST(12.4300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1399, 10781, 54, CAST(37.8300 AS Numeric(18, 4)), 3, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1400, 10781, 56, CAST(40.7100 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1401, 10781, 74, CAST(29.8200 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1402, 10782, 31, CAST(8.1900 AS Numeric(18, 4)), 1, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1403, 10783, 31, CAST(8.1600 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1404, 10783, 38, CAST(74.4500 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1405, 10784, 36, CAST(7.9400 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1406, 10784, 39, CAST(61.3200 AS Numeric(18, 4)), 2, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1407, 10784, 72, CAST(11.2300 AS Numeric(18, 4)), 30, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1408, 10785, 10, CAST(6.4200 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1409, 10785, 75, CAST(8.0400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1410, 10786, 8, CAST(18.4000 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1411, 10786, 30, CAST(27.9700 AS Numeric(18, 4)), 15, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1412, 10786, 75, CAST(7.0000 AS Numeric(18, 4)), 42, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1413, 10787, 2, CAST(19.1300 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1414, 10787, 29, CAST(125.8100 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1415, 10788, 19, CAST(9.5100 AS Numeric(18, 4)), 50, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1416, 10788, 75, CAST(8.3700 AS Numeric(18, 4)), 40, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1417, 10789, 18, CAST(23.2000 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1418, 10789, 35, CAST(5.8600 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1419, 10789, 63, CAST(19.0700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1420, 10789, 68, CAST(12.4900 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1421, 10790, 7, CAST(38.9000 AS Numeric(18, 4)), 3, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1422, 10790, 56, CAST(36.4400 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1423, 10791, 29, CAST(115.1400 AS Numeric(18, 4)), 14, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1424, 10791, 41, CAST(9.6300 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1425, 10792, 2, CAST(19.1700 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1426, 10792, 54, CAST(37.9000 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1427, 10792, 68, CAST(12.6600 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1428, 10793, 41, CAST(8.9900 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1429, 10793, 52, CAST(84.4900 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1430, 10794, 14, CAST(24.0000 AS Numeric(18, 4)), 15, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1431, 10794, 54, CAST(33.2500 AS Numeric(18, 4)), 6, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1432, 10795, 16, CAST(10.2800 AS Numeric(18, 4)), 65, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1433, 10795, 17, CAST(23.5400 AS Numeric(18, 4)), 35, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1434, 10796, 26, CAST(28.1900 AS Numeric(18, 4)), 21, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1435, 10796, 44, CAST(71.3900 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1436, 10796, 64, CAST(36.2900 AS Numeric(18, 4)), 35, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1437, 10796, 69, CAST(2.1100 AS Numeric(18, 4)), 24, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1438, 10797, 11, CAST(29.2100 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1439, 10798, 62, CAST(28.2600 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1440, 10798, 72, CAST(11.8000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1441, 10799, 13, CAST(23.1700 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1442, 10799, 24, CAST(4.5700 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1443, 10799, 59, CAST(9.0900 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1444, 10800, 11, CAST(29.1000 AS Numeric(18, 4)), 50, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1445, 10800, 51, CAST(100.3800 AS Numeric(18, 4)), 10, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1446, 10800, 54, CAST(32.3500 AS Numeric(18, 4)), 7, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1447, 10801, 17, CAST(24.9400 AS Numeric(18, 4)), 40, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1448, 10801, 29, CAST(131.9400 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1449, 10802, 30, CAST(25.9900 AS Numeric(18, 4)), 25, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1450, 10802, 51, CAST(107.5100 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1451, 10802, 55, CAST(38.3000 AS Numeric(18, 4)), 60, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1452, 10802, 62, CAST(28.0500 AS Numeric(18, 4)), 5, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1453, 10803, 19, CAST(9.2800 AS Numeric(18, 4)), 24, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1454, 10803, 25, CAST(14.1700 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1455, 10803, 59, CAST(8.2600 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1456, 10804, 10, CAST(7.1000 AS Numeric(18, 4)), 36, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1457, 10804, 28, CAST(45.4300 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1458, 10804, 49, CAST(18.8500 AS Numeric(18, 4)), 4, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1459, 10805, 34, CAST(7.7000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1460, 10805, 38, CAST(84.8900 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1461, 10806, 2, CAST(19.0600 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1462, 10806, 65, CAST(9.4700 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1463, 10806, 74, CAST(28.8300 AS Numeric(18, 4)), 15, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1464, 10807, 40, CAST(20.1100 AS Numeric(18, 4)), 1, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1465, 10808, 56, CAST(38.8800 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1466, 10808, 76, CAST(366.5600 AS Numeric(18, 4)), 50, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1467, 10809, 52, CAST(72.7400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1468, 10810, 13, CAST(24.7600 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1469, 10810, 25, CAST(13.4300 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1470, 10810, 70, CAST(26.4900 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1471, 10811, 19, CAST(9.4600 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1472, 10811, 23, CAST(9.9000 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1473, 10811, 40, CAST(17.4600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1474, 10812, 31, CAST(8.8500 AS Numeric(18, 4)), 16, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1475, 10812, 72, CAST(12.5300 AS Numeric(18, 4)), 40, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1476, 10812, 77, CAST(13.7600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1477, 10813, 2, CAST(17.4500 AS Numeric(18, 4)), 12, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1478, 10813, 46, CAST(11.9900 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1479, 10814, 41, CAST(8.8800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1480, 10814, 43, CAST(12.3200 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1481, 10814, 48, CAST(33.1000 AS Numeric(18, 4)), 8, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1482, 10814, 61, CAST(27.1500 AS Numeric(18, 4)), 30, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1483, 10815, 33, CAST(27.9600 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1484, 10816, 38, CAST(88.0700 AS Numeric(18, 4)), 30, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1485, 10816, 62, CAST(29.6400 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1486, 10817, 26, CAST(29.9600 AS Numeric(18, 4)), 40, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1487, 10817, 38, CAST(81.7300 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1488, 10817, 40, CAST(18.0800 AS Numeric(18, 4)), 60, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1489, 10817, 62, CAST(27.0500 AS Numeric(18, 4)), 25, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1490, 10818, 32, CAST(20.5200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1491, 10818, 41, CAST(10.3000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1492, 10819, 43, CAST(11.3700 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1493, 10819, 75, CAST(7.2800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1494, 10820, 56, CAST(40.0200 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1495, 10821, 35, CAST(5.8500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1496, 10821, 51, CAST(105.1500 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1497, 10822, 62, CAST(29.4300 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1498, 10822, 70, CAST(30.1300 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1499, 10823, 11, CAST(30.3100 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1500, 10823, 57, CAST(20.8200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1501, 10823, 59, CAST(8.9100 AS Numeric(18, 4)), 40, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1502, 10823, 77, CAST(13.1100 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1503, 10824, 41, CAST(8.7000 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1504, 10824, 70, CAST(30.9900 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1505, 10825, 26, CAST(28.5500 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1506, 10825, 53, CAST(66.4400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1507, 10826, 31, CAST(8.8600 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1508, 10826, 57, CAST(18.7300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1509, 10827, 10, CAST(6.6200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1510, 10827, 39, CAST(54.3800 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1511, 10828, 20, CAST(81.8700 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1512, 10828, 38, CAST(75.4800 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1513, 10829, 2, CAST(20.1100 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1514, 10829, 8, CAST(19.7700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1515, 10829, 13, CAST(26.4300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1516, 10829, 60, CAST(5.3800 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1517, 10830, 6, CAST(3.9700 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1518, 10830, 39, CAST(54.3700 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1519, 10830, 60, CAST(5.3100 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1520, 10830, 68, CAST(13.1700 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1521, 10831, 19, CAST(10.0900 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1522, 10831, 35, CAST(5.6400 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1523, 10831, 38, CAST(85.8500 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1524, 10831, 43, CAST(12.6600 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1525, 10832, 13, CAST(25.6000 AS Numeric(18, 4)), 3, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1526, 10832, 25, CAST(13.8000 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1527, 10832, 44, CAST(68.1400 AS Numeric(18, 4)), 16, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1528, 10832, 64, CAST(33.0600 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1529, 10833, 7, CAST(40.5800 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1530, 10833, 31, CAST(8.8300 AS Numeric(18, 4)), 9, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1531, 10833, 53, CAST(60.6700 AS Numeric(18, 4)), 9, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1532, 10834, 29, CAST(133.8200 AS Numeric(18, 4)), 8, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1533, 10834, 30, CAST(24.3700 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1534, 10835, 59, CAST(8.0400 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1535, 10835, 77, CAST(12.3000 AS Numeric(18, 4)), 2, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1536, 10836, 22, CAST(3.5400 AS Numeric(18, 4)), 52, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1537, 10836, 35, CAST(6.3800 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1538, 10836, 57, CAST(19.2700 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1539, 10836, 60, CAST(4.6600 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1540, 10836, 64, CAST(31.6300 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1541, 10837, 13, CAST(24.6800 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1542, 10837, 40, CAST(18.0100 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1543, 10837, 47, CAST(27.1200 AS Numeric(18, 4)), 40, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1544, 10837, 76, CAST(386.3200 AS Numeric(18, 4)), 21, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1545, 10838, 1, CAST(20.5200 AS Numeric(18, 4)), 4, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1546, 10838, 18, CAST(28.0000 AS Numeric(18, 4)), 25, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1547, 10838, 36, CAST(7.6300 AS Numeric(18, 4)), 50, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1548, 10839, 58, CAST(48.2900 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1549, 10839, 72, CAST(12.3600 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1550, 10840, 25, CAST(15.3900 AS Numeric(18, 4)), 6, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1551, 10840, 39, CAST(54.2100 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1552, 10841, 10, CAST(6.3300 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1553, 10841, 56, CAST(41.5300 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1554, 10841, 59, CAST(8.6300 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1555, 10841, 77, CAST(13.4000 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1556, 10842, 11, CAST(25.4300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1557, 10842, 43, CAST(11.0900 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1558, 10842, 68, CAST(13.2700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1559, 10842, 70, CAST(26.8200 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1560, 10843, 51, CAST(94.7200 AS Numeric(18, 4)), 4, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1561, 10844, 22, CAST(3.5900 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1562, 10845, 23, CAST(9.3700 AS Numeric(18, 4)), 70, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1563, 10845, 35, CAST(6.4900 AS Numeric(18, 4)), 25, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1564, 10845, 42, CAST(13.4500 AS Numeric(18, 4)), 42, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1565, 10845, 58, CAST(50.2400 AS Numeric(18, 4)), 60, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1566, 10845, 64, CAST(34.4600 AS Numeric(18, 4)), 48, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1567, 10846, 4, CAST(22.5800 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1568, 10846, 70, CAST(30.7500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1569, 10846, 74, CAST(31.0900 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1570, 10847, 1, CAST(18.1900 AS Numeric(18, 4)), 80, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1571, 10847, 19, CAST(9.7800 AS Numeric(18, 4)), 12, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1572, 10847, 37, CAST(3.9600 AS Numeric(18, 4)), 60, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1573, 10847, 45, CAST(8.7500 AS Numeric(18, 4)), 36, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1574, 10847, 60, CAST(5.1700 AS Numeric(18, 4)), 45, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1575, 10847, 71, CAST(29.3500 AS Numeric(18, 4)), 55, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1576, 10848, 5, CAST(6.1600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1577, 10848, 9, CAST(40.3200 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1578, 10849, 3, CAST(19.7500 AS Numeric(18, 4)), 49, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1579, 10849, 26, CAST(33.5000 AS Numeric(18, 4)), 18, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1580, 10850, 25, CAST(13.8400 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1581, 10850, 33, CAST(26.3400 AS Numeric(18, 4)), 4, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1582, 10850, 70, CAST(26.8900 AS Numeric(18, 4)), 30, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1583, 10851, 2, CAST(17.7000 AS Numeric(18, 4)), 5, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1584, 10851, 25, CAST(13.1700 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1585, 10851, 57, CAST(19.0900 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1586, 10851, 59, CAST(8.8500 AS Numeric(18, 4)), 42, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1587, 10852, 2, CAST(19.5700 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1588, 10852, 17, CAST(23.2400 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1589, 10852, 62, CAST(31.4400 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1590, 10853, 18, CAST(25.5200 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1591, 10854, 10, CAST(6.3000 AS Numeric(18, 4)), 100, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1592, 10854, 13, CAST(27.3800 AS Numeric(18, 4)), 65, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1593, 10855, 16, CAST(9.1800 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1594, 10855, 31, CAST(8.5200 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1595, 10855, 56, CAST(37.9500 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1596, 10855, 65, CAST(9.5200 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1597, 10856, 2, CAST(19.5400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1598, 10856, 42, CAST(13.4000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1599, 10857, 3, CAST(19.5900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1600, 10857, 26, CAST(29.5800 AS Numeric(18, 4)), 35, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1601, 10857, 29, CAST(121.7000 AS Numeric(18, 4)), 10, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1602, 10858, 7, CAST(42.8600 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1603, 10858, 27, CAST(43.3500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1604, 10858, 70, CAST(30.5600 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1605, 10859, 24, CAST(4.5100 AS Numeric(18, 4)), 40, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1606, 10859, 54, CAST(35.8600 AS Numeric(18, 4)), 35, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1607, 10859, 64, CAST(35.0000 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1608, 10860, 51, CAST(108.4700 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1609, 10860, 76, CAST(364.4400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1610, 10861, 17, CAST(25.3900 AS Numeric(18, 4)), 42, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1611, 10861, 18, CAST(23.8300 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1612, 10861, 21, CAST(9.1900 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1613, 10861, 33, CAST(26.3100 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1614, 10861, 62, CAST(29.3500 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1615, 10862, 11, CAST(27.3400 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1616, 10862, 52, CAST(85.4400 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1617, 10863, 1, CAST(20.7000 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1618, 10863, 58, CAST(44.7300 AS Numeric(18, 4)), 12, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1619, 10864, 35, CAST(6.3200 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1620, 10864, 67, CAST(64.8100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1621, 10865, 38, CAST(81.1400 AS Numeric(18, 4)), 60, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1622, 10865, 39, CAST(62.9400 AS Numeric(18, 4)), 80, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1623, 10866, 2, CAST(17.6500 AS Numeric(18, 4)), 21, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1624, 10866, 24, CAST(4.6900 AS Numeric(18, 4)), 6, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1625, 10866, 30, CAST(24.0900 AS Numeric(18, 4)), 40, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1626, 10867, 53, CAST(65.9900 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1627, 10868, 26, CAST(33.3200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1628, 10868, 35, CAST(6.2400 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1629, 10868, 49, CAST(19.4700 AS Numeric(18, 4)), 42, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1630, 10869, 1, CAST(21.5000 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1631, 10869, 11, CAST(29.9500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1632, 10869, 23, CAST(8.3800 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1633, 10869, 68, CAST(13.6800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1634, 10870, 35, CAST(6.4200 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1635, 10870, 51, CAST(107.6200 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1636, 10871, 6, CAST(3.7600 AS Numeric(18, 4)), 50, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1637, 10871, 16, CAST(9.6300 AS Numeric(18, 4)), 12, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1638, 10871, 17, CAST(24.0600 AS Numeric(18, 4)), 16, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1639, 10872, 55, CAST(42.0300 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1640, 10872, 62, CAST(30.9300 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1641, 10872, 64, CAST(32.5700 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1642, 10872, 65, CAST(10.4200 AS Numeric(18, 4)), 21, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1643, 10873, 21, CAST(10.2700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1644, 10873, 28, CAST(44.8800 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1645, 10874, 10, CAST(6.6000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1646, 10875, 19, CAST(8.5500 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1647, 10875, 47, CAST(24.4200 AS Numeric(18, 4)), 21, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1648, 10875, 49, CAST(21.6200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1649, 10876, 46, CAST(12.2300 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1650, 10876, 64, CAST(35.8600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1651, 10877, 16, CAST(10.0100 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1652, 10877, 18, CAST(25.7800 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1653, 10878, 20, CAST(81.8200 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1654, 10879, 40, CAST(17.5300 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1655, 10879, 65, CAST(10.9000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1656, 10879, 76, CAST(430.5300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1657, 10880, 23, CAST(8.3100 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1658, 10880, 61, CAST(27.0300 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1659, 10880, 70, CAST(29.1700 AS Numeric(18, 4)), 50, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1660, 10881, 73, CAST(1.1900 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1661, 10882, 42, CAST(12.6300 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1662, 10882, 49, CAST(19.9500 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1663, 10882, 54, CAST(35.4200 AS Numeric(18, 4)), 32, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1664, 10883, 24, CAST(4.3500 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1665, 10884, 21, CAST(9.9000 AS Numeric(18, 4)), 40, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1666, 10884, 56, CAST(41.1800 AS Numeric(18, 4)), 21, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1667, 10884, 65, CAST(9.1300 AS Numeric(18, 4)), 12, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1668, 10885, 2, CAST(19.4500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1669, 10885, 24, CAST(4.5600 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1670, 10885, 70, CAST(29.4400 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1671, 10885, 77, CAST(13.6900 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1672, 10886, 10, CAST(6.7400 AS Numeric(18, 4)), 70, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1673, 10886, 31, CAST(9.0700 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1674, 10886, 77, CAST(13.5800 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1675, 10887, 25, CAST(13.1200 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1676, 10888, 2, CAST(20.4600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1677, 10888, 68, CAST(11.5600 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1678, 10889, 11, CAST(26.0400 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1679, 10889, 38, CAST(87.7900 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1680, 10890, 17, CAST(23.1700 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1681, 10890, 34, CAST(8.0300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1682, 10890, 41, CAST(9.1200 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1683, 10891, 30, CAST(27.1900 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1684, 10892, 59, CAST(8.3400 AS Numeric(18, 4)), 40, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1685, 10893, 8, CAST(20.1100 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1686, 10893, 24, CAST(4.7000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1687, 10893, 29, CAST(126.2800 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1688, 10893, 30, CAST(27.4000 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1689, 10893, 36, CAST(7.3900 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1690, 10894, 13, CAST(23.2300 AS Numeric(18, 4)), 28, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1691, 10894, 69, CAST(2.1600 AS Numeric(18, 4)), 50, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1692, 10894, 75, CAST(8.4500 AS Numeric(18, 4)), 120, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1693, 10895, 24, CAST(4.5900 AS Numeric(18, 4)), 110, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1694, 10895, 39, CAST(64.3000 AS Numeric(18, 4)), 45, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1695, 10895, 40, CAST(19.2600 AS Numeric(18, 4)), 91, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1696, 10895, 60, CAST(5.0200 AS Numeric(18, 4)), 100, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1697, 10896, 45, CAST(9.3900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1698, 10896, 56, CAST(36.1700 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1699, 10897, 29, CAST(133.1500 AS Numeric(18, 4)), 80, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1700, 10897, 30, CAST(26.2700 AS Numeric(18, 4)), 36, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1701, 10898, 13, CAST(23.2900 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1702, 10899, 39, CAST(64.2700 AS Numeric(18, 4)), 8, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1703, 10900, 70, CAST(30.7600 AS Numeric(18, 4)), 3, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1704, 10901, 41, CAST(8.9200 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1705, 10901, 71, CAST(30.6700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1706, 10902, 55, CAST(42.4400 AS Numeric(18, 4)), 30, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1707, 10902, 62, CAST(28.0000 AS Numeric(18, 4)), 6, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1708, 10903, 13, CAST(25.7400 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1709, 10903, 65, CAST(10.6200 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1710, 10903, 68, CAST(12.7700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1711, 10904, 58, CAST(44.6900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1712, 10904, 62, CAST(26.7000 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1713, 10905, 1, CAST(19.6000 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1714, 10906, 61, CAST(24.2200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1715, 10907, 75, CAST(7.6800 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1716, 10908, 7, CAST(40.3800 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1717, 10908, 52, CAST(78.2700 AS Numeric(18, 4)), 14, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1718, 10909, 7, CAST(40.4700 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1719, 10909, 16, CAST(9.8800 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1720, 10909, 41, CAST(10.0900 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1721, 10910, 19, CAST(8.4100 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1722, 10910, 49, CAST(20.2700 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1723, 10910, 61, CAST(27.8300 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1724, 10911, 1, CAST(21.9300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1725, 10911, 17, CAST(24.8600 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1726, 10911, 67, CAST(62.3900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1727, 10912, 11, CAST(25.5000 AS Numeric(18, 4)), 40, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1728, 10912, 29, CAST(122.2700 AS Numeric(18, 4)), 60, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1729, 10913, 4, CAST(23.6600 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1730, 10913, 33, CAST(23.2700 AS Numeric(18, 4)), 40, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1731, 10913, 58, CAST(51.6300 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1732, 10914, 71, CAST(30.0300 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1733, 10915, 17, CAST(27.4500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1734, 10915, 33, CAST(26.2700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1735, 10915, 54, CAST(37.0800 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1736, 10916, 16, CAST(10.1100 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1737, 10916, 32, CAST(20.5900 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1738, 10916, 57, CAST(19.0800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1739, 10917, 30, CAST(26.2000 AS Numeric(18, 4)), 1, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1740, 10917, 60, CAST(4.6900 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1741, 10918, 1, CAST(19.4500 AS Numeric(18, 4)), 60, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1742, 10918, 60, CAST(5.0100 AS Numeric(18, 4)), 25, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1743, 10919, 16, CAST(10.0900 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1744, 10919, 25, CAST(12.7300 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1745, 10919, 40, CAST(20.0000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1746, 10920, 50, CAST(14.8700 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1747, 10921, 35, CAST(5.5900 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1748, 10921, 63, CAST(21.3600 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1749, 10922, 17, CAST(23.0200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1750, 10922, 24, CAST(4.7500 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1751, 10923, 42, CAST(13.2000 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1752, 10923, 43, CAST(12.8400 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1753, 10923, 67, CAST(63.9700 AS Numeric(18, 4)), 24, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1754, 10924, 10, CAST(6.8900 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1755, 10924, 28, CAST(46.8000 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1756, 10924, 75, CAST(7.4400 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1757, 10925, 36, CAST(7.9600 AS Numeric(18, 4)), 25, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1758, 10925, 52, CAST(84.9100 AS Numeric(18, 4)), 12, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1759, 10926, 11, CAST(27.4900 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1760, 10926, 13, CAST(23.5000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1761, 10926, 19, CAST(8.6400 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1762, 10926, 72, CAST(12.1000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1763, 10927, 20, CAST(82.1400 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1764, 10927, 52, CAST(74.3300 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1765, 10927, 76, CAST(364.2500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1766, 10928, 47, CAST(25.5000 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1767, 10928, 76, CAST(363.6400 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1768, 10929, 21, CAST(9.2700 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1769, 10929, 75, CAST(7.6300 AS Numeric(18, 4)), 49, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1770, 10929, 77, CAST(13.2100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1771, 10930, 21, CAST(10.7300 AS Numeric(18, 4)), 36, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1772, 10930, 27, CAST(41.5800 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1773, 10930, 55, CAST(39.7600 AS Numeric(18, 4)), 25, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1774, 10930, 58, CAST(47.8500 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1775, 10931, 13, CAST(27.0300 AS Numeric(18, 4)), 42, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1776, 10931, 57, CAST(19.2500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1777, 10932, 16, CAST(9.4900 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1778, 10932, 62, CAST(27.0400 AS Numeric(18, 4)), 14, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1779, 10932, 72, CAST(11.4300 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1780, 10932, 75, CAST(7.8200 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1781, 10933, 53, CAST(55.1900 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1782, 10933, 61, CAST(25.4900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1783, 10934, 6, CAST(3.7000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1784, 10935, 1, CAST(21.1500 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1785, 10935, 18, CAST(24.6900 AS Numeric(18, 4)), 4, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1786, 10935, 23, CAST(9.1200 AS Numeric(18, 4)), 8, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1787, 10936, 36, CAST(8.7200 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1788, 10937, 28, CAST(49.6600 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1789, 10937, 34, CAST(7.7100 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1790, 10938, 13, CAST(22.6300 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1791, 10938, 43, CAST(12.6700 AS Numeric(18, 4)), 24, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1792, 10938, 60, CAST(5.2600 AS Numeric(18, 4)), 49, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1793, 10938, 71, CAST(32.2700 AS Numeric(18, 4)), 35, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1794, 10939, 2, CAST(17.9600 AS Numeric(18, 4)), 10, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1795, 10939, 67, CAST(59.2100 AS Numeric(18, 4)), 40, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1796, 10940, 7, CAST(38.5700 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1797, 10940, 13, CAST(23.2800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1798, 10941, 31, CAST(8.0200 AS Numeric(18, 4)), 44, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1799, 10941, 62, CAST(27.2800 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1800, 10941, 68, CAST(12.8200 AS Numeric(18, 4)), 80, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1801, 10941, 72, CAST(12.5300 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1802, 10942, 49, CAST(19.7100 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1803, 10943, 13, CAST(24.2800 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1804, 10943, 22, CAST(3.4900 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1805, 10943, 46, CAST(12.3900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1806, 10944, 11, CAST(25.9000 AS Numeric(18, 4)), 5, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1807, 10944, 44, CAST(72.7300 AS Numeric(18, 4)), 18, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1808, 10944, 56, CAST(40.4000 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1809, 10945, 13, CAST(27.1700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1810, 10945, 31, CAST(7.9000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1811, 10946, 10, CAST(6.7000 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1812, 10946, 24, CAST(4.6300 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1813, 10946, 77, CAST(13.6900 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1814, 10947, 59, CAST(8.2800 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1815, 10948, 50, CAST(16.0500 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1816, 10948, 51, CAST(100.7600 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1817, 10948, 55, CAST(38.7300 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1818, 10949, 6, CAST(4.0500 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1819, 10949, 10, CAST(6.4800 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1820, 10949, 17, CAST(27.3600 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1821, 10949, 62, CAST(27.5900 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1822, 10950, 4, CAST(22.8600 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1823, 10951, 33, CAST(23.7200 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1824, 10951, 41, CAST(9.5400 AS Numeric(18, 4)), 6, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1825, 10951, 75, CAST(7.2300 AS Numeric(18, 4)), 50, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1826, 10952, 6, CAST(3.8700 AS Numeric(18, 4)), 16, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1827, 10952, 28, CAST(44.5500 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1828, 10953, 20, CAST(83.9000 AS Numeric(18, 4)), 50, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1829, 10953, 31, CAST(7.8900 AS Numeric(18, 4)), 50, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1830, 10954, 16, CAST(9.7800 AS Numeric(18, 4)), 28, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1831, 10954, 31, CAST(8.4200 AS Numeric(18, 4)), 25, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1832, 10954, 45, CAST(8.7600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1833, 10954, 60, CAST(5.4800 AS Numeric(18, 4)), 24, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1834, 10955, 75, CAST(7.8600 AS Numeric(18, 4)), 12, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1835, 10956, 21, CAST(10.0100 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1836, 10956, 47, CAST(23.0400 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1837, 10956, 51, CAST(98.1800 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1838, 10957, 30, CAST(27.9400 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1839, 10957, 35, CAST(5.9400 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1840, 10957, 64, CAST(34.8900 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1841, 10958, 5, CAST(6.1700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1842, 10958, 7, CAST(38.1700 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1843, 10958, 72, CAST(11.6500 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1844, 10959, 75, CAST(7.2400 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1845, 10960, 24, CAST(4.6400 AS Numeric(18, 4)), 10, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1846, 10960, 41, CAST(9.5800 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1847, 10961, 52, CAST(74.1700 AS Numeric(18, 4)), 6, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1848, 10961, 76, CAST(388.9100 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1849, 10962, 7, CAST(39.3300 AS Numeric(18, 4)), 45, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1850, 10962, 13, CAST(23.7200 AS Numeric(18, 4)), 77, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1851, 10962, 53, CAST(57.7700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1852, 10962, 69, CAST(1.9400 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1853, 10962, 76, CAST(377.9200 AS Numeric(18, 4)), 44, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1854, 10963, 60, CAST(4.7800 AS Numeric(18, 4)), 2, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1855, 10964, 18, CAST(25.4000 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1856, 10964, 38, CAST(87.2800 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1857, 10964, 69, CAST(2.0400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1858, 10965, 51, CAST(97.0700 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1859, 10966, 37, CAST(4.1700 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1860, 10966, 56, CAST(39.1200 AS Numeric(18, 4)), 12, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1861, 10966, 62, CAST(28.6400 AS Numeric(18, 4)), 12, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1862, 10967, 19, CAST(9.3100 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1863, 10967, 49, CAST(18.6700 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1864, 10968, 12, CAST(9.6300 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1865, 10968, 24, CAST(4.2700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1866, 10968, 64, CAST(30.3400 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1867, 10969, 46, CAST(13.0700 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1868, 10970, 52, CAST(76.2300 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1869, 10971, 29, CAST(135.1600 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1870, 10972, 17, CAST(25.2600 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1871, 10972, 33, CAST(25.3300 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1872, 10973, 26, CAST(30.8400 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1873, 10973, 41, CAST(8.7100 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1874, 10973, 75, CAST(8.2100 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1875, 10974, 63, CAST(20.7400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1876, 10975, 8, CAST(19.7800 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1877, 10975, 75, CAST(8.3800 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1878, 10976, 28, CAST(42.3400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1879, 10977, 39, CAST(60.5400 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1880, 10977, 47, CAST(26.9900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1881, 10977, 51, CAST(104.7500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1882, 10977, 63, CAST(21.6800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1883, 10978, 8, CAST(19.9200 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1884, 10978, 21, CAST(10.0200 AS Numeric(18, 4)), 40, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1885, 10978, 40, CAST(18.2900 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1886, 10978, 44, CAST(71.9700 AS Numeric(18, 4)), 6, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1887, 10979, 7, CAST(41.6800 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1888, 10979, 12, CAST(10.4500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1889, 10979, 24, CAST(4.1200 AS Numeric(18, 4)), 80, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1890, 10979, 27, CAST(40.4500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1891, 10979, 31, CAST(8.6500 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1892, 10979, 63, CAST(19.9200 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1893, 10980, 75, CAST(8.0100 AS Numeric(18, 4)), 40, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1894, 10981, 38, CAST(79.9400 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1895, 10982, 7, CAST(37.3200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1896, 10982, 43, CAST(11.3700 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1897, 10983, 13, CAST(22.6300 AS Numeric(18, 4)), 84, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1898, 10983, 57, CAST(19.5600 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1899, 10984, 16, CAST(10.0500 AS Numeric(18, 4)), 55, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1900, 10984, 24, CAST(4.6400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1901, 10984, 36, CAST(8.7500 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1902, 10985, 16, CAST(9.3800 AS Numeric(18, 4)), 36, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1903, 10985, 18, CAST(27.8700 AS Numeric(18, 4)), 8, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1904, 10985, 32, CAST(20.5300 AS Numeric(18, 4)), 35, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1905, 10986, 11, CAST(28.5200 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1906, 10986, 20, CAST(80.7800 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1907, 10986, 76, CAST(368.9300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1908, 10986, 77, CAST(13.1400 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1909, 10987, 7, CAST(41.1200 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1910, 10987, 43, CAST(13.0700 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1911, 10987, 72, CAST(12.4700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1912, 10988, 7, CAST(39.9300 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1913, 10988, 62, CAST(29.7200 AS Numeric(18, 4)), 40, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1914, 10989, 6, CAST(3.9900 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1915, 10989, 11, CAST(25.7100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1916, 10989, 41, CAST(9.3400 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1917, 10990, 21, CAST(10.3900 AS Numeric(18, 4)), 65, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1918, 10990, 34, CAST(7.4900 AS Numeric(18, 4)), 60, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1919, 10990, 55, CAST(39.3700 AS Numeric(18, 4)), 65, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1920, 10990, 61, CAST(28.0900 AS Numeric(18, 4)), 66, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1921, 10991, 2, CAST(18.0800 AS Numeric(18, 4)), 50, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1922, 10991, 70, CAST(29.8400 AS Numeric(18, 4)), 20, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1923, 10991, 76, CAST(405.1400 AS Numeric(18, 4)), 90, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1924, 10992, 72, CAST(12.8000 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1925, 10993, 29, CAST(125.8800 AS Numeric(18, 4)), 50, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1926, 10993, 41, CAST(10.1200 AS Numeric(18, 4)), 35, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1927, 10994, 59, CAST(8.2100 AS Numeric(18, 4)), 18, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1928, 10995, 51, CAST(99.7900 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1929, 10995, 60, CAST(5.2100 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1930, 10996, 42, CAST(14.2100 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1931, 10997, 32, CAST(20.3300 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1932, 10997, 46, CAST(12.6200 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1933, 10997, 52, CAST(75.3700 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1934, 10998, 24, CAST(4.1300 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1935, 10998, 61, CAST(29.1100 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1936, 10998, 74, CAST(31.6600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1937, 10998, 75, CAST(7.6900 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1938, 10999, 41, CAST(9.5000 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1939, 10999, 51, CAST(98.4700 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1940, 10999, 77, CAST(12.0400 AS Numeric(18, 4)), 21, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1941, 11000, 4, CAST(20.3900 AS Numeric(18, 4)), 25, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1942, 11000, 24, CAST(4.3400 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1943, 11000, 77, CAST(12.4200 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1944, 11001, 7, CAST(42.8100 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1945, 11001, 22, CAST(3.8200 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1946, 11001, 46, CAST(13.1400 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1947, 11001, 55, CAST(36.2500 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1948, 11002, 13, CAST(25.3400 AS Numeric(18, 4)), 56, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1949, 11002, 35, CAST(5.8000 AS Numeric(18, 4)), 15, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1950, 11002, 42, CAST(12.8600 AS Numeric(18, 4)), 24, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1951, 11002, 55, CAST(42.2300 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1952, 11003, 1, CAST(19.0000 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1953, 11003, 40, CAST(16.7800 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1954, 11003, 52, CAST(80.1000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1955, 11004, 26, CAST(29.6800 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1956, 11004, 76, CAST(396.2400 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1957, 11005, 1, CAST(19.0000 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1958, 11005, 59, CAST(8.8500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1959, 11006, 1, CAST(21.9400 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1960, 11006, 29, CAST(131.1500 AS Numeric(18, 4)), 2, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1961, 11007, 8, CAST(20.5500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1962, 11007, 29, CAST(134.4100 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1963, 11007, 42, CAST(14.7900 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1964, 11008, 28, CAST(42.4900 AS Numeric(18, 4)), 70, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1965, 11008, 34, CAST(8.1600 AS Numeric(18, 4)), 90, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1966, 11008, 71, CAST(29.4000 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1967, 11009, 24, CAST(4.1800 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1968, 11009, 36, CAST(8.3800 AS Numeric(18, 4)), 18, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1969, 11009, 60, CAST(5.2000 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1970, 11010, 7, CAST(43.9400 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1971, 11010, 24, CAST(4.4700 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1972, 11011, 58, CAST(45.9800 AS Numeric(18, 4)), 40, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1973, 11011, 71, CAST(31.7200 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1974, 11012, 19, CAST(9.0100 AS Numeric(18, 4)), 50, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1975, 11012, 60, CAST(4.5700 AS Numeric(18, 4)), 36, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1976, 11012, 71, CAST(30.4000 AS Numeric(18, 4)), 60, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1977, 11013, 23, CAST(9.1400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1978, 11013, 42, CAST(14.7900 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1979, 11013, 45, CAST(8.9700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1980, 11013, 68, CAST(12.5100 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1981, 11014, 41, CAST(10.1800 AS Numeric(18, 4)), 28, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1982, 11015, 30, CAST(28.3600 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1983, 11015, 77, CAST(11.8000 AS Numeric(18, 4)), 18, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1984, 11016, 31, CAST(8.1900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1985, 11016, 36, CAST(8.6600 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1986, 11017, 3, CAST(21.5300 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1987, 11017, 59, CAST(8.4900 AS Numeric(18, 4)), 110, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1988, 11017, 70, CAST(31.7600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1989, 11018, 12, CAST(9.7100 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1990, 11018, 18, CAST(27.5600 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1991, 11018, 56, CAST(36.0200 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1992, 11019, 46, CAST(11.3500 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1993, 11019, 49, CAST(21.7700 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1994, 11020, 10, CAST(7.1400 AS Numeric(18, 4)), 24, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1995, 11021, 2, CAST(17.8000 AS Numeric(18, 4)), 11, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1996, 11021, 20, CAST(74.2800 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1997, 11021, 26, CAST(30.1800 AS Numeric(18, 4)), 63, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1998, 11021, 51, CAST(101.2700 AS Numeric(18, 4)), 44, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (1999, 11021, 72, CAST(12.6100 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2000, 11022, 19, CAST(9.6100 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2001, 11022, 69, CAST(2.0700 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2002, 11023, 7, CAST(40.3000 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2003, 11023, 43, CAST(11.9100 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2004, 11024, 26, CAST(33.4400 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2005, 11024, 33, CAST(23.5800 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2006, 11024, 65, CAST(9.3800 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2007, 11024, 71, CAST(28.6000 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2008, 11025, 1, CAST(19.5500 AS Numeric(18, 4)), 10, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2009, 11025, 13, CAST(25.4000 AS Numeric(18, 4)), 20, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2010, 11026, 18, CAST(26.8600 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2011, 11026, 51, CAST(92.9800 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2012, 11027, 24, CAST(4.7900 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2013, 11027, 62, CAST(28.7600 AS Numeric(18, 4)), 21, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2014, 11028, 55, CAST(36.7700 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2015, 11028, 59, CAST(8.6300 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2016, 11029, 56, CAST(38.1600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2017, 11029, 63, CAST(18.1400 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2018, 11030, 2, CAST(19.4200 AS Numeric(18, 4)), 100, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2019, 11030, 5, CAST(6.0600 AS Numeric(18, 4)), 70, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2020, 11030, 29, CAST(134.3300 AS Numeric(18, 4)), 60, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2021, 11030, 59, CAST(7.8400 AS Numeric(18, 4)), 100, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2022, 11031, 1, CAST(21.4500 AS Numeric(18, 4)), 45, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2023, 11031, 13, CAST(27.2900 AS Numeric(18, 4)), 80, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2024, 11031, 24, CAST(4.5200 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2025, 11031, 64, CAST(32.4000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2026, 11031, 71, CAST(28.7700 AS Numeric(18, 4)), 16, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2027, 11032, 36, CAST(7.4800 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2028, 11032, 38, CAST(85.5600 AS Numeric(18, 4)), 25, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2029, 11032, 59, CAST(7.7800 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2030, 11033, 53, CAST(55.3500 AS Numeric(18, 4)), 70, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2031, 11033, 69, CAST(2.1500 AS Numeric(18, 4)), 36, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2032, 11034, 21, CAST(10.8400 AS Numeric(18, 4)), 15, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2033, 11034, 44, CAST(73.2900 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2034, 11034, 61, CAST(24.2600 AS Numeric(18, 4)), 6, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2035, 11035, 1, CAST(19.5500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2036, 11035, 35, CAST(6.1100 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2037, 11035, 42, CAST(13.3200 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2038, 11035, 54, CAST(37.3000 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2039, 11036, 13, CAST(25.0100 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2040, 11036, 59, CAST(8.2600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2041, 11037, 70, CAST(29.0000 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2042, 11038, 40, CAST(17.7700 AS Numeric(18, 4)), 5, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2043, 11038, 52, CAST(77.6100 AS Numeric(18, 4)), 2, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2044, 11038, 71, CAST(32.0600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2045, 11039, 28, CAST(47.9000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2046, 11039, 35, CAST(6.1600 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2047, 11039, 49, CAST(18.6000 AS Numeric(18, 4)), 60, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2048, 11039, 57, CAST(20.5600 AS Numeric(18, 4)), 28, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2049, 11040, 21, CAST(10.4600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2050, 11041, 2, CAST(20.1200 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2051, 11041, 63, CAST(20.3500 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2052, 11042, 44, CAST(75.4100 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2053, 11042, 61, CAST(28.5400 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2054, 11043, 11, CAST(28.2800 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2055, 11044, 62, CAST(26.4000 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2056, 11045, 33, CAST(25.0200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2057, 11045, 51, CAST(102.5500 AS Numeric(18, 4)), 24, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2058, 11046, 12, CAST(9.3200 AS Numeric(18, 4)), 20, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2059, 11046, 32, CAST(20.8500 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2060, 11046, 35, CAST(6.3100 AS Numeric(18, 4)), 18, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2061, 11047, 1, CAST(19.3100 AS Numeric(18, 4)), 25, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2062, 11047, 5, CAST(5.9600 AS Numeric(18, 4)), 30, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2063, 11048, 68, CAST(11.5200 AS Numeric(18, 4)), 42, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2064, 11049, 2, CAST(18.7000 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2065, 11049, 12, CAST(9.2200 AS Numeric(18, 4)), 4, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2066, 11050, 76, CAST(383.8100 AS Numeric(18, 4)), 50, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2067, 11051, 24, CAST(4.1400 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2068, 11052, 43, CAST(11.9200 AS Numeric(18, 4)), 30, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2069, 11052, 61, CAST(27.9200 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2070, 11053, 18, CAST(25.4500 AS Numeric(18, 4)), 35, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2071, 11053, 32, CAST(20.5600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2072, 11053, 64, CAST(36.1400 AS Numeric(18, 4)), 25, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2073, 11054, 33, CAST(23.8400 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2074, 11054, 67, CAST(54.5300 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2075, 11055, 24, CAST(4.4900 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2076, 11055, 25, CAST(12.6200 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2077, 11055, 51, CAST(97.0800 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2078, 11055, 57, CAST(19.3700 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2079, 11056, 7, CAST(42.1500 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2080, 11056, 55, CAST(39.0700 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2081, 11056, 60, CAST(5.3800 AS Numeric(18, 4)), 50, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2082, 11057, 70, CAST(28.7000 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2083, 11058, 21, CAST(10.3000 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2084, 11058, 60, CAST(5.4800 AS Numeric(18, 4)), 21, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2085, 11058, 61, CAST(26.9700 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2086, 11059, 13, CAST(27.0800 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2087, 11059, 17, CAST(26.8000 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2088, 11059, 60, CAST(5.1900 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2089, 11060, 60, CAST(4.9600 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2090, 11060, 77, CAST(13.1100 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2091, 11061, 60, CAST(5.2700 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2092, 11062, 53, CAST(61.5400 AS Numeric(18, 4)), 10, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2093, 11062, 70, CAST(27.6800 AS Numeric(18, 4)), 12, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2094, 11063, 34, CAST(8.0600 AS Numeric(18, 4)), 30, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2095, 11063, 40, CAST(19.9600 AS Numeric(18, 4)), 40, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2096, 11063, 41, CAST(9.6200 AS Numeric(18, 4)), 30, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2097, 11064, 17, CAST(26.8900 AS Numeric(18, 4)), 77, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2098, 11064, 41, CAST(10.2300 AS Numeric(18, 4)), 12, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2099, 11064, 53, CAST(61.2100 AS Numeric(18, 4)), 25, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2100, 11064, 55, CAST(39.7600 AS Numeric(18, 4)), 4, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2101, 11064, 68, CAST(11.4100 AS Numeric(18, 4)), 55, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2102, 11065, 30, CAST(24.6000 AS Numeric(18, 4)), 4, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2103, 11065, 54, CAST(37.6900 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2104, 11066, 16, CAST(9.3600 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2105, 11066, 19, CAST(9.8100 AS Numeric(18, 4)), 42, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2106, 11066, 34, CAST(7.5900 AS Numeric(18, 4)), 35, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2107, 11067, 41, CAST(9.3400 AS Numeric(18, 4)), 9, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2108, 11068, 28, CAST(46.8600 AS Numeric(18, 4)), 8, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2109, 11068, 43, CAST(11.2100 AS Numeric(18, 4)), 36, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2110, 11068, 77, CAST(13.8900 AS Numeric(18, 4)), 28, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2111, 11069, 39, CAST(58.2600 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2112, 11070, 1, CAST(18.5700 AS Numeric(18, 4)), 40, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2113, 11070, 2, CAST(20.1700 AS Numeric(18, 4)), 20, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2114, 11070, 16, CAST(8.7600 AS Numeric(18, 4)), 30, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2115, 11070, 31, CAST(8.4500 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2116, 11071, 7, CAST(42.5000 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2117, 11071, 13, CAST(26.0700 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2118, 11072, 2, CAST(20.2000 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2119, 11072, 41, CAST(10.4000 AS Numeric(18, 4)), 40, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2120, 11072, 50, CAST(15.8100 AS Numeric(18, 4)), 22, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2121, 11072, 64, CAST(32.5400 AS Numeric(18, 4)), 130, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2122, 11073, 11, CAST(28.9300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2123, 11073, 24, CAST(4.6000 AS Numeric(18, 4)), 20, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2124, 11074, 16, CAST(9.7200 AS Numeric(18, 4)), 14, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2125, 11075, 2, CAST(17.1000 AS Numeric(18, 4)), 10, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2126, 11075, 46, CAST(13.1800 AS Numeric(18, 4)), 30, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2127, 11075, 76, CAST(379.0500 AS Numeric(18, 4)), 2, CAST(0.1500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2128, 11076, 6, CAST(3.8200 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2129, 11076, 14, CAST(24.9300 AS Numeric(18, 4)), 20, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2130, 11076, 19, CAST(9.7800 AS Numeric(18, 4)), 10, CAST(0.2500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2131, 11077, 2, CAST(18.9300 AS Numeric(18, 4)), 24, CAST(0.2000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2132, 11077, 3, CAST(21.8500 AS Numeric(18, 4)), 4, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2133, 11077, 4, CAST(23.6000 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2134, 11077, 6, CAST(4.3900 AS Numeric(18, 4)), 50, CAST(0.0200 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2135, 11077, 7, CAST(40.0400 AS Numeric(18, 4)), 15, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2136, 11077, 8, CAST(21.6100 AS Numeric(18, 4)), 5, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2137, 11077, 10, CAST(6.5700 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2138, 11077, 12, CAST(10.7300 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2139, 11077, 13, CAST(26.4300 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2140, 11077, 14, CAST(24.7400 AS Numeric(18, 4)), 50, CAST(0.0300 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2141, 11077, 16, CAST(10.3500 AS Numeric(18, 4)), 25, CAST(0.0300 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2142, 11077, 20, CAST(79.8300 AS Numeric(18, 4)), 15, CAST(0.0400 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2143, 11077, 23, CAST(9.4700 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2144, 11077, 32, CAST(18.9800 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2145, 11077, 39, CAST(55.1000 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2146, 11077, 41, CAST(8.7200 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2147, 11077, 46, CAST(11.6300 AS Numeric(18, 4)), 8, CAST(0.0200 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2148, 11077, 52, CAST(82.8300 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2149, 11077, 55, CAST(42.1100 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2150, 11077, 60, CAST(5.3300 AS Numeric(18, 4)), 8, CAST(0.0600 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2151, 11077, 64, CAST(34.0900 AS Numeric(18, 4)), 15, CAST(0.0300 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2152, 11077, 66, CAST(20.3500 AS Numeric(18, 4)), 8, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2153, 11077, 73, CAST(1.2100 AS Numeric(18, 4)), 5, CAST(0.0100 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2154, 11077, 75, CAST(8.1900 AS Numeric(18, 4)), 14, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2155, 11077, 77, CAST(11.9800 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2156, 11078, 2, CAST(18.9000 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2157, 11078, 3, CAST(19.5000 AS Numeric(18, 4)), 25, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2158, 11079, 13, CAST(25.5000 AS Numeric(18, 4)), 10, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2159, 11079, 57, CAST(19.0000 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2160, 11080, 14, CAST(23.0000 AS Numeric(18, 4)), 100, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2161, 11081, 75, CAST(7.0500 AS Numeric(18, 4)), 150, CAST(0.1000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2162, 11082, 3, CAST(19.5500 AS Numeric(18, 4)), 35, CAST(0.0700 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2163, 11083, 9, CAST(38.9000 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2164, 11083, 21, CAST(9.9500 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2165, 11083, 22, CAST(3.5000 AS Numeric(18, 4)), 15, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2166, 11083, 24, CAST(4.5000 AS Numeric(18, 4)), 50, CAST(0.0500 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2167, 11083, 33, CAST(25.5000 AS Numeric(18, 4)), 3, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2168, 11083, 37, CAST(4.5000 AS Numeric(18, 4)), 7, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2169, 11083, 42, CAST(15.6500 AS Numeric(18, 4)), 10, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2170, 11083, 47, CAST(25.5000 AS Numeric(18, 4)), 5, CAST(0.0000 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2171, 11083, 51, CAST(99.9000 AS Numeric(18, 4)), 3, CAST(0.0300 AS Numeric(18, 4)))

INSERT [dbo].[FactVendasItens] ([IDVendaItem], [IDVenda], [IDProduto], [Preço Unitário], [Quantidade], [Desconto]) VALUES (2172, 11083, 62, CAST(24.0000 AS Numeric(18, 4)), 5, CAST(0.0400 AS Numeric(18, 4)))

SET IDENTITY_INSERT [dbo].[FactVendasItens] OFF

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2015-05-01' AS Date), CAST(696.3488 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2015-06-01' AS Date), CAST(1536.9970 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2015-07-01' AS Date), CAST(1648.4135 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2015-08-01' AS Date), CAST(3718.3626 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2015-09-01' AS Date), CAST(1655.9060 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2015-10-01' AS Date), CAST(2106.1530 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2015-11-01' AS Date), CAST(6162.5846 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2015-12-01' AS Date), CAST(11836.6482 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2016-01-01' AS Date), CAST(5419.1640 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2016-03-01' AS Date), CAST(23011.5466 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2016-04-01' AS Date), CAST(20558.8800 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2016-05-01' AS Date), CAST(6732.6951 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2016-06-01' AS Date), CAST(10463.1560 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2016-07-01' AS Date), CAST(8273.1840 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2016-08-01' AS Date), CAST(3350.1780 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2016-09-01' AS Date), CAST(1549.7124 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2016-10-01' AS Date), CAST(6758.8080 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2016-11-01' AS Date), CAST(12848.3248 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2016-12-01' AS Date), CAST(24862.6512 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2017-01-01' AS Date), CAST(8393.0238 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2017-02-01' AS Date), CAST(3564.5124 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2017-03-01' AS Date), CAST(35389.0838 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2017-04-01' AS Date), CAST(24932.3470 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2017-05-01' AS Date), CAST(9879.2492 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2017-06-01' AS Date), CAST(9167.2857 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2017-07-01' AS Date), CAST(6728.9544 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2017-08-01' AS Date), CAST(13189.2668 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2017-09-01' AS Date), CAST(37617.3857 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2017-10-01' AS Date), CAST(25228.9596 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2017-11-01' AS Date), CAST(17850.8880 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2017-12-01' AS Date), CAST(15799.9324 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2018-01-01' AS Date), CAST(31354.3560 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2018-02-01' AS Date), CAST(10955.4119 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2018-03-01' AS Date), CAST(49293.8710 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2018-04-01' AS Date), CAST(35740.2360 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2018-05-01' AS Date), CAST(14027.8866 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2018-06-01' AS Date), CAST(8511.1845 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2018-07-01' AS Date), CAST(26916.9360 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2018-08-01' AS Date), CAST(32189.0839 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2018-09-01' AS Date), CAST(9353.8398 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2018-10-01' AS Date), CAST(6634.7862 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2018-11-01' AS Date), CAST(5335.5282 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (1, CAST('2018-12-01' AS Date), CAST(44962.3118 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2015-04-01' AS Date), CAST(1908.4450 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2015-06-01' AS Date), CAST(2549.0045 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2015-10-01' AS Date), CAST(996.3800 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2015-11-01' AS Date), CAST(3760.7304 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2016-01-01' AS Date), CAST(8977.0820 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2016-03-01' AS Date), CAST(7588.2518 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2016-04-01' AS Date), CAST(5301.8550 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2016-05-01' AS Date), CAST(11219.6760 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2016-06-01' AS Date), CAST(3823.4504 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2016-08-01' AS Date), CAST(6801.8873 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2016-10-01' AS Date), CAST(774.5160 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2016-12-01' AS Date), CAST(15414.2890 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2017-01-01' AS Date), CAST(19289.3400 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2017-03-01' AS Date), CAST(15614.3910 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2017-04-01' AS Date), CAST(2903.3820 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2017-05-01' AS Date), CAST(7266.2880 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2017-06-01' AS Date), CAST(21123.0642 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2017-07-01' AS Date), CAST(17430.3369 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2017-08-01' AS Date), CAST(7744.8812 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2017-09-01' AS Date), CAST(5511.8964 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2017-10-01' AS Date), CAST(38291.4126 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2017-11-01' AS Date), CAST(27329.0930 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2017-12-01' AS Date), CAST(32463.6845 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2018-01-01' AS Date), CAST(16539.2568 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2018-02-01' AS Date), CAST(17374.1456 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2018-03-01' AS Date), CAST(50015.4727 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2018-04-01' AS Date), CAST(26219.6141 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2018-05-01' AS Date), CAST(11858.8158 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2018-06-01' AS Date), CAST(14415.2280 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2018-07-01' AS Date), CAST(15936.1840 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2018-08-01' AS Date), CAST(12361.2011 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2018-09-01' AS Date), CAST(20304.1929 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2018-10-01' AS Date), CAST(6285.0040 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2018-11-01' AS Date), CAST(12442.5720 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (2, CAST('2018-12-01' AS Date), CAST(7214.3526 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2015-11-01' AS Date), CAST(107.4813 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2016-02-01' AS Date), CAST(4449.3360 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2016-03-01' AS Date), CAST(2142.3902 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2016-04-01' AS Date), CAST(6629.9940 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2016-06-01' AS Date), CAST(834.5190 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2016-08-01' AS Date), CAST(506.1240 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2016-09-01' AS Date), CAST(2392.4250 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2016-10-01' AS Date), CAST(400.5320 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2016-11-01' AS Date), CAST(11686.7947 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2016-12-01' AS Date), CAST(25217.3241 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2017-01-01' AS Date), CAST(636.5688 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2017-03-01' AS Date), CAST(2865.5417 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2017-04-01' AS Date), CAST(2761.3281 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2017-05-01' AS Date), CAST(2148.6348 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2017-06-01' AS Date), CAST(5142.2640 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2017-07-01' AS Date), CAST(2099.0228 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2017-08-01' AS Date), CAST(3974.9584 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2017-09-01' AS Date), CAST(1387.3269 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2017-10-01' AS Date), CAST(4248.3870 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2017-11-01' AS Date), CAST(2903.5560 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2017-12-01' AS Date), CAST(538.2936 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2018-01-01' AS Date), CAST(13385.9862 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2018-02-01' AS Date), CAST(714.3720 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2018-03-01' AS Date), CAST(10655.7564 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2018-04-01' AS Date), CAST(10234.9671 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2018-05-01' AS Date), CAST(8351.4620 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2018-07-01' AS Date), CAST(1831.5936 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2018-08-01' AS Date), CAST(5232.9942 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2018-09-01' AS Date), CAST(8874.0850 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2018-10-01' AS Date), CAST(3117.1004 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2018-11-01' AS Date), CAST(3590.4900 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (3, CAST('2018-12-01' AS Date), CAST(9912.0042 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2015-09-01' AS Date), CAST(830.3210 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2015-12-01' AS Date), CAST(633.7495 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2016-01-01' AS Date), CAST(1343.0508 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2016-03-01' AS Date), CAST(3974.1840 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2016-04-01' AS Date), CAST(2941.9600 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2016-05-01' AS Date), CAST(5984.7338 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2016-09-01' AS Date), CAST(1692.7330 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2016-10-01' AS Date), CAST(15336.5410 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2016-12-01' AS Date), CAST(1599.1080 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2017-04-01' AS Date), CAST(3614.9334 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2017-05-01' AS Date), CAST(1704.8727 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2017-06-01' AS Date), CAST(2665.5720 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2017-07-01' AS Date), CAST(620.9886 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2017-08-01' AS Date), CAST(4161.0012 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2017-09-01' AS Date), CAST(5397.4578 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2017-10-01' AS Date), CAST(177.2760 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2017-11-01' AS Date), CAST(5471.4576 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2017-12-01' AS Date), CAST(3255.5600 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2018-02-01' AS Date), CAST(214.8460 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2018-03-01' AS Date), CAST(5248.8318 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2018-04-01' AS Date), CAST(13764.9232 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2018-05-01' AS Date), CAST(1156.1268 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2018-06-01' AS Date), CAST(2208.9034 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2018-07-01' AS Date), CAST(480.7920 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2018-09-01' AS Date), CAST(113.7840 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2018-10-01' AS Date), CAST(19198.9644 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2018-11-01' AS Date), CAST(887.4150 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (4, CAST('2018-12-01' AS Date), CAST(90.2970 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2015-10-01' AS Date), CAST(3476.8580 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2015-11-01' AS Date), CAST(12576.2400 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2015-12-01' AS Date), CAST(3377.2752 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2016-01-01' AS Date), CAST(1901.5365 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2016-02-01' AS Date), CAST(3567.8400 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2016-03-01' AS Date), CAST(3510.4982 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2016-04-01' AS Date), CAST(9463.4424 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2016-05-01' AS Date), CAST(1872.2802 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2016-06-01' AS Date), CAST(1681.1538 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2016-07-01' AS Date), CAST(13644.9418 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2016-09-01' AS Date), CAST(1465.8710 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2016-10-01' AS Date), CAST(680.9212 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2016-11-01' AS Date), CAST(1359.5229 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2016-12-01' AS Date), CAST(7138.3788 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2017-01-01' AS Date), CAST(19592.3032 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2017-03-01' AS Date), CAST(424.3265 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2017-04-01' AS Date), CAST(1192.9788 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2017-05-01' AS Date), CAST(4256.4960 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2017-06-01' AS Date), CAST(17358.2990 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2017-07-01' AS Date), CAST(7654.7654 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2017-08-01' AS Date), CAST(4632.9708 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2017-09-01' AS Date), CAST(6191.0530 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2017-10-01' AS Date), CAST(14691.4680 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2017-11-01' AS Date), CAST(12761.6970 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2017-12-01' AS Date), CAST(2947.6248 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2018-02-01' AS Date), CAST(1720.0800 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2018-03-01' AS Date), CAST(14489.9743 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2018-04-01' AS Date), CAST(11232.7962 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2018-05-01' AS Date), CAST(18743.1566 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2018-06-01' AS Date), CAST(7040.4072 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2018-07-01' AS Date), CAST(11502.9310 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2018-08-01' AS Date), CAST(6564.5030 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2018-09-01' AS Date), CAST(5917.0440 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2018-10-01' AS Date), CAST(1322.0092 AS Numeric(18, 4)))

INSERT [dbo].[FactProjecao] ([IDFilial], [Data], [Valor]) VALUES (5, CAST('2018-12-01' AS Date), CAST(9057.1350 AS Numeric(18, 4)))

ALTER TABLE [dbo].[DimProduto]  WITH CHECK ADD  CONSTRAINT [FK_DimProduto_DimFornecedor] FOREIGN KEY([IDFornecedor])
REFERENCES [dbo].[DimFornecedor] ([IDFornecedor])

ALTER TABLE [dbo].[DimProduto] CHECK CONSTRAINT [FK_DimProduto_DimFornecedor]

ALTER TABLE [dbo].[DimProduto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Categoria] FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[DimCategoria] ([IDCategoria])

ALTER TABLE [dbo].[DimProduto] CHECK CONSTRAINT [FK_Produto_Categoria]

ALTER TABLE [dbo].[FactDevolucao]  WITH CHECK ADD  CONSTRAINT [FK_FactDevolucao_DimCliente] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[DimCliente] ([IDCliente])

ALTER TABLE [dbo].[FactDevolucao] CHECK CONSTRAINT [FK_FactDevolucao_DimCliente]

ALTER TABLE [dbo].[FactDevolucao]  WITH CHECK ADD  CONSTRAINT [FK_FactDevolucao_DimEmpregado] FOREIGN KEY([IDEmpregado])
REFERENCES [dbo].[DimEmpregado] ([EmpID])

ALTER TABLE [dbo].[FactDevolucao] CHECK CONSTRAINT [FK_FactDevolucao_DimEmpregado]

ALTER TABLE [dbo].[FactDevolucao]  WITH CHECK ADD  CONSTRAINT [FK_FactDevolucao_DimFilial] FOREIGN KEY([IDFilial])
REFERENCES [dbo].[DimFilial] ([IDFilial])

ALTER TABLE [dbo].[FactDevolucao] CHECK CONSTRAINT [FK_FactDevolucao_DimFilial]

ALTER TABLE [dbo].[FactDevolucao]  WITH CHECK ADD  CONSTRAINT [FK_FactDevolucao_FactVenda] FOREIGN KEY([IDVenda])
REFERENCES [dbo].[FactVendas] ([IDVenda])

ALTER TABLE [dbo].[FactDevolucao] CHECK CONSTRAINT [FK_FactDevolucao_FactVenda]

ALTER TABLE [dbo].[FactDevolucao]  WITH CHECK ADD  CONSTRAINT [FK_FactDevolucao_FactTransportadora] FOREIGN KEY([IDTransportadora])
REFERENCES [dbo].[DimTransportadora] ([IDTransportadora])

ALTER TABLE [dbo].[FactDevolucao] CHECK CONSTRAINT [FK_FactDevolucao_FactTransportadora]

ALTER TABLE [dbo].[FactVendas]  WITH CHECK ADD  CONSTRAINT [FK_Venda_Cliente] FOREIGN KEY([IDClientes])
REFERENCES [dbo].[DimCliente] ([IDCliente])

ALTER TABLE [dbo].[FactVendas] CHECK CONSTRAINT [FK_Venda_Cliente]

ALTER TABLE [dbo].[FactVendas]  WITH CHECK ADD  CONSTRAINT [FK_Venda_Empregado] FOREIGN KEY([IDEmpregado])
REFERENCES [dbo].[DimEmpregado] ([EmpID])

ALTER TABLE [dbo].[FactVendas] CHECK CONSTRAINT [FK_Venda_Empregado]

ALTER TABLE [dbo].[FactVendas]  WITH CHECK ADD  CONSTRAINT [FK_Venda_Filial] FOREIGN KEY([IDFilial])
REFERENCES [dbo].[DimFilial] ([IDFilial])

ALTER TABLE [dbo].[FactVendas] CHECK CONSTRAINT [FK_Venda_Filial]

ALTER TABLE [dbo].[FactVendas]  WITH CHECK ADD  CONSTRAINT [FK_Venda_Transportadora] FOREIGN KEY([IDTransportadora])
REFERENCES [dbo].[DimTransportadora] ([IDTransportadora])

ALTER TABLE [dbo].[FactVendas] CHECK CONSTRAINT [FK_Venda_Transportadora]

ALTER TABLE [dbo].[FactVendasItens]  WITH CHECK ADD  CONSTRAINT [FK_Venda Itens_Venda] FOREIGN KEY([IDVenda])
REFERENCES [dbo].[FactVendas] ([IDVenda])

ALTER TABLE [dbo].[FactVendasItens] CHECK CONSTRAINT [FK_Venda_Itens_Venda]

ALTER TABLE [dbo].[FactVendasItens]  WITH CHECK ADD  CONSTRAINT [FK_Venda Itens_Produto] FOREIGN KEY([IDProduto])
REFERENCES [dbo].[DimProduto] ([IDProduto])

ALTER TABLE [dbo].[FactVendasItens] CHECK CONSTRAINT [FK_Venda_Itens_Produto]

ALTER TABLE [dbo].[FactProjecao]  WITH CHECK ADD  CONSTRAINT [FK_FactProjecao_DimFilial1] FOREIGN KEY([IDFilial])
REFERENCES [dbo].[DimFilial] ([IDFilial])

ALTER TABLE [dbo].[FactProjecao] CHECK CONSTRAINT [FK_FactProjecao_DimFilial1]