USE CINEMA
GO

CREATE TABLE DIM_FILME(
  ID_FILME INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  COD_FILME INT NOT NULL,
  NM_FILME VARCHAR(45) NOT NULL,
  GR_FILME VARCHAR(45) NOT NULL,
  PDT_FILME VARCHAR(45) NOT NULL,
  DIR_FILME VARCHAR(45) NOT NULL,
  DUR_FILME INT NOT NULL
)

CREATE TABLE  DIM_SESSAO(
  ID_SESSAO INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  COD_SESSAO INT NOT NULL,
  HORA_SESSAO TIME NOT NULL,
  DATA_SESSAO DATE NOT NULL,
  LINGUAGEM_SESSAO VARCHAR(25) NOT NULL,
)

CREATE TABLE DIM_PLANO(
  ID_PLANO INT NOT NULL PRIMARY KEY IDENTITY (1,1),
  COD_PLANO INT NOT NULL,
  TIPO_PLANO VARCHAR(45) NOT NULL
)

CREATE TABLE DIM_INGRESSO(
	ID_INGRESSO INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	COD_INGRESSO INT NOT NULL,
	DISPONIBILIDADE VARCHAR(45),
	VALOR_INGRESSO NUMERIC(10,2)
)

CREATE TABLE  FATO_VENDA_INGRESSO(
  ID_FATO_INGRESSO INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  COD_COMPRA VARCHAR(45) NOT NULL,
  ID_INGRESSO INT NOT NULL REFERENCES DIM_INGRESSO(ID_INGRESSO),
  ID_ENDERECO INT NOT NULL REFERENCES DIM_ENDERECO_CLIENTE(ID_ENDERECO),
  ID_TEMPO INT NOT NULL REFERENCES DIM_TEMPO(ID_TEMPO),
  ID_PAGAMENTO INT NOT NULL REFERENCES DIM_PAGAMENTO(ID_PAGAMENTO),
  ID_CLIENTE INT NOT NULL REFERENCES DIM_CLIENTE (ID_CLIENTE),
  ID_CINEMA INT NOT NULL REFERENCES DIM_CINEMA (ID_CINEMA),
  ID_PLATAFORMA INT NOT NULL REFERENCES DIM_PLATAFORMA (ID_PLATAFORMA),
  ID_TURNO INT NOT NULL REFERENCES DIM_TURNO(ID_TURNO),
  ID_FILME INT NOT NULL REFERENCES DIM_FILME(ID_FILME),
  ID_SESSAO INT NOT NULL REFERENCES DIM_SESSAO(ID_SESSAO),
  ID_PLANO INT NOT NULL REFERENCES DIM_PLANO(ID_PLANO),
  QUANTIDADE INT NOT NULL,
  VALOR_PAGO NUMERIC(10,2)
)
