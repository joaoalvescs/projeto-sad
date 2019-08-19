/* 1.Quantidade de ingressos vendidos por gênero de filme? */

select sum(gr_filme), GENERO_FILME.gr_filme  as GENERO_FILME from dim_filme 
group by gr_filme
having sum(gr_filme) is not null

/* 2.Qual os dias, meses e anos que mais venderam ingressos? */

select sum(a.quantidade) as DIAS_COM_MAIS_VENDAS from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
group by data
having sum(a.quantidade) is not null

select sum(a.quantidade) as DIAS_COM_MAIS_VENDAS from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
group by ano
having sum(a.quantidade) is not null

select sum(a.quantidade) as DIAS_COM_MAIS_VENDAS from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
group by nome_mes
having sum(a.quantidade) is not null

/* 3.Quantidade de ingressos vendidos em determinados períodos por faixa etária? */


/* 4.Quantidade de ingressos vendidos por plataformas por período? */

select sum(a.quantidade) as TOTAL_INGRESSOS_PRESENCIAL from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
inner join dim_plataforma c on (b.id_plataforma = c.id_plataforma)
where b.ano = '2017' and c.tipo_plataforma = 'Presencial'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_INGRESSOS_PRESENCIAL from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
inner join dim_plataforma c on (b.id_plataforma = c.id_plataforma)
where b.ano = '2018' and c.tipo_plataforma = 'Presencial'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_INGRESSOS_ONLINE from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
inner join dim_plataforma c on (b.id_plataforma = c.id_plataforma)
where b.ano = '2017' and c.tipo_plataforma = 'Online'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_INGRESSOS_ONLINE from fato_venda_ingresso a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
inner join dim_plataforma c on (b.id_plataforma = c.id_plataforma)
where b.ano = '2018' and c.tipo_plataforma = 'Online'
having sum(a.quantidade) is not null

/* 6.Quantidade de pessoas por sessões? */

select sum(a.quantidade) as TOTAL_PESSOAS_SESSAO from fato_venda_ingresso a
inner join dim_sessao b on (a.id_sessao = b.id_sessao)
group by b.id_sessao
having sum(a.quantidade) is not null

/* 7.Quais os filmes que mais venderam ingressos no ano? */

select top a.nm_filme as FILMES_MAIS_INGRESSOS from dim_filme a
inner join fato_venda_ingresso b on (a.id_filme = b.id_filme)
inner join dim_tempo c on (b.id_tempo = c.id_tempo)
group by c.nm_filme

/* 8.Qual o valor total de ingressos vendidos por dias, meses e anos? */
/* 10.Qual o valor total de ingressos vendidos por plataformas em dias, meses e anos? */
/* 11.Qual a quantidade de clientes por determinado bairro, cidade e estado? */
/* 12.Quais os horários que mais venderam ingressos? */
/* 13.Total de clientes por plano utilizado? */
