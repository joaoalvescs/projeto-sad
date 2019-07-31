CREATE DATABASE DW_CINEMA
GO
USE DW_CINEMA

CREATE TABLE  FATO_VENDA_PRODUTO(
  ID_FATO_PRODUTO INT NOT NULL PRIMARY KEY,
  COD_PRODUTO INT NOT NULL,
  ID_ENDERECO INT NOT NULL REFERENCES DIM_ENDERECO_CLIENTE(ID_ENDERECO),
  ID_TEMPO INT NOT NULL REFERENCES DIM_TEMPO(ID_TEMPO),
  ID_PRODUTO INT NOT NULL REFERENCES DIM_PRODUTO(ID_PRODUTO),
  ID_PAGAMENTO INT NOT NULL REFERENCES DIM_PAGAMENTO(ID_PAGAMENTO),
  ID_CLIENTE INT NOT NULL REFERENCES DIM_CLIENTE (ID_CLIENTE),
  ID_CINEMA INT NOT NULL REFERENCES DIM_CINEMA (ID_CINEMA),
  ID_PLATAFORMA INT NOT NULL REFERENCES DIM_PLATAFORMA (ID_PLATAFORMA),
  QUANTIDADE INT NOT NULL,
  VALOR_PAGO NUMERIC(10,2) NOT NULL
)

CREATE TABLE DIM_TEMPO (
  ID_TEMPO INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  DIA INT NOT NULL,
  MES INT NOT NULL,
  ANO INT NOT NULL,
  NOME_MES VARCHAR(20) NOT NULL,
  TRIMESTRE INT NOT NULL,
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

CREATE TABLE  DIM_CLIENTE(
  ID_CLIENTE INT NOT NULL PRIMARY KEY,
  COD_CLIENTE INT NOT NULL,
  CPF VARCHAR NOT NULL,
  SEXO CHAR(1) NULL,
  NM_CLIENTE VARCHAR(45) NULL,
  SBR_CLIENTE VARCHAR(45) NULL,
  DT_NASC_CLIENTE DATE NULL,
  DT_INICIO DATETIME NOT NULL,
  DT_FIM DATETIME NULL,
  FL_CORRENTE VARCHAR(3) NOT NULL CHECK (FL_CORRENTE IN ('SIM','NAO'))
)

CREATE TABLE DIM_ENDERECO_CLIENTE (
  ID_ENDERECO INT NOT NULL PRIMARY KEY,
  COD_ENDERECO VARCHAR(45) NOT NULL,
  RUA VARCHAR(45) NULL,
  NUMERO VARCHAR(45) NULL,
  CIDADE VARCHAR(45) NULL,
  BAIRRO VARCHAR(45) NULL,
  ESTADO VARCHAR(45) NULL,
  CEP VARCHAR(15) NULL
)

CREATE TABLE DIM_PLATAFORMA (
  ID_PLATAFORMA INT NOT NULL PRIMARY KEY,
  COD_PLATAFORMA INT NOT NULL,
  TIPO_PLATAFORMA VARCHAR(45) NULL
 )

CREATE TABLE DIM_PRODUTO(
  ID_PRODUTO INT NOT NULL PRIMARY KEY,
  COD_PRODUTO VARCHAR(45) NOT NULL,
  NM_PRODUTO VARCHAR(45) NULL,
  QTD_PRODUTO VARCHAR(45) NULL,
  VALOR_PRODUTO NUMERIC(10,2)
)

CREATE TABLE  DIM_PAGAMENTO (
  ID_PAGAMENTO INT NOT NULL PRIMARY KEY,
  COD_PAGAMENTO INT NOT NULL,
  TIPO_PAGAMENTO VARCHAR(45) NULL,
  VALOR_PAGAMENTO NUMERIC(10,2)
)

CREATE TABLE DIM_CINEMA (
  ID_CINEMA INT NOT NULL PRIMARY KEY,
  NOME_CINEMA VARCHAR(45) NOT NULL,
  DESC_CINEMA VARCHAR(100) NULL
)
CREATE TABLE DIM_TURNO (
	COD_TURNO INT NOT NULL PRIMARY KEY,
	TIPO VARCHAR(20)
)
