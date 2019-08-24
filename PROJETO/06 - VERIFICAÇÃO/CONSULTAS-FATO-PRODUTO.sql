/* Igor e João */

select * from fato_venda_produto
select * from dim_tempo
select * from dim_cliente
select * from dim_endereco_cliente
select * from dim_cinema
select * from dim_plataforma
select * from dim_produto
select * from dim_pagamento
select * from dim_turno
select * from DIM_FILME

select * from tb_plataforma

/* 5.Qual o total de produtos vendidos em determinados períodos? */

SELECT SUM(A.QUANTIDADE) AS TOTAL, B.MES, B.ANO, C.NM_PRODUTO AS NOME_DO_PRODUTO FROM FATO_VENDA_PRODUTO A
INNER JOIN DIM_TEMPO B ON (A.ID_TEMPO = B.ID_TEMPO)
INNER JOIN DIM_PRODUTO C ON (A.ID_PRODUTO = C.ID_PRODUTO)
GROUP BY MES, ANO, NM_PRODUTO
HAVING SUM(A.QUANTIDADE) IS NOT NULL

/* 8.Qual o valor total de produtos do snack bar vendidos por dias, meses e ano? */

SELECT P.TIPO_PLATAFORMA, B.ANO, B.DIA, B.MES, SUM(A.VALOR_PAGO) AS VALOR_PAGO_TOTAL FROM FATO_VENDA_PRODUTO A
INNER JOIN DIM_TEMPO B ON(A.ID_TEMPO = B.ID_TEMPO)
INNER JOIN DIM_PLATAFORMA P ON (P.ID_PLATAFORMA = A.ID_PLATAFORMA)
WHERE TIPO_PLATAFORMA = 'PRESENCIAL'
GROUP BY ANO, DIA, MES, TIPO_PLATAFORMA
HAVING SUM(A.VALOR_PAGO) IS NOT NULL

