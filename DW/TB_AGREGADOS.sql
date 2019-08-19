 -- 1. Qual o total de produtos vendidos em determinado período
 -- 2. Qual o valor total de produtos do snack bar vendidos por dias, meses e anos
CREATE TABLE AGREG_FATO_VENDA_PRODUTO_MENSAL (
	ID INT IDENTITY(1,1),
	ID_TEMPO INT NOT NULL REFERENCES DIM_TEMPO(ID_TEMPO),
	ID_PLATAFORMA INT NOT NULL REFERENCES DIM_PLATAFORMA (ID_PLATAFORMA),
	VALOR_PAGO_TOTAL NUMERIC(10,2) NOT NULL,
	QUANTIDADE INT NOT NULL
)

-- 3. Quais filmes que mais venderam ingressos em julho
-- 4. Qual total de ingressos vendidos no ano de 2019
CREATE TABLE AGREG_FATO_VENDA_INGRESSO_MENSAL_ANUAL (
	ID INT IDENTITY(1,1),
	ID_TEMPO INT NOT NULL REFERENCES DIM_TEMPO(ID_TEMPO),
	ID_FILME INT NOT NULL REFERENCES DIM_FILME(ID_FILME),
	VALOR_PAGO_TOTAL NUMERIC(10,2) NOT NULL,
	QUANTIDADE INT NOT NULL
)

-- 1.
select sum(a.quantidade) AS TOTAL, b.mes, b.ano, c.NM_PRODUTO as NOME_DO_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
inner join dim_produto c on (a.id_produto = c.id_produto)
--ORDER BY MES, ANO, NM_PRODUTO
GROUP BY MES, ANO, NM_PRODUTO
having sum(a.quantidade) is not null

-- 2.
select P.TIPO_PLATAFORMA, B.ANO, B.DIA, B.MES, Sum(a.valor_pago) as VALOR_PAGO_TOTAL from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
INNER JOIN DIM_PLATAFORMA P ON (P.ID_PLATAFORMA = A.ID_PLATAFORMA)
WHERE TIPO_PLATAFORMA = 'PRESENCIAL'
GROUP BY ANO, DIA, MES, TIPO_PLATAFORMA
having sum(a.valor_pago) is not null

-- 3.

SELECT SUM(I.QUANTIDADE) AS TOTAL,  FROM FATO_VENDA_INGRESSO I
INNER JOIN DIM TEMPO T ON (I.DIM_TEMPO = T.DIM_TEMPO)
INNER JOIN DIM_FILME  S ON (I.ID_FILME = S.ID_FILME)
WHERE NOME_MES = 'JULHO'
GROUP BY NOME
HAVING SUM(I.QUANTIDADE) IS NOT NULL
 
-- 4. 
SELECT SUM(A.QUANTIDADE) AS TOTAL, B.ANO FROM fato_venda_produto F
INNER JOIN DIM_TEMPO B ON (F.id_tempo = B.ID_TEMPO)
INNER JOIN DIM_INGRESSO P ON (P.id_ingresso = f.id_ingresso)
WHERE ANO = '2019'
GROUP BY ANO
HAVING SUM(A.QUANTIDADE) IS NOT NULL

 