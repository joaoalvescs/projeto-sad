CREATE TABLE DIM_TEMPO (
  ID_TEMPO INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  DIA INT NOT NULL,
  MES INT NOT NULL,
  ANO INT NOT NULL,
  NOME_MES VARCHAR(20) NOT NULL,
  TRIMESTRE INT NOT NULL,
  TURNO VARCHAR(25) NOT NULL CHECK (Tipo in ('MATINÊ','NOITE')),
  Hora 	DATETIME NOT NULL,
  DATA DATETIME NOT NULL,
  NIVEL VARCHAR(8) NOT NULL,
  DIA_SEMANA VARCHAR(25) NOT NULL,
  FERIADO CHAR(3) NOT NULL,
  DIA_UTIL CHAR(3) NOT NULL,
  FIM_SEMANA VARCHAR(45) NOT NULL,
  QUINZENA INT NOT NULL,
  FIM_MES CHAR(3) NOT NULL,
  NOME_TRIMESTRE VARCHAR(20) NOT NULL,
  SEMESTRE INT NOT NULL,
  NOME_SEMESTRE VARCHAR(20) NOT NULL,
)
CREATE TABLE DIM_Feriados(
	Id_Feriado int IDENTITY(1,1) NOT NULL,
	Data datetime NOT NULL,
	Descricao varchar(200) NOT NULL,
	Tipo varchar(50) NOT NULL CHECK (Tipo in ('NACIONAL','ESTADUAL','MUNICIPAL')),
	PRIMARY KEY(Id_Feriado)
)



CREATE PROCEDURE SP_Dim_Tempo (@dt_inicial datetime, @dt_final datetime)
AS 
	DECLARE @hora varchar(25)
	DECLARE @nm_turno varchar(25)
	DECLARE @dia smallint
	DECLARE @mes smallint
	DECLARE @ano smallint
	DECLARE @nm_dia varchar(25)
	DECLARE @nm_mes varchar(25)
	DECLARE @dia_util char(3)
	DECLARE @fim_semna char(3)
	DECLARE @nm_semestre varchar(20)
	DECLARE @semestre smallint
	DECLARE @nm_trimestre varchar(20)
	DECLARE @fim_mes char(3)
	DECLARE @trimestre smallint
	DECLARE @quinzena smallint
	
WHILE(@dt_inicial <= @dt_final)
	BEGIN
		SET LANGUAGE Brazilian
		
		
		
		-- pegando a hora
		
		-- SET @hora = convert(varchar, @dt_inicial(), 14)
		SET @hora = select DATENAME(HOUR,@dt_inicial)
		

		
		
		
		SET @dia = DATEPART(dd,@dt_inicial)
		SET @mes = DATEPART(mm,@dt_inicial)
		SET @ano = DATEPART(yy,@dt_inicial)
		SET @nm_dia = DATENAME(dw,@dt_inicial)
		SET @nm_mes = DATENAME(mm,@dt_inicial)
		
		-- TESTANDO A HORA E SETANDO O TURNO
		IF (@hora>=7 && @hora <= 18)
			BEGIN
				SET @nm_turno = 'MATINE' 
			END
		ELSE
			BEGIN
				SET @nm_turno = 'NOITE'	
			END	
		
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
		IF((SELECT COUNT(Data) FROM DIM_TEMPO WHERE Data = @dt_inicial)=0)
		BEGIN
			INSERT INTO DIM_TEMPO(Nivel, Data, Dia, DiaSemana, DiaUtil, Feriado, FimSemana, Quinzena, Mes, NomeMes, FimMes, Trimestre, NomeTrimestre, Semestre, NomeSemestre, Ano)
			VALUES('DIA',@dt_inicial,@dia,@nm_dia,@dia_util, 'NÃO', @fim_semna,@quinzena, @mes, @nm_mes,@fim_mes,@trimestre, @nm_trimestre, @semestre, @nm_semestre, @ano)
		
			/*INSERE O MÊS NO BANCO DE DADOS*/
			IF(@fim_mes = 'SIM')
			BEGIN
				INSERT INTO DIM_TEMPO(Nivel, Data, Mes, NomeMes,Trimestre, NomeTrimestre, Semestre, NomeSemestre, Ano)
				VALUES('MES',@dt_inicial, @mes, @nm_mes, @trimestre, @nm_trimestre, @semestre,@nm_semestre, @ano)
			END

			/*INSERE O ANO NO BANCO DE DADOS*/
			IF(@fim_mes = 'SIM' AND @mes=12)
			BEGIN
				INSERT INTO DIM_TEMPO(Nivel, Ano)
				VALUES('ANO', @ano)
			END
		END		
		SET @dt_inicial = DATEADD(dd,1,@dt_inicial)	
END



CREATE PROCEDURE SP_Atualiza_Feriado_Tempo(@Ano smallint)
AS 
DECLARE @dt_feriado datetime 
DECLARE @dia smallint
DECLARE @mes smallint
DECLARE C_FERIADO CURSOR FOR SELECT Data FROM DIM_Feriados
OPEN C_FERIADO
FETCH C_FERIADO INTO @dt_feriado
WHILE(@@FETCH_STATUS = 0)
	BEGIN
		SET @dia = DATEPART(dd,@dt_feriado)
		SET @mes = DATEPART(mm,@dt_feriado)
		UPDATE DIM_TEMPO SET Feriado = 'SIM', DiaUtil = 'NÃO' WHERE Dia = @dia AND Mes = @mes AND Ano = @Ano
		
		FETCH C_FERIADO INTO @dt_feriado
	END
CLOSE C_FERIADO
DEALLOCATE C_FERIADO