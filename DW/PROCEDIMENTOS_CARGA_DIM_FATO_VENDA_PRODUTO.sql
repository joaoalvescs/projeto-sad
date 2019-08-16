-----------------------------CARGA PARA A DIM_FATO_VENDA_PRODUTO-------------------------------------------

CREATE PROCEDURE SP_FATO_VENDA_PRODUTO(@data_carga DATETIME)
AS
BEGIN
	DECLARE @cod_compra INT, @dt_venda DATE, @hora_venda TIME, @cod_endereco INT, @cod_produto INT, @tipo_pagamento varchar(25),
			@cod_cliente INT, @cod_cinema INT, @cod_plataforma INT, @valor_pago numeric(10,2), @quantidade INT
	DECLARE @id_endereco INT, @id_tempo INT, @id_produto INT , @id_pagamento INT, @id_cliente INT, @id_cinema INT, @id_plataforma INT, @turno VARCHAR(20), @id_turno INT

	DECLARE C_FATO_PRODUTO CURSOR FOR SELECT COD_COMPRA, DT_VENDA, HORA_VENDA, TIPO_PAGAMENTO,
											 VALOR_PAGO, QUANTIDADE FROM TB_AUX_FATO_VENDA_PRODUTO

	FETCH C_FATO_PRODUTO INTO @cod_compra, @dt_venda, @hora_venda, @cod_endereco, @cod_produto, @tipo_pagamento,
							  @cod_cliente, @cod_cinema, @cod_plataforma, @valor_pago, @quantidade

	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_compra IS NULL OR @dt_venda IS NULL OR @hora_venda IS NULL OR @cod_endereco IS NULL OR @cod_produto IS NULL OR
			   @tipo_pagamento IS NULL OR @cod_cliente IS NULL OR @cod_cinema IS NULL OR @cod_plataforma IS NULL OR @valor_pago IS NULL OR
			   @quantidade IS NULL)
				BEGIN
					INSERT INTO TB_VIOLACAO_FATO_VENDA_PRODUTO(DATA_CARGA, COD_COMPRA, DT_VENDA, HORA_VENDA, ID_ENDERECO, ID_PRODUTO,
															   TIPO_PAGAMENTO, ID_CLIENTE, ID_CINEMA, ID_PLATAFORMA, VALOR_PAGO, QUANTIDADE,
															   DATA_VIOLACAO, VIOLACAO)
					VALUES(@data_carga,@cod_compra, @dt_venda, @hora_venda, @cod_endereco, @cod_produto, @tipo_pagamento,
								  @cod_cliente, @cod_cinema, @cod_plataforma, @valor_pago, @quantidade, GETDATE(), 'LINHA POSSUI ATRINBUTOS NULOS')
				END
			ELSE
				BEGIN
					SET @id_endereco = (SELECT ID_ENDERECO FROM DIM_ENDERECO_CLIENTE WHERE COD_ENDERECO = @cod_endereco)
					SET @id_tempo =(SELECT ID_TEMPO FROM DIM_TEMPO WHERE DATA = @dt_venda)
					SET @id_produto =(SELECT ID_PRODUTO FROM DIM_PRODUTO WHERE COD_PRODUTO = @cod_produto)
					SET @id_pagamento =(SELECT ID_PAGAMENTO FROM DIM_PAGAMENTO WHERE TIPO_PAGAMENTO = @tipo_pagamento)
					SET @id_cliente =(SELECT ID_CLIENTE FROM DIM_CLIENTE WHERE COD_CLIENTE = @cod_cliente)
					SET @id_cinema =(SELECT ID_CINEMA FROM DIM_CINEMA WHERE COD_CINEMA = @cod_cinema)
					SET @id_plataforma =(SELECT ID_PLATAFORMA FROM DIM_PLATAFORMA WHERE COD_PLATAFORMA = @cod_plataforma)
					IF(@hora_venda >= '10:00' AND @hora_venda <= '18:00')
						BEGIN
							SET @turno = 'MATINE'
						END
					ELSE 
						BEGIN
							SET @turno = 'NOITE'
						END
					SET @id_turno =(SELECT ID_TURNO FROM DIM_TURNO WHERE TIPO = @turno)

					INSERT INTO FATO_VENDA_PRODUTO(COD_COMPRA,ID_ENDERECO,ID_TEMPO,ID_PRODUTO,ID_PAGAMENTO,ID_CLIENTE,ID_CINEMA,
								ID_PLATAFORMA,ID_TURNO, QUANTIDADE, VALOR_PAGO)
					VALUES(@cod_compra,@id_endereco,@id_tempo,@id_produto, @id_pagamento,@id_cliente, @id_cinema, @id_plataforma,
						   @id_turno,@quantidade, @valor_pago)
				END

			FETCH C_FATO_PRODUTO INTO @cod_compra, @dt_venda, @hora_venda, @cod_endereco, @cod_produto, @tipo_pagamento,
							  @cod_cliente, @cod_cinema, @cod_plataforma, @valor_pago, @quantidade
		END

	CLOSE C_FATO_PRODUTO
	DEALLOCATE C_FATO_PRODUTO
END

-----------------------------CARGA PARA A DIM_CLIENTE------------------------------------------------------

CREATE PROCEDURE SP_DIM_CLIENTE(@data_carga DATETIME)
AS
BEGIN
	DECLARE @cod_cliente INT, @cpf VARCHAR(15),@sexo varchar(1), @nome VARCHAR(45), @sobrenome VARCHAR(45), @dt_nasc DATE
	DECLARE C_CLIENTE CURSOR FOR SELECT COD_CLIENTE, CPF, SEXO, NOME, SOBRENOME, DT_NASCIMENTO FROM TB_AUX_CLIENTE
								 WHERE DATA_CARGA = @data_carga

	FETCH C_CLIENTE INTO @cod_cliente, @cpf, @sexo, @nome, @sobrenome, @dt_nasc

	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_cliente IS NULL OR @cpf IS NULL OR @sexo IS NULL OR @nome IS NULL OR @sobrenome IS NULL OR @dt_nasc IS NULL)
				BEGIN
					INSERT INTO TB_VIOLACAO_CLIENTE(DATA_CARGA, COD_CLIENTE, CPF, SEXO, NM_CLIENTE, SBR_CLIENTE, DT_NASC_CLIENTE,DATA_VIOLACAO, VIOLACAO)
					VALUES (@data_carga, @cod_cliente, @cpf, @sexo, @nome, @sobrenome, @dt_nasc,GETDATE(), 'LINHA POSSUI ATRINBUTOS NULOS')
				END
			ELSE
				BEGIN
					INSERT INTO DIM_CLIENTE(COD_CLIENTE, CPF, SEXO, NM_CLIENTE, SBR_CLIENTE, DT_NASC_CLIENTE)
					VALUES(@cod_cliente, @cpf, @sexo, @nome, @sobrenome, @dt_nasc)
				END
		END
	CLOSE C_CLIENTE
	DEALLOCATE C_CLIENTE
END

-----------------------------CARGA PARA A DIM_ENDERECO_CLIENTE---------------------------------------------

CREATE PROCEDURE SP_DIM_ENDERECO_CLIENTE (@data_carga DATETIME)
AS
BEGIN
	DECLARE @cod_endereco INT, @rua VARCHAR(45),@numero VARCHAR(45), @cidade VARCHAR(45), @bairro VARCHAR(45), 
			@complemento VARCHAR(45), @estado VARCHAR(45), @cep VARCHAR(15) 

	DECLARE C_ENDERECO_CLIENTE CURSOR FOR SELECT COD_ENDERECO, RUA, NUMERO, CIDADE, BAIRRO, COMPLEMETO, ESTADO, CEP FROM TB_AUX_ENDERECO_CLIENTE
	OPEN C_ENDERECO_CLIENTE

	FETCH C_ENDERECO_CLIENTE INTO @cod_endereco, @rua, @numero, @cidade, @bairro, @complemento, @estado, @cep
	
	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_endereco IS NULL OR @rua IS NULL OR  @numero IS NULL OR @cidade IS NULL OR @bairro IS NULL OR
			  @complemento IS NULL OR @estado IS NULL OR @cep IS NULL)
				BEGIN
					INSERT INTO TB_VIOLACAO_ENDERECO_CLIENTE(DATA_CARGA, RUA, NUMERO, CIDADE, BAIRRO, COMPLEMETO, ESTADO, CEP,DATA_VIOLACAO, VIOLACAO)
					VALUES(@data_carga, @rua, @numero, @cidade, @bairro, @complemento, @estado, @cep, GETDATE(),'LINHA POSSUI ATRINBUTOS NULOS')
				END
			ELSE
				BEGIN
					IF(EXISTS(SELECT 1 FROM DIM_ENDERECO_CLIENTE WHERE COD_ENDERECO = @cod_endereco))
						BEGIN
							IF(EXISTS(SELECT 1 FROM DIM_ENDERECO_CLIENTE WHERE (RUA <> @rua OR NUMERO <> @numero OR CIDADE <> @cidade OR
																				BAIRRO <> @bairro OR ESTADO <> @estado OR CEP <> @cep)))
							BEGIN
								UPDATE DIM_ENDERECO_CLIENTE SET RUA = @rua, NUMERO = @numero, CIDADE = @cidade, BAIRRO = @bairro, 
																ESTADO = @estado, CEP = @cep
							END
						END
					ELSE
						BEGIN
							INSERT INTO DIM_ENDERECO_CLIENTE(COD_ENDERECO, RUA, NUMERO, CIDADE, BAIRRO, ESTADO, CEP)
							VALUES(@cod_endereco, @rua, @numero, @cidade, @bairro, @estado, @cep)
						END
				END

			FETCH C_ENDERECO_CLIENTE INTO @cod_endereco, @rua, @numero, @cidade, @bairro, @complemento, @estado, @cep
		END
	CLOSE C_ENDERECO_CLIENTE
	DEALLOCATE C_ENDERECO_CLIENTE
END
-----------------------------CARGA PARA A DIM_PLATAFORMA---------------------------------------------------

CREATE PROCEDURE SP_DIM_PLATAFORMA (@data_carga DATETIME)
AS 
BEGIN
	DECLARE @cod_plataforma INT, @Tipo_plataforma VARCHAR(45)

	DECLARE C_PLATAFORMA CURSOR FOR SELECT COD_PLATAFORMA, TIPO_PLATAFORMA FROM TB_AUX_PLATAFORMA WHERE DATA_CARGA = @data_carga
	OPEN C_PLATAFORMA

	FETCH C_PLATAFORMA INTO @cod_plataforma, @tipo_plataforma

	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_plataforma IS NULL OR @tipo_plataforma IS NULL)
				BEGIN
					INSERT INTO TB_VIOLACAO_PLATAFORMA(DATA_CARGA,COD_PLATAFORMA, TIPO_PLATAFORMA, DATA_VIOLACAO,VIOLACAO)
					VALUES (@data_carga, @COD_PLATAFORMA, @Tipo_plataforma, GETDATE(), 'LINHA POSSUI ATRINBUTOS NULOS')
				END
			ELSE
				BEGIN
					INSERT INTO DIM_PLATAFORMA(COD_PLATAFORMA, TIPO_PLATAFORMA)
					VALUES(@cod_plataforma, @Tipo_plataforma)
				END
		END
	CLOSE C_PLATAFORMA
	DEALLOCATE C_PLATAFORMA
END

-----------------------------CARGA PARA A DIM_PRODUTO------------------------------------------------------

CREATE PROCEDURE SP_DIM_PRODUTO (@data_carga DATETIME)
AS
BEGIN
	DECLARE @cod_produto INT, @nm_produto VARCHAR(45), @valor_produto NUMERIC(10,2)
	DECLARE C_PRODUTO CURSOR FOR SELECT COD_PRODUTO, NM_PRODUTO, VALOR_PRODUTO FROM TB_AUX_PRODUTO WHERE DATA_CARGA = @data_carga

	OPEN C_PRODUTO
	FETCH C_PRODUTO INTO @cod_produto, @nm_produto, @valor_produto

	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_produto IS NULL OR @nm_produto IS NULL OR @valor_produto IS NULL)
				BEGIN
					INSERT INTO TB_VIOLACAO_PRODUTO (DATA_CARGA, COD_PRODUTO, NM_PRODUTO, VALOR_PRODUTO, DATA_VIOLACAO, VIOLACAO)
					VALUES(@data_carga, @cod_produto, @nm_produto, @valor_produto, GETDATE(),'LINHA POSSUI ATRINBUTOS NULOS')
				END
			ELSE
				BEGIN
					IF(EXISTS(SELECT 1 FROM DIM_PRODUTO WHERE COD_PRODUTO = @cod_produto AND FL_CORRENTE = 'SIM'))
						BEGIN
							IF(EXISTS(SELECT 1 FROM DIM_PRODUTO WHERE (NM_PRODUTO <> @nm_produto OR VALOR_PRODUTO <> @valor_produto) 
																AND   (COD_PRODUTO = @cod_produto AND FL_CORRENTE = 'SIM')))
							BEGIN
								UPDATE DIM_PRODUTO SET DT_FIM = @data_carga, FL_CORRENTE = 'NAO' WHERE (COD_PRODUTO = @cod_produto AND FL_CORRENTE = 'SIM')
								INSERT INTO DIM_PRODUTO(COD_PRODUTO, NM_PRODUTO, VALOR_PRODUTO, DT_INICIO, DT_FIM, FL_CORRENTE)
								VALUES(@cod_produto, @nm_produto, @valor_produto, @data_carga, NULL, 'SIM')
							END
						END
					ELSE
						BEGIN
							INSERT INTO DIM_PRODUTO(COD_PRODUTO, NM_PRODUTO, VALOR_PRODUTO, DT_INICIO, DT_FIM, FL_CORRENTE)
							VALUES(@cod_produto, @nm_produto, @valor_produto, @data_carga, NULL, 'SIM')
						END
				END
			FETCH C_PRODUTO INTO @cod_produto, @nm_produto, @valor_produto
		END
	CLOSE C_PRODUTO
	DEALLOCATE C_PRODUTO
END
-----------------------------CARGA PARA A DIM_PAGAMENTO-----------------------------------------------------

CREATE PROCEDURE SP_DIM_PAGAMENTO (@data_carga DATETIME)
AS
BEGIN
	DECLARE @cod_pagamento INT, @tipo_pagamento VARCHAR(45), @valor_pagamento numeric(10,2)
	DECLARE C_PAGAMENTO CURSOR FOR SELECT COD_PAGAMENTO, TIPO_PAGAMENTO, VALOR_PAGAMENTO FROM TB_AUX_PAGAMENTO WHERE DATA_CARGA = @data_carga
	
	OPEN C_PAGAMENTO
	FETCH C_PAGAMENTO INTO @cod_pagamento, @tipo_pagamento, @valor_pagamento
	
	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_pagamento IS NULL OR @tipo_pagamento IS NULL OR @valor_pagamento IS NULL)
				BEGIN
					INSERT INTO TB_VIOLACAO_PAGAMENTO(DATA_CARGA, COD_PAGAMENTO,TIPO_PAGAMENTO, VALOR_PAGAMENTO,DATA_VIOLACAO, VIOLACAO)
					VALUES(@data_carga, @cod_pagamento, @tipo_pagamento, @valor_pagamento, GETDATE(),'LINHA POSSUI ATRINBUTOS NULOS')
				END
			ELSE
				BEGIN
					INSERT INTO DIM_PAGAMENTO(COD_PAGAMENTO, TIPO_PAGAMENTO, VALOR_PAGAMENTO)
					VALUES(@cod_pagamento, @tipo_pagamento, @valor_pagamento)
				END
		END
	CLOSE C_PAGAMENTO
	DEALLOCATE C_PAGAMENTO
	
END

-----------------------------CARGA PARA A DIM_CINEMA------------------------------------------------------

CREATE PROCEDURE SP_DIM_CINEMA (@data_carga DATETIME)
AS
BEGIN
	DECLARE @cod_cinema INT, @nome_cinema VARCHAR(45), @desc_cinema VARCHAR(100) 
	DECLARE C_CINEMA CURSOR FOR SELECT COD_CINEMA, NOME_CINEMA, DESC_CINEMA  FROM TB_AUX_CINEMA WHERE DATA_CARGA = @data_carga

	OPEN C_CINEMA 
	FETCH C_CINEMA INTO @cod_cinema, @nome_cinema, @desc_cinema

	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_cinema IS NULL OR @nome_cinema IS NULL OR @desc_cinema IS NULL)
				BEGIN
					INSERT INTO TB_VIOLACAO_CINEMA(DATA_CARGA,COD_CINEMA, NOME_CINEMA, DESC_CINEMA, DATA_VIOLACAO, VIOLACAO)
					VALUES (@data_carga, @cod_cinema, @nome_cinema, @desc_cinema, GETDATE(),'LINHA POSSUI ATRINBUTOS NULOS')
				END
			ELSE 
				BEGIN
					INSERT INTO DIM_CINEMA(COD_CINEMA, NOME_CINEMA, DESC_CINEMA)
					VALUES(@cod_cinema, @nome_cinema, @desc_cinema)
				END
		END
	CLOSE C_CINEMA
	DEALLOCATE C_CINEMA 
END
-----------------------------CARGA PARA A DIM_TURNO------------------------------------------------------

CREATE PROCEDURE SP_DIM_TURNO (@data_carga DATETIME)
AS 
BEGIN
	DECLARE @cod_turno INT, @tipo_turno VARCHAR(45)

	DECLARE C_TURNO CURSOR FOR SELECT COD_TURNO, TIPO FROM TB_AUX_TURNO WHERE DATA_CARGA = @data_carga
	OPEN C_TURNO

	FETCH C_TURNO INTO @cod_turno, @tipo_turno

	WHILE(@@FETCH_STATUS = 0)
		BEGIN
			IF(@cod_turno IS NULL OR @tipo_turno IS NULL)
				BEGIN
					INSERT INTO TB_VIOLACAO_TURNO(DATA_CARGA,COD_TURNO, TIPO, DATA_VIOLACAO, VIOLACAO)
					VALUES (@data_carga, @cod_turno, @tipo_turno, GETDATE(), 'LINHA POSSUI ATRIBUTOS NULOS')
				END
			ELSE
				BEGIN
					INSERT INTO DIM_TURNO(COD_TURNO,TIPO)
					VALUES(@cod_turno, @tipo_turno)
				END
		END
	CLOSE C_TURNO 
	DEALLOCATE C_TURNO
END