USE CINEMA
GO

-----------------------------CARGA PARA O FATO_VENDA INGRESSO--------------------------------------------

CREATE PROCEDURE SP_FATO_VENDA_INGRESSO(@data_carga DATETIME)
AS
BEGIN
	DECLARE @cod_compra INT, @dt_venda DATE, @hora_venda TIME, @cod_endereco INT, @cod_ingresso INT, @cod_pagamento INT,@cod_cliente INT, @cod_cinema INT,
							 @cod_plataforma INT, @cod_filme INT, @cod_sessao INT,@cod_plano INT,@valor_pago numeric(10,2), @quantidade INT
	DECLARE @id_endereco INT, @id_tempo INT, @id_pagamento INT, @id_cliente INT, @id_cinema INT, @id_plataforma INT, @turno VARCHAR(20), 
			@id_turno INT, @id_filme INT, @id_sessao INT, @id_plano INT

	DECLARE C_FATO_INGRESSO CURSOR FOR SELECT COD_COMPRA, DT_VENDA, HORA_VENDA, ID_INGRESSO, ID_ENDERECO, ID_PAGAMENTO, ID_CLIENTE, 
										      ID_CINEMA, ID_PLATAFORMA, ID_FILME, ID_SESSAO, ID_PLANO, QUANTIDADE, VALOR_PAGO 
									   FROM TB_AUX_FATO_VENDA_INGRESSO WHERE DATA_CARGA = @data_carga

	OPEN C_FATO_INGRESSO 

	FETCH C_FATO_INGRESSO INTO @cod_compra, @dt_venda, @hora_venda, @cod_ingresso, @cod_endereco, @cod_pagamento, @cod_cliente,
							   @cod_cinema, @cod_plataforma, @cod_filme, @cod_sessao, @cod_plano, @quantidade, @valor_pago

	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_compra IS NULL OR @dt_venda IS NULL OR @hora_venda IS NULL OR @cod_ingresso IS NULL OR @cod_endereco IS NULL OR
			   @cod_pagamento IS NULL OR @cod_cliente IS NULL OR @cod_cinema IS NULL OR @cod_plataforma IS NULL OR @cod_filme IS NULL OR 
			   @cod_sessao IS NULL OR @cod_plano IS NULL OR @quantidade IS NULL OR @valor_pago IS NULL)

				BEGIN
					INSERT INTO TB_VIOLACAO_FATO_VENDA_INGRESSO(DATA_CARGA, COD_COMPRA, ID_INGRESSO, ID_ENDERECO, ID_PAGAMENTO,ID_CLIENTE,
																ID_CINEMA, ID_PLATAFORMA, ID_FILME, ID_SESSAO, ID_PLANO, QUANTIDADE,
																VALOR_PAGO, DATA_VIOLACAO, VIOLACAO)
					VALUES(@data_carga, @cod_compra, @cod_ingresso, @cod_endereco, @cod_pagamento, @cod_cliente, @cod_cinema, @cod_plataforma,
						   @cod_filme, @cod_sessao, @cod_plano, @quantidade, @valor_pago, GETDATE(),'LINHA POSSUI ABRIBUTO NULL')
				END
			ELSE
				BEGIN
					SET @id_endereco = (SELECT ID_ENDERECO FROM DIM_ENDERECO_CLIENTE WHERE COD_ENDERECO = @cod_endereco)		
					SET @id_tempo =(SELECT ID_TEMPO FROM DIM_TEMPO WHERE DATA = @dt_venda)	
					SET @id_pagamento =(SELECT ID_PAGAMENTO FROM DIM_PAGAMENTO WHERE COD_PAGAMENTO = @cod_pagamento)
					SET @id_cliente =(SELECT ID_CLIENTE FROM DIM_CLIENTE WHERE COD_CLIENTE = @cod_cliente)
					SET @id_cinema =(SELECT ID_CINEMA FROM DIM_CINEMA WHERE COD_CINEMA = @cod_cinema)
					SET @id_plataforma =(SELECT ID_PLATAFORMA FROM DIM_PLATAFORMA WHERE COD_PLATAFORMA = @cod_plataforma)
					SET @id_filme = (SELECT ID_FILME FROM DIM_FILME WHERE COD_FILME = @cod_filme)
					SET @id_sessao = (SELECT ID_SESSAO FROM DIM_SESSAO WHERE COD_SESSAO = @cod_sessao)
					SET @id_plano = (SELECT ID_PLANO FROM DIM_PLANO WHERE COD_PLANO = @cod_plano)

					IF(@hora_venda >= '10:00' AND @hora_venda <= '18:00')
						BEGIN
							SET @turno = 'MATINE'
						END
					ELSE 
						BEGIN
							SET @turno = 'NOITE'
						END
					SET @id_turno =(SELECT ID_TURNO FROM DIM_TURNO WHERE TIPO = @turno)

					IF(EXISTS(SELECT 1 FROM FATO_VENDA_INGRESSO WHERE COD_COMPRA = @cod_compra))
						BEGIN
							UPDATE FATO_VENDA_INGRESSO SET ID_INGRESSO = @cod_ingresso, ID_ENDERECO = @id_endereco, ID_TEMPO = @id_tempo,
														   ID_PAGAMENTO = @id_pagamento, ID_CLIENTE = @id_cliente, ID_CINEMA = @id_cinema,
														   ID_PLATAFORMA = @id_plataforma, ID_TURNO = @id_turno, ID_FILME = @id_filme,
														   ID_SESSAO = @id_sessao, ID_PLANO = @id_plano, QUANTIDADE = @quantidade, VALOR_PAGO = @valor_pago
							WHERE COD_COMPRA = @cod_compra
						END
					ELSE
						BEGIN
							INSERT INTO FATO_VENDA_INGRESSO(COD_COMPRA, ID_INGRESSO, ID_ENDERECO, ID_TEMPO, ID_PAGAMENTO, ID_CLIENTE, ID_CINEMA,
													ID_PLATAFORMA, ID_TURNO, ID_FILME, ID_SESSAO, ID_PLANO, QUANTIDADE, VALOR_PAGO)
							VALUES(@cod_compra, @cod_ingresso, @id_endereco, @id_tempo, @id_pagamento, @id_cliente, @id_cinema, @id_plataforma,
								   @id_turno, @id_filme, @id_sessao, @id_plano,@quantidade, @valor_pago)
						END
				END

			FETCH C_FATO_INGRESSO INTO @cod_compra, @dt_venda, @hora_venda, @cod_ingresso, @cod_endereco, @cod_pagamento, @cod_cliente,
							   @cod_cinema, @cod_plataforma, @cod_filme, @cod_sessao, @cod_plano, @quantidade, @valor_pago
		END
	CLOSE C_FATO_INGRESSO
	DEALLOCATE C_FATO_INGRESSO
END

-----------------------------CARGA PARA A DIM_FILME-----------------------------------------------------
GO


CREATE PROCEDURE SP_DIM_FILME(@data_carga DATETIME)
AS
BEGIN
	DECLARE @cod_filme INT, @nm_filme VARCHAR(45), @gr_filme VARCHAR(45), @pdt_filme VARCHAR(45), @dir_filme VARCHAR(45), @dur_filme INT

	DECLARE C_FILME CURSOR FOR SELECT COD_FILME, NM_FILME, GR_FILME, PDT_FILME,DIR_FILME, DUR_FILME 
							   FROM TB_AUX_FILME WHERE DATA_CARGA = @data_carga

	OPEN C_FILME 

	FETCH C_FILME INTO @cod_filme, @nm_filme, @gr_filme, @pdt_filme, @dir_filme, @dur_filme
	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_filme IS NULL OR @nm_filme IS NULL OR @gr_filme IS NULL OR @pdt_filme IS NULL OR  @dir_filme IS NULL OR @dur_filme IS NULL)
				BEGIN
					INSERT INTO TB_VIOLACAO_FILME(DATA_CARGA, COD_FILME, NM_FILME, GR_FILME, PDT_FILME,DIR_FILME, DUR_FILME, DATA_VIOLACAO, VIOLACAO)
					VALUES(@data_carga, @cod_filme, @nm_filme, @gr_filme, @pdt_filme, @dir_filme, @dur_filme, GETDATE(), 'LINHA POSSUI ABRIBUTO NULL')
				END
			ELSE
				BEGIN
					IF(EXISTS(SELECT 1 FROM DIM_FILME WHERE COD_FILME = @cod_filme))
						BEGIN
							UPDATE DIM_FILME SET NM_FILME = @nm_filme, GR_FILME = @gr_filme, 
								   PDT_FILME = @pdt_filme, DIR_FILME = @dir_filme, DUR_FILME = @dur_filme
							WHERE COD_FILME = @cod_filme
						END
					ELSE
						BEGIN
							INSERT INTO DIM_FILME(COD_FILME, NM_FILME, GR_FILME, PDT_FILME,DIR_FILME, DUR_FILME )
							VALUES(@cod_filme,@nm_filme, @gr_filme, @pdt_filme, @dir_filme, @dur_filme)
						END
				END
			FETCH C_FILME INTO @cod_filme, @nm_filme, @gr_filme, @pdt_filme, @dir_filme, @dur_filme
		END
	CLOSE C_FILME
	DEALLOCATE C_FILME 
END
 
-----------------------------CARGA PARA A DIM_SESSAO----------------------------------------------------
GO


CREATE PROCEDURE SP_DIM_SESSAO (@data_carga DATETIME)
AS 
BEGIN
	DECLARE @cod_sessao INT, @hr_sessao TIME, @data_sessao DATE, @linguagem_sessao varchar(45)

	DECLARE  C_SESSAO CURSOR FOR SELECT COD_SESSAO, HORA_SESSAO, DATA_SESSAO, LINGUAGEM_SESSAO 
	                             FROM TB_AUX_SESSAO WHERE DATA_CARGA = @data_carga
	OPEN C_SESSAO

	FETCH C_SESSAO INTO @cod_sessao, @hr_sessao, @data_sessao, @linguagem_sessao
	
	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_sessao IS NULL OR @hr_sessao IS NULL OR @data_sessao IS NULL OR @linguagem_sessao IS NULL)
				BEGIN
					INSERT INTO TB_VIOLACAO_SESSAO(DATA_CARGA, COD_SESSAO, HORA_SESSAO, DATA_SESSAO, LINGUAGEM_SESSAO, DATA_VIOLACAO, VIOLACAO)
					VALUES(@data_carga, @cod_sessao, @hr_sessao, @data_sessao, @linguagem_sessao, GETDATE(), 'LINHA POSSUI ABRIBUTO NULL')
				END
			ELSE
				BEGIN
					IF(EXISTS(SELECT 1 FROM DIM_SESSAO WHERE COD_SESSAO = @cod_sessao))
						BEGIN
							UPDATE DIM_SESSAO SET HORA_SESSAO = @hr_sessao, DATA_SESSAO = @data_sessao, LINGUAGEM_SESSAO = @linguagem_sessao 
							WHERE COD_SESSAO = @cod_sessao
						END
					ELSE
						BEGIN
							INSERT INTO DIM_SESSAO (COD_SESSAO, HORA_SESSAO, DATA_SESSAO, LINGUAGEM_SESSAO)
							VALUES(@cod_sessao, @hr_sessao, @data_sessao, @linguagem_sessao)
						END
				END
			FETCH C_SESSAO INTO @cod_sessao, @hr_sessao, @data_sessao, @linguagem_sessao
		END
	CLOSE C_SESSAO
	DEALLOCATE C_SESSAO
END


-----------------------------CARGA PARA A DIM_PLANO-----------------------------------------------------
GO

CREATE PROCEDURE SP_DIM_PLANO (@data_carga DATETIME)
AS
BEGIN
	DECLARE @cod_plano INT , @tipo_plano VARCHAR(45)

	DECLARE C_PLANO CURSOR FOR SELECT COD_PLANO, TIPO_PLANO FROM TB_AUX_PLANO WHERE DATA_CARGA = @data_carga

	OPEN C_PLANO
	FETCH C_PLANO INTO @cod_plano, @tipo_plano
	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_plano IS NULL OR @tipo_plano IS NULL)
				BEGIN
					INSERT INTO TB_VIOLACAO_PLANO(DATA_CARGA, TIPO_PLANO, DATA_VIOLACAO, VIOLACAO)
					VALUES(@data_carga, @tipo_plano, GETDATE(), 'LINHA POSSUI ABRIBUTO NULL')
				END
			ELSE
				BEGIN
					IF(EXISTS(SELECT 1 FROM DIM_PLANO WHERE COD_PLANO = @cod_plano))
						BEGIN
							UPDATE DIM_PLANO SET TIPO_PLANO = @tipo_plano
						END
					ELSE
						BEGIN
							INSERT INTO DIM_PLANO(COD_PLANO, TIPO_PLANO)
							VALUES(@cod_plano, @tipo_plano)
						END
				END
			FETCH C_PLANO INTO @cod_plano, @tipo_plano
		END
	CLOSE C_PLANO
	DEALLOCATE C_PLANO
END

--------------------------------------------- CARGA DIMENSÃO INGRESSO ----------------------------------------------------------
GO

CREATE PROCEDURE SP_DIM_INGRESSO(@data_carga DATETIME)
AS
BEGIN
	DECLARE @cod_ingresso INT, @disponibilidade VARCHAR(45), @valor_pago NUMERIC(10,2);
	DECLARE C_INGRESSO CURSOR FOR SELECT COD_INGRESSO, DISPONIBILIDADE, VALOR_INGRESSO FROM TB_AUX_INGRESSO

	OPEN C_INGRESSO 
	
	FETCH C_INGRESSO INTO @cod_ingresso, @disponibilidade, @valor_pago
	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_ingresso IS NULL OR @disponibilidade IS NULL OR @valor_pago IS NULL)
				BEGIN
					INSERT INTO TB_VIOLACAO_INGRESSO(DATA_CARGA, COD_INGRESSO, DISPONIBILIDADE, VALOR_INGRESSO, DATA_VIOLACAO, VIOLACAO)
					VALUES(@data_carga, @cod_ingresso, @disponibilidade, @valor_pago, GETDATE(), 'LINHA POSSUI ALGUM ATRIBUTO NULL')
				END
			ELSE
				BEGIN
					IF(EXISTS(SELECT 1 FROM DIM_INGRESSO WHERE COD_INGRESSO = @cod_ingresso))
						BEGIN
							UPDATE DIM_INGRESSO SET DISPONIBILIDADE = @disponibilidade, VALOR_INGRESSO = @valor_pago
							 WHERE COD_INGRESSO = @cod_ingresso
						END
					ELSE
						BEGIN
							INSERT INTO DIM_INGRESSO(COD_INGRESSO, DISPONIBILIDADE, VALOR_INGRESSO)
							VALUES(@cod_ingresso, @disponibilidade, @valor_pago)
						END
				END

			FETCH C_INGRESSO INTO @cod_ingresso, @disponibilidade, @valor_pago
		END
END

EXEC SP_DIM_INGRESSO '20180101'

