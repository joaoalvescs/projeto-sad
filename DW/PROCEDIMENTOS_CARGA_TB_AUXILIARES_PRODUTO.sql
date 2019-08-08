-----------------------------CARGA PARA A TB_AUX VENDA_PRODUTO-------------------------------------------

CREATE PROCEDURE SP_OLTP_FATO_VENDA_PRODUTO(@data DATETIME)
AS
BEGIN
	DECLARE @cod_compra INT, @dt_venda DATE, @hora_venda TIME, @id_endereco INT, @id_produto INT, @tipo_pag VARCHAR(25),
			@id_cliente INT, @id_cinema INT, @id_plataforma INT, @valor_compra NUMERIC(10,2)

	DELETE FROM TB_AUX_FATO_VENDA_PRODUTO WHERE DATA_CARGA = @data
	
	DECLARE C_FATO_VENDA CURSOR FOR SELECT COM.CODIGO_COMPRA, COM.DATA_COMPRA, COM.HORA_COMPRA, COM.VALOR_COMPRA,COM.ID_CINEMA,C.ID_CLIENTE,
										   COM.TIPO_PAGAMENTO, COM.ID_PLATAFORMA,E.ID_ENDERECO, P.ID_PRODUTO FROM TB_COMPRA AS COM
										   INNER JOIN TB_CLIENTE AS C ON(COM.ID_CLIENTE = C.ID_CLIENTE) 
										   INNER JOIN TB_ENDERECO AS E ON(C.ID_ENDERECO = E.ID_ENDERECO)
										   INNER JOIN TB_COMPRA_PRODUTO AS P ON(P.ID_COMPRA = COM.ID_COMPRA)	
	OPEN C_FATO_VENDA

	FETCH C_FATO_VENDA INTO @cod_compra, @dt_venda, @hora_venda, @valor_compra,@id_cinema, @id_cliente, @tipo_pag, @id_plataforma,
							@id_endereco, @id_produto

	WHILE(@@FETCH_STATUS = 0)
	BEGIN 
		INSERT INTO TB_AUX_FATO_VENDA_PRODUTO
		VALUES(@data, @cod_compra, @dt_venda, @hora_venda, @id_endereco, @id_produto, @tipo_pag, @id_cliente, @id_cinema, @id_plataforma,
			   @valor_compra, 1)

		FETCH C_FATO_VENDA INTO @cod_compra, @dt_venda, @hora_venda, @valor_compra,@id_cinema, @id_cliente, @tipo_pag, @id_plataforma,
							@id_endereco, @id_produto
	END
END




-----------------------------CARGA PARA A TB_AUX_CLIENTE-------------------------------------------

CREATE PROCEDURE SP_OLTP_CLIENTE(@data DATETIME)
AS
BEGIN
	DECLARE @id INT,@cpf VARCHAR(15),@sexo varchar(1), @nome VARCHAR(45),@sobrenome VARCHAR(45),@dt_nascimento DATE
	DELETE FROM TB_AUX_CLIENTE WHERE DATA_CARGA = @data 

	DECLARE C_CLIENTE CURSOR FOR SELECT C.ID_CLIENTE, P.CPF,P.SEXO,P.NOME, P.SOBRENOME,
										P.DATA_NASCIMENTO FROM TB_CLIENTE AS C
										INNER JOIN TB_PESSOA AS P ON (C.ID_PESSOA = P.ID_PESSOA)
	OPEN C_CLIENTE
	FETCH C_CLIENTE INTO @id, @cpf, @sexo, @nome, @sobrenome, @dt_nascimento
	WHILE(@@FETCH_STATUS = 0)
		BEGIN 
			INSERT INTO TB_AUX_CLIENTE
			VALUES(@data, @id, @cpf, @sexo, @nome, @sobrenome, @dt_nascimento)

			FETCH C_CLIENTE INTO @id, @cpf,@sexo,@nome,@sobrenome,@dt_nascimento
		END
	CLOSE C_CLIENTE
	DEALLOCATE C_CLIENTE
END


-----------------------------CARGA PARA A TB_AUX_ENDERECO_CLIENTE-------------------------------------------

CREATE PROCEDURE SP_OLTP_ENDERECO_CLIENTE(@data DATETIME)
AS 
BEGIN 
	DELETE FROM TB_AUX_ENDERECO_CLIENTE WHERE DATA_CARGA = @data
	INSERT INTO TB_AUX_ENDERECO_CLIENTE
	SELECT @data, ID_ENDERECO, RUA, NUMERO, CIDADE, BAIRRO,COMPLEMENTO, ESTADO, CEP FROM TB_ENDERECO
END


-----------------------------CARGA PARA A TB_AUX_PLATAFORMA-------------------------------------------------

CREATE PROCEDURE SP_OLTP_PLATAFORMA(@data DATETIME)
AS
BEGIN
	DELETE FROM TB_AUX_PLATAFORMA WHERE DATA_CARGA = @data 
	INSERT INTO TB_AUX_PLATAFORMA
	SELECT @data, ID_PLATAFORMA, TIPO FROM TB_PLATAFORMA
END


-----------------------------CARGA PARA A TB_AUX_PRODUTO----------------------------------------------------

CREATE PROCEDURE SP_OLTP_PRODUTO(@data DATETIME)
AS
BEGIN
	DELETE FROM TB_AUX_PRODUTO WHERE DATA_CARGA = @data 
	INSERT INTO TB_AUX_PRODUTO
	SELECT @data, ID_PRODUTO, NOME_PRODUTO,VALOR_PRODUTO FROM TB_PRODUTO
END

-----------------------------CARGA PARA A TB_AUX_PAGAMENTO----------------------------------------------------

CREATE PROCEDURE SP_OLTP_PAGAMENTO(@data DATETIME)
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


-----------------------------CARGA PARA A TB_AUX_CINEMA-----------------------------------------------

CREATE PROCEDURE SP_OLTP_CINEMA(@data DATETIME)
AS 
BEGIN
	DELETE FROM TB_AUX_CINEMA WHERE DATA_CARGA = @data 
	INSERT INTO TB_AUX_CINEMA
	SELECT @data, ID_CINEMA, NOME, DESCRICAO FROM TB_UNIDADE_CINEMA
END


-----------------------------CARGA PARA A TB_AUX_TURNO-------------------------------------------

CREATE PROCEDURE SP_OLTP_TURNO(@data DATETIME)
AS
BEGIN
	DELETE FROM TB_AUX_TURNO WHERE DATA_CARGA = @data
	INSERT INTO TB_AUX_TURNO 
	SELECT @data, ID_TURNO, TIPO FROM TB_TURNO
END

