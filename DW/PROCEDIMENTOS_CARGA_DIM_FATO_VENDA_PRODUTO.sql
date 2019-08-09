-----------------------------CARGA PARA A DIM_FATO_VENDA_PRODUTO-------------------------------------------


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
	CLOSE C_PLATAFORMA
	DEALLOCATE C_PLATAFORMA
	END
END

-----------------------------CARGA PARA A DIM_PRODUTO------------------------------------------------------

-----------------------------CARGA PARA A DIM_PAGAMENTO-----------------------------------------------------

CREATE PROCEDURE SP_DIM_PAGAMENTO(@data_carga DATETIME)
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

CREATE PROCEDURE SP_DIM_CINEMA(@data_carga DATETIME)
AS
BEGIN
	DECLARE @cod_cinema INT, @nome_cinema VARCHAR(45), @desc_cinema VARCHAR(100) 
	DECLARE C_CINEMA CURSOR FOR SELECT COD_CINEMA, NOME_CINEMA, DESC_CINEMA  FROM TB_AUX_CINEMA WHERE DATA_CARGA = @data_carga

	OPEN C_CINEMA 
	FETCH C_CINEMA INTO @cod_cinema, @nome_cinema, @des_cinema

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

	FETCH C_TURNO INTO @cod_plataforma, @tipo_plataforma

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
