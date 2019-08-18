-----------------------------CARGA PARA A TB_AUX VENDA_INGRESSO-------------------------------------------

CREATE PROCEDURE SP_OLTP_FATO_VENDA_INGRESSO(@data DATETIME)
AS
BEGIN
	DECLARE @cod_compra INT, @id_ingresso INT, @id_endereco INT, @dt_venda DATE, @hora_venda TIME, @tipo_pag VARCHAR(25),
			@id_cliente INT, @id_cinema INT, @id_plataforma INT, @id_filme INT, @id_sessao INT, @tipo_plano VARCHAR(45), @valor_compra NUMERIC(10,2)

	DELETE FROM TB_AUX_FATO_VENDA_INGRESSO WHERE DATA_CARGA = @data
	
	DECLARE C_FATO_VENDA CURSOR FOR SELECT COM.CODIGO_COMPRA, COM.DATA_COMPRA, COM.HORA_COMPRA, COM.VALOR_COMPRA, COM.ID_CINEMA, C.ID_CLIENTE,
										   COM.ID_PLATAFORMA,E.ID_ENDERECO, CI.ID_INGRESSO, I.ID_FILME, I.ID_SESSAO, I.PLANO_USADO FROM TB_COMPRA AS COM
										   INNER JOIN TB_CLIENTE AS C ON(COM.ID_CLIENTE = C.ID_CLIENTE) 
										   INNER JOIN TB_ENDERECO AS E ON(C.ID_ENDERECO = E.ID_ENDERECO)
										   INNER JOIN TB_COMPRA_INGRESSO AS CI ON(CI.ID_COMPRA = COM.ID_COMPRA)
										   INNER JOIN TB_INGRESSO AS I ON(I.ID_INGRESSO = CI.ID_INGRESSO)
	OPEN C_FATO_VENDA

	FETCH C_FATO_VENDA INTO @cod_compra, @dt_venda, @hora_venda, @valor_compra,@id_cinema, @id_cliente, @id_plataforma,
							@id_endereco, @id_ingresso, @id_filme, @id_sessao, @

	WHILE(@@FETCH_STATUS = 0)
	BEGIN 
		INSERT INTO TB_AUX_FATO_VENDA_INGRESSO
		VALUES(@data, @cod_compra, @dt_venda, @hora_venda, @id_endereco, @id_produto, @cod_compra, @id_cliente, @id_cinema, @id_plataforma,
			   @valor_compra, 1)

		FETCH C_FATO_VENDA INTO @cod_compra, @dt_venda, @hora_venda, @valor_compra,@id_cinema, @id_cliente, @id_plataforma,
							@id_endereco, @id_produto
	END
	CLOSE C_FATO_VENDA
	DEALLOCATE C_FATO_VENDA
END
END

-----------------------------CARGA PARA A TB_AUX_FILME-------------------------------------------
CREATE PROCEDURE SP_OLTP_TB_AUX_FILME (@data DATETIME)
AS
BEGIN 
	DELETE FROM TB_AUX_FILME WHERE DATA_CARGA = @data
	INSERT INTO TB_AUX_FILME
	SELECT @data, ID_FILME, NOME, GENERO, PRODUTORA, DIRETOR, DURACAO FROM TB_FILME
END
-----------------------------CARGA PARA A TB_AUX_SESSAO-------------------------------------------

CREATE PROCEDURE SP_OLTP_TB_AUX_SESSAO (@data DATETIME)
AS 
BEGIN
	DELETE FROM TB_AUX_SESSAO WHERE DATA_CARGA = @data
	INSERT INTO TB_AUX_SESSAO
	SELECT @data, ID_SESSAO, HORARIO_SESSAO, DATA_SESSAO, LINGUAGEM FROM TB_SESSAO
END

-----------------------------CARGA PARA A TB_AUX_PLANO_USADO-------------------------------------------
CREATE PROCEDURE SP_OLTP_TB_AUX_PLANO_USADO(@data DATETIME)
AS
BEGIN
	DECLARE @cod_ingresso INT, @plano VARCHAR(45)

	DECLARE C_PLANO CURSOR FOR SELECT ID_INGRESSO, PLANO_USADO FROM TB_INGRESSO
	OPEN C_PLANO 

	FETCH C_PLANO INTO @cod_ingresso, @plano
	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			INSERT INTO TB_AUX_PLANO_USADO
			VALUES(@data, @cod_ingresso, @plano)
			FETCH C_PLANO INTO @cod_ingresso, @plano
		END 
	CLOSE C_PLANO
	DEALLOCATE C_PLANO
END