select * from fato_venda_produto
select * from dim_tempo
select * from dim_cliente
select * from dim_endereco_cliente
select * from dim_cinema
select * from dim_plataforma
select * from dim_produto
select * from dim_pagamento
select * from dim_turno

select * from tb_plataforma

/* 5.Qual o total de produtos vendidos em determinados períodos? */

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where data >= '20000101' and data <= '20091231'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where data >= '20100101' and data <= '20181231'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where nome_mes = 'Janeiro' and ano <= '2018'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where nome_mes = 'Fevereiro' and ano <= '2018'
having sum(a.quantidade) is not null


select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where nome_mes = 'Março' and ano <= '2018'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where nome_mes = 'Abril' and ano <= '2018'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where nome_mes = 'Maio' and ano <= '2018'
having sum(a.quantidade) is not null


select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where nome_mes = 'Junho' and ano <= '2018'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where nome_mes = 'Julho' and ano <= '2018'
having sum(a.quantidade) is not null


select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where nome_mes = 'Agosto' and ano <= '2018'
having sum(a.quantidade) is not null


select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where nome_mes = 'Setembro' and ano <= '2018'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where nome_mes = 'Outubro' and ano <= '2018'
having sum(a.quantidade) is not null


select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where nome_mes = 'Novembro' and ano <= '2018'
having sum(a.quantidade) is not null


select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where nome_mes = 'Dezembro' and ano <= '2018'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where semestre = 1 and ano <= '2018'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where semestre = 2 and ano <= '2018'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where trimestre = 1 and ano <= '2018'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where trimestre = 2 and ano <= '2018'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where trimestre = 3 and ano <= '2018'
having sum(a.quantidade) is not null

select sum(a.quantidade) as TOTAL_PRODUTO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where trimestre = 4 and ano <= '2018'
having sum(a.quantidade) is not null

/* 9.Qual o valor total de produtos do snack bar vendidos por dias, meses e anos? */

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.ano = '2016'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.ano = '2017'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.ano = '2019'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.dia_semana = 'Sábado' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.dia_semana = 'Domingo' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.nome_mes = 'Janeiro' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.nome_mes = 'Fevereiro' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.nome_mes = 'Março' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.nome_mes = 'Abril' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.nome_mes = 'Maio' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.nome_mes = 'Junho' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.nome_mes = 'Julho' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.nome_mes = 'Agosto' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.nome_mes = 'Setembro' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.nome_mes = 'Outubro' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.nome_mes = 'Novembro' and b.ano = '2018'
having sum(a.valor_pago) is not null

select sum(a.valor_pago) as VALOR_PAGO from fato_venda_produto a
inner join dim_tempo b on (a.id_tempo = b.id_tempo)
where b.nome_mes = 'Dezembro' and b.ano = '2018'
having sum(a.valor_pago) is not null