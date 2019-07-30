/* CARGA PARA O TB_AUX_CLIENTE*/
CREATE PROCEDURE SP_OLTP_CLIENTE(@data DATETIME)
AS
BEGIN
	DECLARE @id INT, @codigo INT,@cpf VARCHAR(15),@sexo varchar(1), @nome VARCHAR(45),@sobrenome VARCHAR(45),@dt_nascimento DATE
	DELETE FROM TB_AUX_CLIENTE WHERE DATA_CARGA = @data 

	DECLARE C_CLIENTE CURSOR FOR SELECT C.ID_CLIENTE,C.ID_PESSOA, P.CPF,P.SEXO,P.NOME, P.SOBRENOME,
										P.DATA_NASCIMENTO FROM TB_CLIENTE AS C
										INNER JOIN TB_PESSOA AS P ON (C.ID_PESSOA = P.ID_PESSOA)

	OPEN C_CLIENTE
	FETCH C_CLIENTE INTO @id, @codigo, @cpf,@sexo,@nome,@sobrenome,@dt_nascimento
	WHILE(@@FETCH_STATUS = 0)
		BEGIN 
			INSERT INTO TB_AUX_CLIENTE
			VALUES(@data, @id, @codigo, @cpf, @sexo, @nome, @sobrenome, @dt_nascimento)

			FETCH C_CLIENTE INTO @id, @codigo, @cpf,@sexo,@nome,@sobrenome,@dt_nascimento
		END
	CLOSE C_CLIENTE
	DEALLOCATE C_CLIENTE
END

/*----------ENDERECO CLIENTE-------------*/

CREATE PROCEDURE SP_OLTP_ENDERECO_CLIENTE(@data DATETIME)
AS 
BEGIN 
	INSERT INTO TB_AUX_ENDERECO_CLIENTE
	SELECT @data, ID_ENDERECO, RUA, NUMERO, CIDADE, BAIRRO,COMPLEMENTO, ESTADO, CEP FROM TB_ENDERECO
END

/*------------PRODUTO---------------*/

CREATE PROCEDURE SP_OLTP_PRODUTO(@data DATETIME)
AS
BEGIN
	INSERT INTO TB_AUX_PRODUTO
	SELECT @data, ID_PRODUTO, NOME_PRODUTO,VALOR_PRODUTO FROM TB_PRODUTO
END

/*----------------PAGAMENTO-----------------*/
CREATE PROCEDURE SP_OLTP_PAGAMENTO(@data DATETIME)
AS
BEGIN
	INSERT INTO TB_AUX_PAGAMENTO
	SELECT @data, ID_COMPRA,TIPO_PAGAMENTO,VALOR_COMPRA FROM TB_COMPRA
END

/*-------------------CINEMA-----------------------*/

CREATE PROCEDURE SP_OLTP_CINEMA(@data DATETIME)
AS 
BEGIN
	INSERT INTO TB_AUX_CINEMA
	SELECT @data, ID_CINEMA, NOME, DESCRICAO FROM TB_UNIDADE_CINEMA
END


EXEC SP_OLTP_CINEMA '20190101'
SELECT * FROM TB_AUX_CINEMA