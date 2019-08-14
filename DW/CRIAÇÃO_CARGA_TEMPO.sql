CREATE TABLE DIM_TEMPO(
	ID_TEMPO int IDENTITY(1,1) NOT NULL,
	NIVEL varchar(8) NOT NULL,
	DATA datetime NULL,
	DIA smallint NULL,
	DIA_SEMANA varchar(25) NULL,
	DIA_UTIL char(3) NULL,
	FERIADO char(3) NULL,
	FIM_SEMANA char(3) NULL,
	QUINZENA smallint NULL,
	MES smallint NULL,
	NOME_MES varchar(20) NULL,
	FIM_MES char(3) NULL,
	TRIMESTRE smallint NULL,
	NOME_TRIMESTRE varchar(20) NULL,
	SEMESTRE smallint NULL,
	NOME_SEMESTRE varchar(20) NULL,
	ANO smallint NOT NULL,
	PRIMARY KEY (ID_TEMPO)
)

ALTER PROCEDURE SP_Dim_Tempo (@dt_inicial datetime, @dt_final datetime)
AS 
DECLARE @dia smallint, @mes smallint, @ano smallint, @nm_dia varchar(25), @nm_mes varchar(25), @dia_util char(3),
		@fim_semna char(3), @nm_semestre varchar(20), @semestre smallint, @nm_trimestre varchar(20), @fim_mes char(3),
		@trimestre smallint, @quinzena smallint

WHILE(@dt_inicial <= @dt_final)
	BEGIN
		SET LANGUAGE Brazilian
		SET @dia = DATEPART(dd,@dt_inicial)
		SET @mes = DATEPART(mm,@dt_inicial)
		SET @ano = DATEPART(yy,@dt_inicial)
		SET @nm_dia = DATENAME(dw,@dt_inicial)
		SET @nm_mes = DATENAME(mm,@dt_inicial)
		/*COMPARA SE O DIA É FINAL DE SEMANA, SE É DIA UTIL OU NÃO*/

		IF(@nm_dia = 'Sábado' OR @nm_dia = 'Domingo') 
			BEGIN
				SET @dia_util = 'NÃO'
				SET @fim_semna = 'SIM'
			END
		ELSE
			BEGIN
				SET @dia_util = 'SIM'
				SET @fim_semna = 'NÃO'
			END

		/* VERIFICA SE É FIM DE MES*/
		IF(@dt_inicial = EOMONTH(@dt_inicial))
			BEGIN
				SET @fim_mes = 'SIM'
			END
		ELSE
			SET @fim_mes = 'NÃO'

		/* VERIFICA A QUINZENA*/
		IF(@dia <= 15)
			BEGIN
				SET @quinzena = 1
			END
		ELSE 
			SET @quinzena = 2

		/*DEFINE OS SEMESTRES DO ANO*/
		IF(@mes < 6)
			BEGIN
				SET @semestre = 1
				SET @nm_semestre = CONCAT('1º SEMESTRE/', @ano)
			END
		ELSE
			BEGIN
				SET @semestre = 2
				SET @nm_semestre = CONCAT('2º SEMESTRE/', @ano)
			END

		/*DEFININDO O TRIMESTRE DO ANO*/
		IF(@mes <= 3)
			BEGIN
				SET @trimestre = 1
				SET @nm_trimestre = CONCAT('1º TRIMESTRE/',@ano)
			END
		ELSE
			IF(@mes > 3 AND @mes <=6)
				BEGIN
					SET @trimestre = 2
					SET @nm_trimestre = CONCAT('2º TRIMESTRE/',@ano)
				END
			ELSE
				IF(@mes > 6 AND @mes <= 9)
					BEGIN
						SET @trimestre = 3
						SET @nm_trimestre = CONCAT('3º TRIMESTRE/',@ano)
					END
				ELSE
					BEGIN
						SET @trimestre = 4
						SET @nm_trimestre = CONCAT('4º TRIMESTRE/',@ano)
					END
		
		/*TESTA SE JÁ EXISTE O DIA NO BANCO DE DADOS*/
		IF(NOT EXISTS(SELECT 1 FROM DIM_TEMPO WHERE DATA = @dt_inicial))
		BEGIN
			INSERT INTO DIM_TEMPO(NIVEL, DATA, DIA, DIA_SEMANA, DIA_UTIL, FERIADO, FIM_SEMANA, QUINZENA, MES, NOME_MES, FIM_MES, TRIMESTRE, NOME_TRIMESTRE, SEMESTRE, NOME_SEMESTRE, ANO)
			VALUES('DIA',@dt_inicial,@dia,@nm_dia,@dia_util, 'NÃO', @fim_semna,@quinzena, @mes, @nm_mes,@fim_mes,@trimestre, @nm_trimestre, @semestre, @nm_semestre, @ano)
		
			/*INSERE O MÊS NO BANCO DE DADOS*/
			IF(NOT EXISTS(SELECT 1 FROM DIM_TEMPO WHERE NIVEL = 'MES' AND NOME_MES = @nm_mes AND Ano = @ano))
			BEGIN
				INSERT INTO DIM_TEMPO(NIVEL, DATA, MES, NOME_MES,TRIMESTRE, NOME_TRIMESTRE, SEMESTRE, NOME_SEMESTRE, ANO)
				VALUES('MES',@dt_inicial, @mes, @nm_mes, @trimestre, @nm_trimestre, @semestre,@nm_semestre, @ano)
			END

			/*INSERE O ANO NO BANCO DE DADOS*/
			IF(NOT EXISTS(SELECT 1 FROM DIM_TEMPO WHERE NIVEL = 'ANO' AND ANO = @ano))
			BEGIN
				INSERT INTO DIM_TEMPO(NIVEL, ANO)
				VALUES('ANO', @ano)
			END
		END
		SET @dt_inicial = DATEADD(dd,1,@dt_inicial)	
END