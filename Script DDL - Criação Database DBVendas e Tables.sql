﻿CREATE DATABASE [DB_VENDAS]
GO

USE [DB_VENDAS]
GO

/****** Object:  Table [dbo].[Nums2]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nums2](
	[n] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_cidade]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cidade](
	[cidade] [varchar](50) NOT NULL,
	[sigla_estado] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_classificacao]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_classificacao](
	[codigo_classificacao] [varchar](3) NOT NULL,
	[classificacao] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_cliente]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cliente](
	[cpf] [varchar](12) NOT NULL,
	[nome] [varchar](100) NULL,
	[sobrenome] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[telefone] [varchar](100) NULL,
	[cidade] [varchar](50) NOT NULL,
	[numero] [varchar](10) NULL,
	[rua] [varchar](100) NULL,
	[complemento] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_estado]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_estado](
	[sigla_estado] [varchar](2) NOT NULL,
	[nome_estado] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_item]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_item](
	[numero] [varchar](12) NOT NULL,
	[codigo_produto] [varchar](12) NOT NULL,
	[quantidade] [int] NULL,
	[preco] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_loja]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_loja](
	[codigo_loja] [varchar](10) NOT NULL,
	[nome_loja] [varchar](100) NULL,
	[cidade] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_nota]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_nota](
	[cpf] [varchar](12) NOT NULL,
	[codigo_loja] [varchar](10) NOT NULL,
	[data] [date] NULL,
	[numero] [varchar](12) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_produto]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_produto](
	[codigo_produto] [varchar](12) NOT NULL,
	[produto] [varchar](100) NULL,
	[codigo_classificacao] [varchar](3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_rastreamento]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rastreamento](
	[RowNumber] [int] IDENTITY(0,1) NOT NULL,
	[EventClass] [int] NULL,
	[ApplicationName] [nvarchar](128) NULL,
	[ClientProcessID] [int] NULL,
	[DatabaseID] [int] NULL,
	[DatabaseName] [nvarchar](128) NULL,
	[EventSequence] [bigint] NULL,
	[GroupID] [int] NULL,
	[HostName] [nvarchar](128) NULL,
	[IsSystem] [int] NULL,
	[LoginName] [nvarchar](128) NULL,
	[LoginSid] [image] NULL,
	[NTDomainName] [nvarchar](128) NULL,
	[NTUserName] [nvarchar](128) NULL,
	[RequestID] [int] NULL,
	[SPID] [int] NULL,
	[ServerName] [nvarchar](128) NULL,
	[SessionLoginName] [nvarchar](128) NULL,
	[StartTime] [datetime] NULL,
	[TextData] [ntext] NULL,
	[TransactionID] [bigint] NULL,
	[XactSequence] [bigint] NULL,
	[CPU] [int] NULL,
	[Duration] [bigint] NULL,
	[EndTime] [datetime] NULL,
	[Error] [int] NULL,
	[Reads] [bigint] NULL,
	[RowCounts] [bigint] NULL,
	[Writes] [bigint] NULL,
	[BinaryData] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  UserDefinedFunction [dbo].[BuscarClienteAleatorio]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[BuscarClienteAleatorio]()
RETURNS VARCHAR(11)
AS
BEGIN
    DECLARE @TotalClientes INT
    DECLARE @NumeroAleatorio INT
    
    SELECT @TotalClientes = 1000000
    
    SELECT @NumeroAleatorio = [dbo].[NumeroAleatorio] (1,@TotalClientes)
    
    RETURN (
        SELECT TOP 1 CPF 
        FROM (
            SELECT CPF 
            FROM tb_cliente 
            ORDER BY CPF OFFSET @NumeroAleatorio ROWS FETCH NEXT 1 ROWS ONLY
        ) AS Subconsulta
    )
END
GO
/****** Object:  UserDefinedFunction [dbo].[BuscarLojaAleatorio]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[BuscarLojaAleatorio](@CPF as VARCHAR(15))
RETURNS VARCHAR(11)
AS
BEGIN
 DECLARE @num_lojas INT
    DECLARE @cidade varchar(100)
	DECLARE @estado varchar(50)
    DECLARE @TotalLojas INT
    DECLARE @NumeroAleatorio INT
	DECLARE @retorno VARCHAR(10)
	SELECT @cidade = cidade FROM tb_cliente WHERE cpf = TRIM(@cpf);
	SELECT @estado = sigla_estado FROM tb_cidade WHERE cidade = TRIM(@cidade);
	SELECT @num_lojas = COUNT(*) FROM tb_loja WHERE cidade = TRIM(@cidade);
	IF @num_lojas > 0 
	   BEGIN
           SELECT TOP 1 @retorno = codigo_loja 
            FROM tb_loja WHERE cidade = TRIM(@cidade)        
	   END
    ELSE
	   BEGIN
	   SELECT @TotalLojas = COUNT(*) FROM tb_loja lj INNER JOIN tb_cidade es ON lj.cidade = es.cidade
	   WHERE es.sigla_estado = TRIM(@estado)
	   IF @TotalLojas = 1
	      BEGIN
		     SELECT TOP 1 @retorno = lj.codigo_loja  FROM tb_loja lj INNER JOIN tb_cidade es ON TRIM(lj.cidade) = TRIM(es.cidade)
	         WHERE es.sigla_estado = TRIM(@estado)
		  END
       ELSE
	      BEGIN
	       SELECT @NumeroAleatorio = [dbo].[NumeroAleatorio] (1,@TotalLojas)
           SELECT TOP 1 @retorno = codigo_loja 
           FROM (
            SELECT codigo_loja  
            FROM tb_loja lj INNER JOIN tb_cidade es ON lj.cidade = es.cidade
	                 WHERE es.sigla_estado = TRIM(@estado)
            ORDER BY codigo_loja OFFSET @NumeroAleatorio ROWS FETCH NEXT 1 ROWS ONLY
             ) AS Subconsulta
        END
		END
	RETURN @retorno
END
GO
/****** Object:  UserDefinedFunction [dbo].[BuscarProdutoAleatorio]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[BuscarProdutoAleatorio]()
RETURNS VARCHAR(11)
AS
BEGIN
    DECLARE @TotalProduto INT
    DECLARE @NumeroAleatorio INT
    
    SELECT @TotalProduto = COUNT(*) FROM tb_produto
    
    SELECT @NumeroAleatorio = [dbo].[NumeroAleatorio] (1,@TotalProduto)
    
    RETURN (
        SELECT TOP 1 codigo_produto 
        FROM (
            SELECT codigo_produto  
            FROM tb_produto 
            ORDER BY codigo_produto  OFFSET @NumeroAleatorio ROWS FETCH NEXT 1 ROWS ONLY
        ) AS Subconsulta
    )
END
GO
/****** Object:  UserDefinedFunction [dbo].[NumeroAleatorio]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[NumeroAleatorio](@VAL_MIN INT, @VAL_MAX INT)
RETURNS INT
AS
BEGIN
   DECLARE @ALEATORIO INT
   DECLARE @VALOR_ALEATORIO FLOAT
   SELECT @VALOR_ALEATORIO = VALOR_ALEATORIO FROM VW_ALEATORIO
   SET @ALEATORIO = ROUND(((@VAL_MAX - @VAL_MIN - 1) * @VALOR_ALEATORIO + @VAL_MIN), 0)
   RETURN @ALEATORIO
END
GO
/****** Object:  View [dbo].[VW_ALEATORIO]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_ALEATORIO] AS SELECT RAND() AS VALOR_ALEATORIO
GO

/****** Object:  StoredProcedure [dbo].[cargaBase]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cargaBase] (@ANO INT, @MES INT, @ANO_PROX INT, @MES_PROX INT)
AS
BEGIN
DECLARE cur_datas CURSOR FOR
SELECT DATEADD(DAY, number, DATEFROMPARTS(@ANO, @MES, 1)) AS Dia
FROM master..spt_values
WHERE type = 'P'
  AND DATEADD(DAY, number, DATEFROMPARTS(@ANO, @MES, 1)) < DATEFROMPARTS(@ANO_PROX, @MES_PROX, 1)

OPEN cur_datas

DECLARE @data DATE

FETCH NEXT FROM cur_datas INTO @data

WHILE @@FETCH_STATUS = 0
BEGIN
    exec [dbo].[IncluiNotasDia] @data
    
    FETCH NEXT FROM cur_datas INTO @data
END

CLOSE cur_datas
DEALLOCATE cur_datas

END
GO
/****** Object:  StoredProcedure [dbo].[cargaBase2]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cargaBase2] (@ANO INT, @MES INT, @DIA INT, @ANO_PROX INT, @MES_PROX INT, @DIA_PROX INT)
AS
BEGIN
DECLARE cur_datas CURSOR FOR
SELECT DATEADD(DAY, number, DATEFROMPARTS(@ANO, @MES, @DIA)) AS Dia
FROM master..spt_values
WHERE type = 'P'
  AND DATEADD(DAY, number, DATEFROMPARTS(@ANO, @MES, @DIA)) < DATEFROMPARTS(@ANO_PROX, @MES_PROX, @DIA_PROX)

OPEN cur_datas

DECLARE @data DATE

FETCH NEXT FROM cur_datas INTO @data

WHILE @@FETCH_STATUS = 0
BEGIN
    exec [dbo].[IncluiNotasDia] @data
    
    FETCH NEXT FROM cur_datas INTO @data
END

CLOSE cur_datas
DEALLOCATE cur_datas

END
GO
/****** Object:  StoredProcedure [dbo].[cargaBase3]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cargaBase3] (@ANO INT, @MES INT, @ANO_PROX INT, @MES_PROX INT, @MAX INT)
AS
BEGIN
DECLARE @CONTADOR INT
SET @CONTADOR = 1
WHILE @CONTADOR <= @MAX
BEGIN
   exec [dbo].[cargaBase2] @ANO, @MES, 6, @ANO_PROX, @MES, 11;
   exec [dbo].[cargaBase2] @ANO, @MES, 11, @ANO_PROX, @MES, 16;
   exec [dbo].[cargaBase2] @ANO, @MES, 16, @ANO_PROX, @MES, 21;
   exec [dbo].[cargaBase2] @ANO, @MES, 21, @ANO_PROX, @MES, 27;
   exec [dbo].[cargaBase2] @ANO, @MES, 27, @ANO_PROX, @MES_PROX, 1;
END
END
GO
/****** Object:  StoredProcedure [dbo].[gerar_cliente_aleatorio]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[gerar_cliente_aleatorio] (@numeroCLI int)
AS
BEGIN

    DECLARE @contador INT;
    DECLARE @nomes varchar(max);
    DECLARE @sobrenomes varchar(max);
    DECLARE @emails varchar(max);
    DECLARE @cidades varchar(max);
    DECLARE @estados varchar(max);
    DECLARE @numero varchar(100);
    DECLARE @rua varchar(100);
    DECLARE @complemento varchar(100);
	DECLARE @cpf varchar(100);
	DECLARE @nome varchar(100), @sobrenome varchar(100), @email varchar(100), @telefone varchar(100), @cidade varchar(100)
    SET @nomes = 'Ana, Bruno, Carla, Diego, Eduardo, Fernanda, Gabriel, Heloísa, Isadora, João, Karina, Leonardo, Marcela, Natalia, Otávio, Paula, Rafael, Sara, Thiago, Vanessa, William, Alice, Bernardo, Camila, Danilo, Emanuela, Fabiana, Gustavo, Heitor, Isabela, Julia, Lucas, Mariana, Nathalia, Ôscar, Priscila, Rodrigo, Sofia, Taynara, Victor, Yasmim, Zélia, Ágatha, Bárbara, Caio, Dandara, Érica, Felipe, Giovana, Henrique, Ismael, Juliana, Luan, Manuela, Natália, Óscar, Pietra, Rafaela, Sabrina, Thaís, Valentina, Wálter, Xavier, Yasmin, Zara, Aline, Beatriz, Carlos, David, Eliane, Fabrício, Gisele, Higor, Ingrid, Joaquim, Kátia, Lívia, Márcio, Noemi, Otília, Paola, Rafaela, Samuel, Tábata, Uirá, Vanessa, Wellington, Xavier, Yuri, Zélia, Augusto, Bruna, Cesar, Daniel, Elisa, Fernão, Gabriel, Henrique, Isadora,Alessandra, Allan, Alisson, Amanda, Amélia, Anderson, André, Andrea, Aníbal, Antônio, Ariane, Augusto, Beatriz, Bruna, Bruno, Camila, Carlos, Carolina, Cássia, Catarina, Cecília, Célia, César, Christian, Clara, Claudia, Cláudio, Conceição, Cristina, Daniel, Danilo, Débora, Diego, Diogo, Edilene, Edna, Eduardo, Elaine, Elisa, Eliseu, Elizabete, Emerson, Érica, Ester, Eunice, Everaldo, Fabiana, Fabiano, Fabrício, Felipe, Fernanda, Flávia, Flávio, Franciele, Francisco, Gabriela, Genival, Geovana, Geraldo, Gerson, Gilberto, Giovanna, Gisele, Glauber, Guilherme, Gustavo, Helena, Henrique, Ingrid, Isabela, Ismael, Ismaelita, Ivan, Janaína, Jéssica, Joana, João, Jorge, José, Josiane, Júlia, Juliana, Júlio, Karen, Karina, Katia, Kelly, Kellen, Laís, Laisa, Lara, Larissa, Laura, Lays, Leandro, Leticia, Lídia, Lilian, Livia, Lorena, Lourdes, Luciana, Luis, Luiz, Luiza, Luma, Maicon, Marcela, Marcelo, Márcia, Marco, Marcos, Maria, Mariana, Marina, Marisa, Marta, Matheus, Maurício, Melissa, Milena, Miriam, Natália, Nelson, Nilson, Olga, Pamela, Patrícia, Paula, Paulo, Pedro, Priscila, Rafael, Raimunda, Raquel, Rebeca, Regina, Renata, Ricardo, Roberto, Rodrigo, Rosana, Sabrina, Samuel, Sandra, Sara, Sílvia, Silvio, Solange, Sonia, Stefany, Stella, Tainá, Tatiana, Thaís, Thiago, Valéria, Vanessa, Verônica, Vítor, Vivian, Wilson';
    SET @sobrenomes = 'Silva, Santos, Souza, Costa, Oliveira, Pereira, Carvalho, Rodrigues, Almeida, Lima, Gomes, Castro, Nascimento, Ribeiro, Fernandes';
    SET @emails = 'gmail.com, hotmail.com, yahoo.com, uol.com.br, outlook.com';
    SET @cidades = 'São Paulo, Rio de Janeiro, Belo Horizonte, Salvador, Brasília, Fortaleza, Recife, Curitiba, Manaus, Porto Alegre,Natal, Goiânia, Cuiabá, Vitória, São Luís, João Pessoa, Aracaju, Blumenau, Bauru, Palmas,Palmas, Boa Vista, Macapá, Santarém, Caruaru, Juazeiro do Norte, Sobral, Teresópolis, Teófilo Otoni, Teixeira de Freitas, São Mateus, Sete Lagoas, Lavras, Ipatinga, Pouso Alegre, Guaratinguetá, Lorena, Ribeirão Pires, Cubatão, Itanhaém,Maringá, Cascavel, Passo Fundo, Lages, São José dos Campos, Marília, Franca, São Carlos, Barretos, Caraguatatuba, Assis, Ourinhos, Botucatu, Registro, Itapecerica da Serra, Jacareí, São Roque, Cotia, Itatiba, Bragança Paulista,Feira de Santana, Vitória da Conquista, Imperatriz, Parnaíba, Picos, Araguaína, Pindamonhangaba, Botucatu, Penápolis, Salto, Lençóis Paulista, Guarapari, Teófilo Otoni, Santa Cruz do Sul, Cachoeira do Sul, Santa Maria, Palmeira das Missões, Lages, Arapongas, Tatuí, Leme, Barra Bonita, Andradina, Valença, São João da Boa Vista, Itapetininga, São Lourenço, Itajubá, Camaquã, Viamão,Aparecida de Goiânia, Divinópolis, Formiga, Arapiraca, Rio Largo, Eunápolis, Irecê, Guanambi, Campo Maior, Crateús, Codó, Bacabal, Santa Luzia, Sete Lagoas, Muriaé, Três Corações, Ijuí, Frederico Westphalen, Chapecó, Tijucas, Criciúma, Araranguá, Gaspar, Pouso Alegre, Passos, Barbacena, Caratinga, Barra Mansa, Três Rios, Nilópolis';
    
	
SET @CONTADOR = 1
WHILE @CONTADOR <= @numeroCLI
BEGIN

SELECT TOP 1 @nome = value
FROM (
    SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rownum
    FROM STRING_SPLIT(@nomes, ',')
) AS names
WHERE rownum = CEILING(RAND() * (SELECT COUNT(*) FROM STRING_SPLIT(@nomes, ',')))
	
	SELECT TOP 1 @sobrenome = value
FROM (
    SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rownum
    FROM STRING_SPLIT(@sobrenomes, ',')
) AS sobrenames
WHERE rownum = CEILING(RAND() * (SELECT COUNT(*) FROM STRING_SPLIT(@sobrenomes, ',')))

SELECT TOP 1 @email = value
FROM (
    SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rownum
    FROM STRING_SPLIT(@emails, ',')
) AS emails
WHERE rownum = CEILING(RAND() * (SELECT COUNT(*) FROM STRING_SPLIT(@emails, ',')))

SELECT TOP 1 @cidade = value
FROM (
    SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rownum
    FROM STRING_SPLIT(@cidades, ',')
) AS cidades
WHERE rownum = CEILING(RAND() * (SELECT COUNT(*) FROM STRING_SPLIT(@cidades, ',')))
	
SET @telefone = CAST(RAND(ABS(CHECKSUM(NEWID()))) * 100000000 AS BIGINT);

SET @numero = FLOOR(RAND() * 10000) + 1;
SET @rua = CONCAT('Rua ', FLOOR(RAND() * 1000) + 1);
SET @complemento = CONCAT('Apto. ', FLOOR(RAND() * 100) + 1);
SET @cpf = CONCAT(
    CONVERT(NVARCHAR(3), ABS(CHECKSUM(NEWID())) % 900 + 100),
    CONVERT(NVARCHAR(3), ABS(CHECKSUM(NEWID())) % 1000),
    CONVERT(NVARCHAR(3), ABS(CHECKSUM(NEWID())) % 1000),
    CONVERT(NVARCHAR(2), ABS(CHECKSUM(NEWID())) % 100)
);


    INSERT INTO tb_cliente 
	(cpf, nome, sobrenome, email, telefone, cidade, numero, rua, complemento) VALUES (
	@cpf, @nome, @sobrenome, @email, @telefone, @cidade, @numero, @rua, @complemento);
	SET @CONTADOR = @CONTADOR + 1;
END;
END;
GO
/****** Object:  StoredProcedure [dbo].[IncluiNotaFiscal]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IncluiNotaFiscal] (@DATA DATE)
AS
BEGIN
DECLARE @CLIENTE VARCHAR(20)
DECLARE @LOJA VARCHAR(20)
DECLARE @PRODUTO VARCHAR(20)
DECLARE @NUMERO INT
DECLARE @NUM_ITENS INT
DECLARE @CONTADOR INT
DECLARE @QUANTIDADE INT
DECLARE @PRECO FLOAT
DECLARE @LISTAPRODUTOS TABLE (PRODUTO VARCHAR(20))
DECLARE @CONTADOR_PRODUTO INT
BEGIN TRY
   SET @CLIENTE = [dbo].[BuscarClienteAleatorio]()
END TRY
BEGIN CATCH
   SET @CLIENTE = '6203236194'
END CATCH
BEGIN TRY
 SET @LOJA = [dbo].[BuscarLojaAleatorio](@CLIENTE)
END TRY
BEGIN CATCH
  SET @LOJA = '1'
END CATCH
SELECT @NUMERO = COUNT(*) + 1 FROM tb_nota
SET @NUM_ITENS = [dbo].[NumeroAleatorio](20,50)
SET @CONTADOR = 1
SET NOCOUNT ON
INSERT INTO [dbo].[tb_nota] (cpf, codigo_loja, data, numero)
VALUES (@CLIENTE, @LOJA, @DATA, @NUMERO)
WHILE @CONTADOR <= @NUM_ITENS
BEGIN
    BEGIN TRY
	    SET @PRODUTO = [dbo].[BuscarProdutoAleatorio]()
	END TRY
	BEGIN CATCH
	   SET @PRODUTO = '1'
	END CATCH
	SELECT @CONTADOR_PRODUTO = COUNT(*) FROM @LISTAPRODUTOS WHERE PRODUTO = @PRODUTO
	IF @CONTADOR_PRODUTO = 0
	BEGIN
	   SET @QUANTIDADE = [dbo].[NumeroAleatorio](5,10)
	   SELECT @PRECO = [dbo].[NumeroAleatorio](1,5)
	   INSERT INTO [tb_item] (numero, [codigo_produto], quantidade, [preco])
	   VALUES (@NUMERO, @PRODUTO, @QUANTIDADE, @PRECO)
	   SET @CONTADOR = @CONTADOR + 1
	END
	INSERT INTO @LISTAPRODUTOS (PRODUTO) VALUES (@PRODUTO)
END

END
GO
/****** Object:  StoredProcedure [dbo].[IncluiNotasDia]    Script Date: 31/10/2023 19:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IncluiNotasDia] (@DATA DATE)
AS
BEGIN
DECLARE @NUM_NOTAS INT
DECLARE @CONTADOR INT
SET @NUM_NOTAS = [dbo].[NumeroAleatorio](50,150)
SET @CONTADOR = 1
WHILE @CONTADOR <= @NUM_NOTAS
BEGIN
    EXEC [dbo].[IncluiNotaFiscal] @DATA
    SET @CONTADOR = @CONTADOR + 1
END

END
GO
