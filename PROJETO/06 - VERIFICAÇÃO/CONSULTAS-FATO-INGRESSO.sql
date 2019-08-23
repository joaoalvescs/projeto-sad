/* Igor e João */
USE CINEMA
/* 1.Quantidade de ingressos vendidos por gênero de filme? */ -- OK

select d.GR_FILME  as GENERO_FILME, sum(d.ID_FILME) AS TOTAL_INGRESSOS from DIM_FILME d
INNER JOIN FATO_VENDA_INGRESSO v on (v.ID_FILME = d.ID_FILME)
group by GR_FILME
having sum(d.ID_FILME) is not null

/* 2.Quais os dias, meses e anos que mais venderam ingressos? */ -- OK

select sum(a.quantidade) as DIAS_COM_MAIS_VENDAS, B.DIA, B.MES, B.ANO from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
group by DIA, MES, ANO
having sum(a.quantidade) is not null

/* 3.Qual o total de ingressos vendidos por filme e por período? */ -- OK
select f.NM_FILME,   t.DIA, t.MES, t.ANO, sum (i.QUANTIDADE) as QUANTIDADE_TOTAL from fato_venda_ingresso i
inner join dim_tempo t on (i.id_tempo = t.id_tempo)
inner join dim_filme f on (i.ID_FILME = f.id_filme)
group by F.NM_FILME, DIA ,MES, ANO
having sum(i.QUANTIDADE) is not null

/* 4.Quantidade de ingressos vendidos por plataformas por período? */ -- OK

select sum(a.quantidade) as TOTAL_INGRESSOS_PRESENCIAL, B.DIA, B.MES ,B.ANO, C.TIPO_PLATAFORMA  from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
inner join dim_plataforma c on (a.id_plataforma = c.id_plataforma)
GROUP BY DIA,MES,ANO, c.TIPO_PLATAFORMA
having sum(a.quantidade) is not null

/* 6.Quais os filmes que mais venderam ingressos no ano? */ --OK

select top (3) a.NM_FILME as FILMES, b.quantidade as QUANTIDADE_INGRESSOS_VENDIDOS, p.TIPO_PLATAFORMA  from dim_filme a
inner join fato_venda_ingresso b on (a.id_filme = b.ID_FILME)
inner join dim_tempo c on (b.ID_TEMPO = c.ID_TEMPO)
inner join DIM_PLATAFORMA p on (p.ID_PLATAFORMA = b.ID_PLATAFORMA)
group by a.nm_filme, p.TIPO_PLATAFORMA, b.quantidade

/* 7.Qual o valor total de ingressos vendidos por dias, meses e anos? */ -- OK
select sum(a.valor_pago) as VALOR_PAGO_TOTAL, t.DIA, t.MES, t.ANO from fato_venda_ingresso a
inner join DIM_TEMPO as t on (t.ID_TEMPO = a.ID_TEMPO )
group by DIA, MES, ANO
having sum(a.valor_pago) is not null


/* 9.Qual o valor total de ingressos vendidos por plataformas em dias, meses e anos? */ -- OK
select sum(a.valor_pago) as TOTAL_INGRESSOS_POR_PLATAFORMA, B.DIA, B.MES ,B.ANO, C.TIPO_PLATAFORMA  from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
inner join dim_plataforma c on (a.id_plataforma = c.id_plataforma)
GROUP BY DIA,MES,ANO, C.TIPO_PLATAFORMA
having sum(a.quantidade) is not null

/* 10.Qual a quantidade de clientes por determinado bairro, cidade e estado? */ -- OK
SELECT  E.BAIRRO, E.CIDADE, E.ESTADO,SUM(C.ID_CLIENTE) AS Quantidade FROM DIM_CLIENTE C
INNER JOIN FATO_VENDA_INGRESSO I ON (I.ID_CLIENTE = C.ID_CLIENTE)
INNER JOIN DIM_ENDERECO_CLIENTE E ON (I.ID_ENDERECO = E.ID_ENDERECO)
GROUP BY BAIRRO, CIDADE, ESTADO
HAVING SUM(C.ID_CLIENTE) IS NOT NULL

/* 11.Qual o turno que mais vendeu ingressos? */ -- OK
SELECT TOP 1 (T.TIPO), I.QUANTIDADE FROM FATO_VENDA_INGRESSO I
INNER JOIN DIM_TURNO T ON (I.ID_FATO_INGRESSO = T.ID_TURNO)
GROUP BY TIPO, I.QUANTIDADE

/* 12.Total de clientes por plano de desconto utilizado? */ -- OK
SELECT P.TIPO_PLANO, SUM(C.ID_CLIENTE) AS TOTAL_CLIENTE FROM FATO_VENDA_INGRESSO I
INNER JOIN DIM_CLIENTE C ON (I.ID_CLIENTE = C.ID_CLIENTE)
INNER JOIN DIM_PLANO P ON (I.ID_PLANO = P.ID_PLANO)
GROUP BY P.TIPO_PLANO
HAVING SUM(C.ID_CLIENTE) IS NOT NULL
