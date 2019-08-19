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

select sum(a.quantidade) AS TOTAL, b.mes, b.ano, c.NM_PRODUTO as NOME_DO_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
inner join dim_produto c on (a.id_produto = c.id_produto)
--ORDER BY MES, ANO, NM_PRODUTO
GROUP BY MES, ANO, NM_PRODUTO
having sum(a.quantidade) is not null

/* 8.Qual o valor total de produtos do snack bar vendidos por dias, meses e ano? */

select P.TIPO_PLATAFORMA, B.ANO, B.DIA, B.MES, Sum(a.valor_pago) as VALOR_PAGO_TOTAL from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
INNER JOIN DIM_PLATAFORMA P ON (P.ID_PLATAFORMA = A.ID_PLATAFORMA)
WHERE TIPO_PLATAFORMA = 'PRESENCIAL'
GROUP BY ANO, DIA, MES, TIPO_PLATAFORMA
having sum(a.valor_pago) is not null

