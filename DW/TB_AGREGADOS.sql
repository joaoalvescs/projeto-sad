 -- Qual o total de produtos vendidos em determinado período
 -- Qual o valor total de produtos do snack bar vendidos por dias, meses e anos
CREATE TABLE AGREG_FATO_VENDA_PRODUTO_MENSAL (
	ID_TEMPO INT NOT NULL REFERENCES DIM_TEMPO(ID_TEMPO),
	ID_PLATAFORMA INT NOT NULL REFERENCES DIM_PLATAFORMA (ID_PLATAFORMA),
	VALOR_PAGO_TOTAL NUMERIC(10,2) NOT NULL,
	QUANTIDADE INT NOT NULL
)