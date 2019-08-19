/* 1.Quantidade de ingressos vendidos por gênero de filme? */

select sum(GR_FILME) AS TOTAL, GENERO_FILME.gr_filme  as GENERO_FILME from DIM_FILME d
INNER JOIN FATO_VENDA_INGRESSO v on (v.ID_FILME = d.ID_FILME)
group by GR_FILME
having sum(GR_FILME) is not null

/* 2.Quais os dias, meses e anos que mais venderam ingressos? */

select sum(a.quantidade) as DIAS_COM_MAIS_VENDAS, B.DIA, B.MES, B.ANO from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
group by DIA, MES, ANO
having sum(a.quantidade) is not null

/* 3.Qual o total de ingressos vendidos por filme e por período? */
select i.id_fato_ingresso, f.nm_filme, sum(i.quantidade) as QUANTIDADE_TOTAL, t.DIA, t.mes, t.ano from fato_venda_ingresso i
inner join dim_tempo t on (i.id_tempo = t.id_tempo)
inner join dim_filme f on (t.id_filme = f.id_filme)
group by DIA ,MES, ANO
having sum(i.quantidade) is not null

/* 4.Quantidade de ingressos vendidos por plataformas por período? */

select sum(a.quantidade) as TOTAL_INGRESSOS_PRESENCIAL, B.DIA, B.MES ,B.ANO, C.TIPO_PLATAFORMA  from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
inner join dim_plataforma c on (b.id_plataforma = c.id_plataforma)
GROUP BY DIA,MES,ANO, C.TIPO_PLATAFORMA
having sum(a.quantidade) is not null

/* 6.Quais os filmes que mais venderam ingressos no ano? */

select top (5) a.nm_filme as FILMES from dim_filme a
inner join fato_venda_ingresso b on (a.id_filme = b.id_filme)
inner join dim_tempo c on (b.id_tempo = c.id_tempo)
group by c.nm_filme

/* 7.Qual o valor total de ingressos vendidos por dias, meses e anos? */
select sum(a.valor_pago) as VALOR_PAGO_TOTAL, t.DIA, t.MES, t.ANO from fato_venda_ingresso a
inner join DIM_TEMPO as t on (t.ID_TEMPO = a.fato_venda_ingresso )
group by DIA, MES, ANO
having sum(a.valor_pago) is not null


/* 9.Qual o valor total de ingressos vendidos por plataformas em dias, meses e anos? */
select sum(a.valor_pago) as TOTAL_INGRESSOS_POR_PLATAFORMA, B.DIA, B.MES ,B.ANO, C.TIPO_PLATAFORMA  from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
inner join dim_plataforma c on (b.id_plataforma = c.id_plataforma)
GROUP BY DIA,MES,ANO, C.TIPO_PLATAFORMA
having sum(a.quantidade) is not null

/* 10.Qual a quantidade de clientes por determinado bairro, cidade e estado? */
SELECT C.ID_CLIENTE, E.BAIRRO, E.CIDADE, E.ESTADO FROM DIM_CLIENTE C
INNER JOIN FATO_VENDA_INGRESSO I ON (I.ID_CLIENTE = C.ID_CLIENTE)
INNER JOIN DIM_ENDERECO_CLIENTE E ON (I.ID_ENDERECO = E.ID_ENDERECO)
GROUP BY BAIRRO, CIDADE, ESTADO
/* 11.Qual o turno que mais vendeu ingressos? */
SELECT TOP 1 (I.ID_FATO_INGRESSO), T.TIPO FROM FATO_VENDA_INGRESSO I
INNER JOIN DIM_TURNO T ON (I.ID_FATO_INGRESSO = T.ID_TURNO)
GROUP BY TIPO
/* 12.Total de clientes por plano utilizado? */
SELECT SUM(I.QUANTIDADE) AS TOTAL_CLIENTE, C.ID_CLIENTE, P.ID_PLANO, P.TIPO_PLANO FROM FATO_VENDA_INGRESSO I
INNER JOIN DIM_CLIENTE C ON (I.ID_CLIENTE = C.ID_CLIENTE)
INNER JOIN DIM_PLANO P ON (I.ID_PLANO = P.ID_PLANO)
GROUP BY TIPO_PLANO
HAVING SUM(I.QUANTIDADE) IS NOT NULL
