USE CINEMA
GO


CREATE TABLE TB_VIOLACAO_FATO_VENDA_PRODUTO(
	ID_FATO_VENDA_PRODUTO INT IDENTITY (1,1) NOT NULL, 
	DATA_CARGA DATETIME NOT NULL,
	COD_COMPRA INT NULL,
	DT_VENDA DATE NULL,
	HORA_VENDA TIME NULL,
	ID_ENDERECO INT NULL, 
	ID_PRODUTO INT NULL,
	ID_PAGAMENTO INT NULL, 
	ID_CLIENTE INT NULL, 
	ID_CINEMA INT NULL, 
	ID_PLATAFORMA INT NULL, 
	VALOR_PAGO NUMERIC(10,2) NULL,
	QUANTIDADE INT  NULL,
	DATA_VIOLACAO DATETIME NOT NULL, --
	VIOLACAO VARCHAR(100) NOT NULL, --
	PRIMARY KEY (ID_FATO_VENDA_PRODUTO)
	
)

CREATE TABLE TB_VIOLACAO_CLIENTE (
	ID_CLIENTE INT IDENTITY (1,1) NOT NULL, 
	DATA_CARGA DATETIME NOT NULL,
	COD_CLIENTE INT NULL,
	CPF VARCHAR(15) NULL,
	SEXO CHAR(1) NULL,
	NM_CLIENTE VARCHAR(45) NULL,
	SBR_CLIENTE VARCHAR(45) NULL,
	DT_NASC_CLIENTE DATE NULL,
	DATA_VIOLACAO DATE NOT NULL, 
	VIOLACAO VARCHAR(100) NOT NULL, 
	PRIMARY KEY (ID_CLIENTE)
)

CREATE TABLE TB_VIOLACAO_ENDERECO_CLIENTE (
	ID_ENDERECO_CLIENTE INT IDENTITY (1,1) NOT NULL, 
	DATA_CARGA DATETIME NOT NULL,
	COD_ENDERECO INT NULL,
	RUA VARCHAR(45) NULL,
	NUMERO VARCHAR(45) NULL,
	CIDADE VARCHAR(45) NULL,
	BAIRRO VARCHAR(45) NULL,
	COMPLEMETO VARCHAR(45) NULL,
	ESTADO VARCHAR(45) NULL,
	CEP VARCHAR(15) NULL,
	DATA_VIOLACAO DATETIME NOT NULL, -- 
	VIOLACAO VARCHAR(100) NOT NULL, --
	PRIMARY KEY (ID_ENDERECO_CLIENTE)
)

CREATE TABLE TB_VIOLACAO_PLATAFORMA (
	ID_PLATAFORMA INT IDENTITY (1,1) NOT NULL, --
	DATA_CARGA  DATETIME NOT NULL,
	COD_PLATAFORMA INT NULL,
	TIPO_PLATAFORMA VARCHAR(45) NULL,
	DATA_VIOLACAO DATETIME NOT NULL, --
	VIOLACAO VARCHAR(100) NOT NULL, --
	PRIMARY KEY (ID_PLATAFORMA)
 )
 
CREATE TABLE TB_VIOLACAO_PRODUTO(
	ID_PRODUTO INT IDENTITY (1,1) NOT NULL, --
	DATA_CARGA  DATETIME NOT NULL,
	COD_PRODUTO INT NULL,
	NM_PRODUTO VARCHAR(45) NULL,
	VALOR_PRODUTO NUMERIC(10,2) NULL,
	DATA_VIOLACAO DATETIME NOT NULL, --
	VIOLACAO VARCHAR(100) NOT NULL, --
	PRIMARY KEY (ID_PRODUTO)
)

CREATE TABLE  TB_VIOLACAO_PAGAMENTO (
	ID_PAGAMENTO INT IDENTITY (1,1) NOT NULL,
	DATA_CARGA DATETIME NOT NULL,
    COD_PAGAMENTO INT NULL,
    TIPO_PAGAMENTO VARCHAR(25) NULL,
    VALOR_PAGAMENTO NUMERIC(10,2) NULL,
	DATA_VIOLACAO DATETIME NOT NULL, --
	VIOLACAO VARCHAR(100) NOT NULL, --
	PRIMARY KEY (ID_PAGAMENTO)
)

CREATE TABLE TB_VIOLACAO_CINEMA (
	ID_CINEMA INT IDENTITY (1,1) NOT NULL, --
	DATA_CARGA DATETIME NOT NULL,
	COD_CINEMA INT NULL,
	NOME_CINEMA VARCHAR(45) NULL,
	DESC_CINEMA VARCHAR(100) NULL,
	DATA_VIOLACAO DATETIME NOT NULL, --
	VIOLACAO VARCHAR(100) NOT NULL, --
	PRIMARY KEY (ID_CINEMA)
)

CREATE TABLE TB_VIOLACAO_TURNO(
	ID_TURNO INT IDENTITY (1,1) NOT NULL, --
	DATA_CARGA DATETIME NOT NULL,
	COD_TURNO INT  NULL,
	TIPO VARCHAR(20) NULL,
	DATA_VIOLACAO DATETIME NOT NULL, --
	VIOLACAO VARCHAR(100) NOT NULL, --
	PRIMARY KEY (ID_TURNO)
)

