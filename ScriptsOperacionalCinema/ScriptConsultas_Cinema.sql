/* BANCO DE DADOS 
Banco Cinema: Script de consultas
 Alisson Rodrigo Freire Santos
 Igor Terriaga Santos
*/

-- Select 1 --
-- Retornar as pessoas que nasceram depois de 1989 e contem a letra A no sobrenome --
SELECT primeiro_nome, sobrenome
FROM   cinema.pessoa WHERE data_nascimento > '01-01-1990' 
AND sobrenome LIKE '%a%'    

-- Select 2 --
-- Retornar todas as mulheres que forem clientes --
SELECT cpf,  
       primeiro_nome,
       sobrenome
FROM   cinema.pessoa AS pe 
NATURAL JOIN   cinema.cliente AS c  
WHERE  pe.sexo='F'

-- Select 3 --
-- Retornar os clientes que realizaram compra e as suas respectivas compras
SELECT     pe.cpf, 
           pe.primeiro_nome, 
           pe.sobrenome,
		   co.id_compra
FROM       cinema.pessoa AS pe 
INNER JOIN cinema.cliente   AS cl 
ON         (pe.id_pessoa = cl.id_pessoa) 
INNER JOIN cinema.compra AS co 
ON         (cl.id_cliente = co.id_cliente) 
ORDER BY pe.primeiro_nome

-- Select 4 --
-- Retornar os funcionários e onde eles residem --
SELECT     pe.primeiro_nome, 
           pe.sobrenome,
		   e.cidade,
		   e.rua
FROM       cinema.pessoa AS pe 
JOIN cinema.endereco AS e 
USING        (id_endereco) 
JOIN cinema.funcionario  AS f 
USING         (id_pessoa)

-- Select 5 --
-- Retornar a quantidade de ingressos disponíveis por filmes e opções de linguagem
SELECT  DISTINCT f.nome,
		   s.linguagem,
		   count(i.id_ingresso) as total_ingressos
FROM       cinema.filme AS f 
JOIN cinema.sessao AS s 
ON        (f.id_filme = s.id_filme) 
JOIN cinema.ingresso  AS i 
ON         (s.id_filme = i.id_filme) 
GROUP BY s.linguagem, f.nome
ORDER BY f.nome

-- Select 6 --
-- Retornar o produtos e a quantidade consumida em cada compra --
SELECT      c.codigo_compra,
            pr.nome_produto, 
            cpr.quantidade 
FROM        cinema.produto AS pr 
INNER JOIN  cinema.compra_produto AS cpr 
ON     (pr.id_produto = cpr.id_produto) 
INNER JOIN cinema.compra AS c 
ON     (cpr.id_compra = c.id_compra) 


-- Select 7 --
-- Retornar as poltronas que estão ativas e disponiveis em alguma sessão --
SELECT   DISTINCT p.id_sala as numero_sala,
         p.numero_poltrona, 
         p.fila
FROM     cinema.poltrona as p
INNER JOIN cinema.disp_poltrona as d
         ON(p.id_sala = d.id_sala)
GROUP BY p.id_sala, p.numero_poltrona, d.id_sessao, d.disponibilidade
HAVING p.estado_poltrona ='ATIVA' AND d.disponibilidade ='DISPONIVEL'

-- Select 8 --
-- Retornar os clientes e os filmes que cada um assistiu --
SELECT DISTINCT  pe.cpf,
		   pe.primeiro_nome,
		   pe.sobrenome,
           f.nome
FROM       cinema.pessoa AS pe 
JOIN cinema.cliente AS cl 
ON        (pe.id_pessoa = cl.id_pessoa) 
JOIN cinema.compra AS cp 
ON         (cl.id_cliente = cp.id_cliente) 
JOIN cinema.compra_ingresso AS ci 
ON         (cp.id_compra = ci.id_compra)
JOIN cinema.ingresso AS i 
ON         (ci.id_ingresso = i.id_ingresso)
JOIN cinema.sessao AS s 
ON         (i.id_sessao = s.id_sessao)
JOIN cinema.filme AS f 
ON         (s.id_filme = f.id_filme)    
ORDER BY pe.cpf

-- Select 9 -- 
-- Retornar todos os ingressos para as sessões que começam entre as 19h e as 20h --    
SELECT     i.status_ingresso,
           f.nome 
FROM       cinema.ingresso AS i 
INNER JOIN cinema.sessao   AS s 
ON         (i.id_sessao = s.id_sessao)
INNER JOIN cinema.filme AS f
ON         (s.id_filme = f.id_filme) 
WHERE      s.id_sessao 
			IN 
              ( 
              SELECT DISTINCT s.id_sessao 
              FROM            cinema.sessao AS s 
              WHERE           s.horario_sessao BETWEEN '19:00:00' AND '20:00:00'
              )

-- Select 10 --
-- Aplicar desconto de 20% nas compras realizadas à vista --
-- Retornar o comprador, valor original e valor descontado --
SELECT     cp.codigo_compra,
           pe.cpf,
           pe.primeiro_nome,
           cp.data_compra,
           cp.valor_compra AS valor_antigo,
           cp.valor_compra*0.80 AS valor_descontado 
FROM       cinema.compra AS cp 
INNER JOIN cinema.cliente  AS cl 
ON         (cp.id_cliente = cl.id_cliente)
INNER JOIN cinema.pessoa AS pe
ON         (cl.id_pessoa = pe.id_pessoa) 
WHERE      cp.id_compra 
			IN 
              ( 
              SELECT DISTINCT cp.id_compra 
              FROM            cinema.compra AS cp 
              WHERE           cp.tipo_pagamento ='À VISTA' 
              ) 