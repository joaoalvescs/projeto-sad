/* UNIVERSIDADE FEDERAL DE SERGIPE
	  CAMPUS ALBERTO CARVALHO
	SISTEMA DE APOIO A DECISÃO
GRUPO: IGOR, JOÃO, CLOVIJAN
SCRIPT CRIAÇÃO BANCO DE DADOS CINEMA
*/


CREATE DATABASE CINEMA
GO
USE CINEMA

CREATE TABLE TB_UNIDADE_CINEMA(
	ID_CINEMA INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR(45) NOT NULL,
	DESCRICAO VARCHAR(100) NOT NULL,
	CONSTRAINT PK_UNIDADE_CINEMA PRIMARY KEY(ID_CINEMA)
)

CREATE TABLE TB_ENDERECO(
	ID_ENDERECO INT IDENTITY(1,1) NOT NULL,
	RUA VARCHAR(45) NOT NULL,
	NUMERO INT NOT NULL,
	CIDADE VARCHAR(45) NOT NULL,
    BAIRRO VARCHAR(45) NOT NULL,
    COMPLEMENTO VARCHAR(45) NOT NULL,
	ESTADO VARCHAR(45) NOT NULL,
	CEP VARCHAR (45) NOT NULL,
	CONSTRAINT PK_ENDERECO PRIMARY KEY (ID_ENDERECO)
);

CREATE TABLE TB_PESSOA(
	ID_PESSOA INT IDENTITY(1,1) NOT NULL,
	CPF VARCHAR(15) NOT NULL,
	SEXO VARCHAR(1) NOT NULL,
	NOME VARCHAR(45) NOT NULL,
	SOBRENOME VARCHAR(45) NOT NULL,
	DATA_NASCIMENTO DATE NOT NULL,
	ID_ENDERECO INT,
	CONSTRAINT PK_PESSOA PRIMARY KEY (ID_PESSOA),
	CONSTRAINT UQ_PESSOA UNIQUE (CPF),
    CONSTRAINT FK_ENDERECO FOREIGN KEY (ID_ENDERECO) REFERENCES TB_ENDERECO(ID_ENDERECO)
);

CREATE TABLE TB_CLIENTE(
	ID_CLIENTE INT IDENTITY(1,1) NOT NULL,
	ID_PESSOA INT NOT NULL,
	ID_ENDERECO INT NOT NULL,
	CONSTRAINT PK_TB_CLIENTE PRIMARY KEY (ID_CLIENTE),
	CONSTRAINT FK_PESSOA FOREIGN KEY (ID_PESSOA) REFERENCES TB_PESSOA(ID_PESSOA),
	CONSTRAINT FK_ENDERECO_CLIENTE FOREIGN KEY (ID_ENDERECO) REFERENCES TB_ENDERECO(ID_ENDERECO)
);

CREATE TABLE TB_FUNCIONARIO(
	ID_FUNCIONARIO INT IDENTITY(1,1) NOT NULL,
	CARGO VARCHAR(45) NOT NULL,
	CARGA_HORARIA INT NOT NULL,
	SALARIO NUMERIC(10,2) NOT NULL,
	ID_PESSOA INT NOT NULL,
    ID_ENDERECO INT NOT NULL,
	CONSTRAINT PK_FUNCIONARIO PRIMARY KEY (iD_FUNCIONARIO),
    CONSTRAINT CK_SAL_NEGATIVO CHECK(SALARIO > 0),
	CONSTRAINT FK_PESSOA_FUNC FOREIGN KEY (ID_PESSOA) REFERENCES TB_PESSOA(ID_PESSOA),
    CONSTRAINT FK_ENDERECO_FUNC FOREIGN KEY (ID_ENDERECO) REFERENCES TB_ENDERECO(ID_ENDERECO)
);

CREATE TABLE TB_PRODUTO(
	ID_PRODUTO INT IDENTITY(1,1) NOT NULL,
    NOME_PRODUTO VARCHAR(45) NOT NULL,
	VALOR_PRODUTO NUMERIC(10,2) NOT NULL,
	DISPONIBILIDADE VARCHAR(3) NOT NULL,
	CONSTRAINT PK_PRODUTO PRIMARY KEY (ID_PRODUTO)
);

CREATE TABLE TB_PRECO(
	ID_PRECO INT IDENTITY(1,1) NOT NULL,
	VIVO_VALORIZA NUMERIC(10,2) NULL,
	VALE_CULTURA NUMERIC(10,2) NULL,
	INTEIRA NUMERIC(10,2) NOT NULL,
	MEIA_ENTRADA NUMERIC(10,2) NOT NULL,
	CONSTRAINT PK_PRECO PRIMARY KEY (ID_PRECO),
    CONSTRAINT CK_INTEIRA_NEGATIVA CHECK(INTEIRA > 0),
    CONSTRAINT CK_MEIA_ENTRADA_NEGATIVA CHECK(MEIA_ENTRADA > 0)
);

CREATE TABLE TB_SALA(
	ID_SALA INT IDENTITY(1,1) NOT NULL,
	NUMERO_SALA INT NOT NULL,
	ID_CINEMA INT NOT NULL,
	CONSTRAINT PK_SALA PRIMARY KEY (ID_SALA),
	 CONSTRAINT FK_CINEMA FOREIGN KEY (ID_CINEMA) REFERENCES TB_UNIDADE_CINEMA(ID_CINEMA),
    
);

CREATE TABLE TB_POLTRONA(
	NUMERO_POLTRONA INT NOT NULL,
	ID_SALA INT NOT NULL,
	FILA VARCHAR(5) NOT NULL,
    STATUS_POLTRONA VARCHAR(25) NOT NULL,
	CONSTRAINT PK_POLTRONA PRIMARY KEY (NUMERO_POLTRONA, iD_SALA)
);

CREATE TABLE TB_FILME(
	ID_FILME INT IDENTITY(1,1) NOT NULL,
	DIRETOR VARCHAR(45) NOT NULL,
	INDICACAO INT NOT NULL,
	GENERO VARCHAR(45) NOT NULL,
	NOME VARCHAR(45) NOT NULL,
	SINOPSE TEXT NOT NULL,
	PRODUTORA VARCHAR(45) NOT NULL,
    DURACAO INT NOT NULL,
	CONSTRAINT PK_FILME PRIMARY KEY (ID_FILME)
);

CREATE TABLE TB_SESSAO(
    ID_SESSAO INT IDENTITY(1,1) NOT NULL,
	DATA_SESSAO DATE NOT NULL,
	HORARIO_SESSAO TIME NOT NULL,
	LINGUAGEM VARCHAR(25) NOT NULL,
	ID_FILME INT NOT NULL,
    ID_SALA INT NOT NULL,
	CONSTRAINT PK_SESSAO PRIMARY KEY (ID_SESSAO),
    CONSTRAINT FK_FILME FOREIGN KEY (ID_FILME) REFERENCES TB_FILME(id_filme),
    CONSTRAINT FK_SALA FOREIGN KEY (ID_SALA) REFERENCES TB_SALA(id_sala)
);
 
CREATE TABLE TB_INGRESSO(
	ID_INGRESSO INT IDENTITY(1,1) NOT NULL,
	STATUS_INGRESSO VARCHAR(25),
    ID_FILME INT NOT NULL,
    ID_SESSAO INT NOT NULL,
    NUM_POLTRONA INT NOT NULL,
	ID_SALA INT NOT NULL,
	CONSTRAINT PK_INGRESSO PRIMARY KEY (ID_INGRESSO),
    CONSTRAINT FK_FILME_ING FOREIGN KEY (ID_FILME) REFERENCES TB_FILME(ID_FILME),
    CONSTRAINT FK_SESSAO FOREIGN KEY (ID_SESSAO) REFERENCES TB_SESSAO(ID_SESSAO),
    CONSTRAINT FK_POLTRONA FOREIGN KEY (NUM_POLTRONA, ID_SALA) REFERENCES TB_POLTRONA(NUMERO_POLTRONA, ID_SALA)
);

CREATE TABLE TB_PLANO_PRECO(
    ID_INGRESSO INT NOT NULL,
    iD_PRECO INT NOT NULL,
    CONSTRAINT PK_COMPRA_ITEM PRIMARY KEY (ID_INGRESSO,ID_PRECO),
    CONSTRAINT FK_INGRESSO FOREIGN KEY (ID_INGRESSO) REFERENCES TB_INGRESSO(ID_INGRESSO),
    CONSTRAINT FK_PRECO FOREIGN KEY (ID_PRECO) REFERENCES TB_PRECO(ID_PRECO)
);

CREATE TABLE TB_PLATAFORMA (
	ID_PLATAFORMA INT IDENTITY(1,1) NOT NULL,
	TIPO VARCHAR(60) NOT NULL,
	CONSTRAINT PK_PLATAFORMA PRIMARY KEY (ID_PLATAFORMA)
)

CREATE TABLE TB_COMPRA(
	ID_COMPRA INT IDENTITY(1,1) NOT NULL,
	CODIGO_COMPRA VARCHAR(5) NOT NULL,
	DATA_COMPRA DATE NOT NULL,
    HORA_COMPRA TIME NOT NULL,
	VALOR_COMPRA NUMERIC(10,2) NOT NULL,
	TIPO_PAGAMENTO VARCHAR(25) NOT NULL,
	ID_CLIENTE INT NOT NULL,
	ID_PLATAFORMA INT NOT NULL,
	CONSTRAINT PK_COMPRA PRIMARY KEY (ID_COMPRA),
	CONSTRAINT FK_CLIENTE  FOREIGN KEY (ID_CLIENTE) REFERENCES TB_CLIENTE(ID_CLIENTE),
	CONSTRAINT FK_PLATAFORMA FOREIGN KEY (ID_PLATAFORMA) REFERENCES TB_PLATAFORMA(ID_PLATAFORMA)
);

CREATE TABLE TB_COMPRA_INGRESSO(
    ID_COMPRA INT  NOT NULL,
    ID_INGRESSO INT NOT NULL,
    CONSTRAINT PK_COMPRA_INGRESSO PRIMARY KEY (ID_COMPRA,ID_INGRESSO),
    CONSTRAINT FK_COMPRA FOREIGN KEY (ID_COMPRA) REFERENCES TB_COMPRA(ID_COMPRA),
    CONSTRAINT FK_INGRESSO_COMPRA FOREIGN KEY (ID_INGRESSO) REFERENCES TB_INGRESSO(ID_INGRESSO)
); 

CREATE TABLE TB_COMPRA_PRODUTO(
    ID_COMPRA INT  NOT NULL,
    ID_PRODUTO INT NOT NULL,
    CONSTRAINT PK_COMPRA_PRODUTO PRIMARY KEY (ID_COMPRA,ID_PRODUTO),
    CONSTRAINT FK_COMPRA_PROD FOREIGN KEY (ID_COMPRA) REFERENCES TB_COMPRA(ID_COMPRA),
    CONSTRAINT FK_PRODUTO FOREIGN KEY (iD_PRODUTO) REFERENCES TB_PRODUTO(ID_PRODUTO)
);  

CREATE TABLE TB_TURNO(
	ID_TURNO INT NOT NULL

)
