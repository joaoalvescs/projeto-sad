 -- 1. Qual o total de produtos vendidos em determinado período
 -- 2. Qual o valor total de produtos do snack bar vendidos por dias, meses e anos
CREATE TABLE AGREG_FATO_VENDA_PRODUTO_MENSAL (
	ID INT IDENTITY(1,1),
	ID_TEMPO INT NOT NULL REFERENCES DIM_TEMPO(ID_TEMPO),
	ID_PLATAFORMA INT NOT NULL REFERENCES DIM_PLATAFORMA (ID_PLATAFORMA),
	ID_PRODUTO INT NOT NULL REFERENCES DIM_PRODUTO (ID_PRODUTO),
	VALOR_PAGO_TOTAL NUMERIC(10,2) NOT NULL,
	QUANTIDADE INT NOT NULL
)

-- 3. Quais filmes que mais venderam ingressos em julho
-- 4. Qual total de ingressos vendidos no ano de 2019
CREATE TABLE AGREG_FATO_VENDA_INGRESSO_MENSAL_ANUAL (
	ID INT IDENTITY(1,1),
	ID_TEMPO INT NOT NULL REFERENCES DIM_TEMPO(ID_TEMPO),
	ID_FILME INT NOT NULL REFERENCES DIM_FILME(ID_FILME),
	ID_INGRESSO INT NOT NULL REFERENCES DIM_INGRESSO (ID_INGRESSO),
	VALOR_PAGO_TOTAL NUMERIC(10,2) NOT NULL,
	QUANTIDADE INT NOT NULL
)

-- 1.
SELECT sum(A.QUANTIDADE) AS TOTAL, B.MES, B.ANO, C.NM_PRODUTO AS NOME_DO_PRODUTO FROM AGREG_FATO_VENDA_PRODUTO_MENSAL A
INNER JOIN DIM_TEMPO B ON (A.ID_TEMPO = B.ID_TEMPO)
INNER JOIN DIM_PRODUTO C ON (A.ID_PRODUTO = C.ID_PRODUTO)
--ORDER BY MES, ANO, NM_PRODUTO
GROUP BY MES, ANO, NM_PRODUTO
HAVING SUM(A.QUANTIDADE) IS NOT NULL

-- 2.
SELECT P.TIPO_PLATAFORMA, B.ANO, B.DIA, B.MES, SUM(A.VALOR_PAGO) as VALOR_PAGO_TOTAL FROM AGREG_FATO_VENDA_PRODUTO_MENSAL A
INNER JOIN DIM_TEMPO B on (A.ID_TEMPO = B.ID_TEMPO)
INNER JOIN DIM_PLATAFORMA P ON (P.ID_PLATAFORMA = A.ID_PLATAFORMA)
WHERE TIPO_PLATAFORMA = 'PRESENCIAL'
GROUP BY ANO, DIA, MES, TIPO_PLATAFORMA
having sum(A.valor_pago) is not null

-- 3.

SELECT SUM(I.QUANTIDADE) AS TOTAL,  FROM AGREG_FATO_VENDA_INGRESSO_MENSAL_ANUAL I
INNER JOIN DIM_TEMPO T ON (I.DIM_TEMPO = T.DIM_TEMPO)
INNER JOIN DIM_FILME  S ON (I.ID_FILME = S.ID_FILME)
WHERE NOME_MES = 'JULHO'
GROUP BY NOME
HAVING SUM(I.QUANTIDADE) IS NOT NULL
 
-- 4. 
SELECT SUM(A.QUANTIDADE) AS TOTAL, B.ANO FROM AGREG_FATO_VENDA_INGRESSO_MENSAL_ANUAL F
INNER JOIN DIM_TEMPO B ON (F.id_tempo = B.ID_TEMPO)
INNER JOIN DIM_INGRESSO P ON (P.id_ingresso = f.id_ingresso)
WHERE ANO = '2019'
GROUP BY ANO
HAVING SUM(A.QUANTIDADE) IS NOT NULL

 