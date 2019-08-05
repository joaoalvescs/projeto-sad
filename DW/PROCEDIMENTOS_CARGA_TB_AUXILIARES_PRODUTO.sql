/*CARGA PARA A TB_AUX VENDA_PRODUTO*/



/* CARGA PARA O TB_AUX_CLIENTE*/
CREATE PROCEDURE SP_OLTP_CLIENTE(@data DATETIME)
AS
BEGIN
	DECLARE @id INT,@cpf VARCHAR(15),@sexo varchar(1), @nome VARCHAR(45),@sobrenome VARCHAR(45),@dt_nascimento DATE
	DELETE FROM TB_AUX_CLIENTE WHERE DATA_CARGA = @data 

	DECLARE C_CLIENTE CURSOR FOR SELECT C.ID_CLIENTE, P.CPF,P.SEXO,P.NOME, P.SOBRENOME,
										P.DATA_NASCIMENTO FROM TB_CLIENTE AS C
										INNER JOIN TB_PESSOA AS P ON (C.ID_PESSOA = P.ID_PESSOA)

	OPEN C_CLIENTE
	FETCH C_CLIENTE INTO @id,@cpf,@sexo,@nome,@sobrenome,@dt_nascimento
	WHILE(@@FETCH_STATUS = 0)
		BEGIN 
			INSERT INTO TB_AUX_CLIENTE
			VALUES(@data, @id, @cpf, @sexo, @nome, @sobrenome, @dt_nascimento)

			FETCH C_CLIENTE INTO @id, @cpf,@sexo,@nome,@sobrenome,@dt_nascimento
		END
	CLOSE C_CLIENTE
	DEALLOCATE C_CLIENTE
END

SELECT * FROM TB_AUX_CLIENTE
EXEC SP_OLTP_CLIENTE '20190101'


/*----------ENDERECO CLIENTE-------------*/

CREATE PROCEDURE SP_OLTP_ENDERECO_CLIENTE(@data DATETIME)
AS 
BEGIN 
	DELETE FROM TB_AUX_ENDERECO_CLIENTE WHERE DATA_CARGA = @data 
	INSERT INTO TB_AUX_ENDERECO_CLIENTE
	SELECT @data, ID_ENDERECO, RUA, NUMERO, CIDADE, BAIRRO,COMPLEMENTO, ESTADO, CEP FROM TB_ENDERECO
END

SELECT * FROM TB_AUX_ENDERECO_CLIENTE
EXEC SP_OLTP_ENDERECO_CLIENTE '20190101'


/*------------PLATAFORMA---------------*/
CREATE PROCEDURE SP_OLTP_PLATAFORMA(@data DATETIME)
AS
BEGIN
	DELETE FROM TB_AUX_PLATAFORMA WHERE DATA_CARGA = @data 
	INSERT INTO TB_AUX_PLATAFORMA
	SELECT @data, ID_PLATAFORMA, TIPO FROM TB_PLATAFORMA
END
EXEC SP_OLTP_PLATAFORMA '20190101'
SELECT * FROM TB_AUX_PLATAFORMA



/*------------PRODUTO---------------*/

CREATE PROCEDURE SP_OLTP_PRODUTO(@data DATETIME)
AS
BEGIN
	DELETE FROM TB_AUX_PRODUTO WHERE DATA_CARGA = @data 
	INSERT INTO TB_AUX_PRODUTO
	SELECT @data, ID_PRODUTO, NOME_PRODUTO,VALOR_PRODUTO FROM TB_PRODUTO
END
SELECT * FROM TB_PRODUTO
EXEC SP_OLTP_PRODUTO '20190101'



/*----------------PAGAMENTO-----------------*/
ALTER PROCEDURE SP_OLTP_PAGAMENTO(@data DATETIME)
AS
BEGIN
	DECLARE @codigo INT, @tipo VARCHAR(25), @valor NUMERIC(10,2)

	DELETE FROM TB_AUX_PAGAMENTO WHERE DATA_CARGA = @data

	DECLARE C_PAGAMENTO CURSOR FOR SELECT ID_COMPRA,TIPO_PAGAMENTO,VALOR_COMPRA FROM TB_COMPRA
	OPEN C_PAGAMENTO
	FETCH C_PAGAMENTO INTO @codigo, @tipo, @valor

	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		INSERT INTO TB_AUX_PAGAMENTO 
		VALUES(@data, @codigo,@tipo, @valor)

		FETCH C_PAGAMENTO INTO @codigo, @tipo, @valor
	END
	CLOSE C_PAGAMENTO
	DEALLOCATE C_PAGAMENTO
END

EXEC SP_OLTP_PAGAMENTO '20190101'
SELECT * FROM TB_AUX_PAGAMENTO

/*-------------------CINEMA-----------------------*/

CREATE PROCEDURE SP_OLTP_CINEMA(@data DATETIME)
AS 
BEGIN
	DELETE FROM TB_AUX_CINEMA WHERE DATA_CARGA = @data 
	INSERT INTO TB_AUX_CINEMA
	SELECT @data, ID_CINEMA, NOME, DESCRICAO FROM TB_UNIDADE_CINEMA
END


EXEC SP_OLTP_CINEMA '20190101'
SELECT * FROM TB_AUX_CINEMA


/*-------------------TURNO-----------------------------*/

CREATE PROCEDURE SP_OLTP_TURNO(@data DATETIME)
AS
BEGIN
	DELETE FROM TB_AUX_TURNO WHERE DATA_CARGA = @data
	INSERT INTO TB_AUX_TURNO 
	SELECT @data, ID_TURNO, TIPO FROM TB_TURNO
END

EXEC SP_OLTP_TURNO '20190101'
SELECT * FROM TB_TURNO