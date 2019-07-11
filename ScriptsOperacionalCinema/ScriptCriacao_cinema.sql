/* BANCO DE DADOS 
Banco Cinema: Script de criação
 Alisson Rodrigo Freire Santos
 Igor Terriaga Santos
*/

CREATE DOMAIN cinema.tipo_valor AS DECIMAL(10,2);

CREATE TABLE cinema.endereco(
	id_endereco SERIAL NOT NULL,
	rua VARCHAR(60) NOT NULL,
	numero INT NOT NULL,
	cidade VARCHAR(60) NOT NULL,
    bairro VARCHAR(60) NOT NULL,
    complemento VARCHAR(60),
	CONSTRAINT pk_endereco PRIMARY KEY (id_endereco)
);

CREATE TABLE cinema.pessoa(
	id_pessoa SERIAL NOT NULL,
	cpf VARCHAR(15) NOT NULL,
	sexo VARCHAR(1) NOT NULL,
	primeiro_nome VARCHAR(45) NOT NULL,
	sobrenome VARCHAR(45) NOT NULL,
	data_nascimento DATE NOT NULL,
	id_endereco INT,
	CONSTRAINT pk_pessoa PRIMARY KEY (id_pessoa),
	CONSTRAINT uq_pessoa UNIQUE (cpf),
    CONSTRAINT fk_endereco FOREIGN KEY (id_endereco) REFERENCES cinema.endereco(id_endereco)
);

CREATE TABLE cinema.cliente(
	id_cliente SERIAL NOT NULL,
	id_pessoa INT NOT NULL,
	id_endereco INT,
	CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
	CONSTRAINT fk_pessoa FOREIGN KEY (id_pessoa) REFERENCES cinema.pessoa(id_pessoa),
	CONSTRAINT fk_endereco FOREIGN KEY (id_endereco) REFERENCES cinema.endereco(id_endereco)
);

CREATE TABLE cinema.funcionario(
	id_funcionario SERIAL NOT NULL,
	cargo VARCHAR(45) NOT NULL,
	carga_horaria INT NOT NULL,
	salario cinema.tipo_valor NOT NULL,
	id_pessoa INT NOT NULL,
    id_endereco INT NOT NULL,
	CONSTRAINT pk_funcionario PRIMARY KEY (id_funcionario),
    CONSTRAINT ck_sal_negativo CHECK(salario>0),
	CONSTRAINT fk_pessoa FOREIGN KEY (id_pessoa) REFERENCES cinema.pessoa(id_pessoa),
    CONSTRAINT fk_endereco FOREIGN KEY (id_endereco) REFERENCES cinema.endereco(id_endereco)
);

CREATE TABLE cinema.produto(
	id_produto SERIAL NOT NULL,
    nome_produto VARCHAR(45) NOT NULL,
	valor_produto cinema.tipo_valor NOT NULL,
	disponibilidade VARCHAR(3),
	CONSTRAINT pk_produto PRIMARY KEY (id_produto)
);

CREATE TABLE cinema.preco(
	id_preco SERIAL NOT NULL,
	vivo_valoriza cinema.tipo_valor,
	vale_cultura cinema.tipo_valor,
	inteira cinema.tipo_valor NOT NULL,
	meia_entrada cinema.tipo_valor NOT NULL,
	CONSTRAINT pk_preco PRIMARY KEY (id_preco),
    CONSTRAINT ck_inteira_negativa CHECK(inteira>0),
    CONSTRAINT ck_meia_entrada_negativa CHECK(meia_entrada>0)
);

CREATE TABLE cinema.sala(
	id_sala SERIAL NOT NULL,
	numero_sala INT NOT NULL,
	CONSTRAINT pk_sala PRIMARY KEY (id_sala)
);

CREATE TABLE cinema.poltrona(
	numero_poltrona INT NOT NULL,
	id_sala INT NOT NULL,
	fila VARCHAR(5) NOT NULL,
    estado_poltrona VARCHAR(25) NOT NULL,
	CONSTRAINT pk_poltrona PRIMARY KEY (numero_poltrona, id_sala)
);

CREATE TABLE cinema.filme(
	id_filme SERIAL NOT NULL,
	diretor VARCHAR(45) NOT NULL,
	indicacao INT NOT NULL,
	genero VARCHAR(45) NOT NULL,
	nome VARCHAR(45) NOT NULL,
	sinopse TEXT NOT NULL,
	produtora VARCHAR(45) NOT NULL,
    duracao INT NOT NULL,
	CONSTRAINT pk_filme PRIMARY KEY (id_filme)
);

CREATE TABLE cinema.sessao(
    id_sessao SERIAL NOT NULL,
	data_sessao DATE NOT NULL,
	horario_sessao TIME NOT NULL,
	linguagem VARCHAR(25) NOT NULL,
	id_filme INT NOT NULL,
    id_sala INT NOT NULL,
	CONSTRAINT pk_sessao PRIMARY KEY (id_sessao),
    CONSTRAINT fk_filme FOREIGN KEY (id_filme) REFERENCES cinema.filme(id_filme),
    CONSTRAINT fk_sala FOREIGN KEY (id_sala) REFERENCES cinema.sala(id_sala)
);
 

CREATE TABLE cinema.ingresso(
	id_ingresso SERIAL NOT NULL,
	status_ingresso VARCHAR(25),
    id_filme INT NOT NULL,
    id_sessao INT NOT NULL,
    numero_poltrona INT NOT NULL,
	id_sala INT NOT NULL,
	CONSTRAINT pk_ingresso PRIMARY KEY (id_ingresso),
    CONSTRAINT fk_filme FOREIGN KEY (id_filme) REFERENCES cinema.filme(id_filme),
    CONSTRAINT fk_sessao FOREIGN KEY (id_sessao) REFERENCES cinema.sessao(id_sessao),
    CONSTRAINT fk_poltrona FOREIGN KEY (numero_poltrona, id_sala) REFERENCES cinema.poltrona(numero_poltrona, id_sala)
);

CREATE TABLE cinema.disp_poltrona(
    id_sessao INT NOT NULL,
    numero_poltrona INT NOT NULL,
    id_sala INT NOT NULL,
    fila VARCHAR(5) NOT NULL,
    disponibilidade VARCHAR(25) NOT NULL,
    CONSTRAINT pk_disp_poltrona PRIMARY KEY (id_sessao,numero_poltrona,id_sala),
    CONSTRAINT fk_sessao FOREIGN KEY (id_sessao) REFERENCES cinema.sessao(id_sessao),
    CONSTRAINT fk_poltrona FOREIGN KEY (numero_poltrona,id_sala) REFERENCES cinema.poltrona(numero_poltrona,id_sala)
); 

CREATE TABLE cinema.plano_preco(
    id_ingresso INT NOT NULL,
    id_preco INT NOT NULL,
    CONSTRAINT pk_compra_item PRIMARY KEY (id_ingresso,id_preco),
    CONSTRAINT fk_ingresso FOREIGN KEY (id_ingresso) REFERENCES cinema.ingresso(id_ingresso),
    CONSTRAINT fk_preco FOREIGN KEY (id_preco) REFERENCES cinema.preco(id_preco)
);  

CREATE TABLE cinema.compra(
	id_compra SERIAL NOT NULL,
	codigo_compra VARCHAR(5) NOT NULL,
	data_compra DATE NOT NULL,
    hora_compra TIME NOT NULL,
	valor_compra cinema.tipo_valor NOT NULL,
	tipo_pagamento VARCHAR(25) NOT NULL,
	id_cliente INT NOT NULL,
	CONSTRAINT pk_compra PRIMARY KEY (id_compra),
	CONSTRAINT fk_cliente  FOREIGN KEY (id_cliente) REFERENCES cinema.cliente(id_cliente)
);

CREATE TABLE cinema.compra_ingresso(
    id_compra INT NOT NULL,
    id_ingresso INT NOT NULL,
    CONSTRAINT pk_compra_ingresso PRIMARY KEY (id_compra,id_ingresso),
    CONSTRAINT fk_compra FOREIGN KEY (id_compra) REFERENCES cinema.compra(id_compra),
    CONSTRAINT fk_ingresso FOREIGN KEY (id_ingresso) REFERENCES cinema.ingresso(id_ingresso)
); 

CREATE TABLE cinema.compra_produto(
    id_compra INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT pk_compra_produto PRIMARY KEY (id_compra,id_produto),
    CONSTRAINT fk_compra FOREIGN KEY (id_compra) REFERENCES cinema.compra(id_compra),
    CONSTRAINT fk_produto FOREIGN KEY (id_produto) REFERENCES cinema.produto(id_produto)
);  