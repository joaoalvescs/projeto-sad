USE CINEMA 
GO

INSERT INTO TB_UNIDADE_CINEMA VALUES( 'Cinema Itabaiana','O único cinema em Itabaiana')
INSERT INTO TB_UNIDADE_CINEMA VALUES( 'Cinema Jardins','O único cinema fora do shopping no bairro Jardins em Aracaju')
INSERT INTO TB_UNIDADE_CINEMA VALUES( 'Cinema Centro','Um dos poucos cinemas no Centro de Aracaju')

-- ENDERECOS --
-- rua, numero, cidade, bairro, complemento, estado, cep
INSERT INTO TB_ENDERECO VALUES ('Rua Riachuelo',65, 'Estância', 'Botequim','Casa', 'SE', '49500000');
INSERT INTO TB_ENDERECO VALUES ('Rua Moreira', 15, 'Umbaúba', 'José Ferreira','Apartamento: A8', 'SE', '495000487');
INSERT INTO TB_ENDERECO VALUES ('Rua B',223, 'Aracaju', 'Atalaia','Casa', 'AL', '49500987');
INSERT INTO TB_ENDERECO VALUES ('Rua SE',80, 'Aracaju', 'Bugio','Casa', 'SE', '49500000');
INSERT INTO TB_ENDERECO VALUES ('Rua E',154, 'Aracaju', 'Farolândia','Condomínio', 'SE', '49500000');
INSERT INTO TB_ENDERECO VALUES ('Rua Fonsceca',310, 'Aracaju', 'Atalaia','Apartamento: E26', 'SE', '49500000');
INSERT INTO TB_ENDERECO VALUES ('Rua X',76, 'São Cristóvão', 'Floresta','Casa', 'SE', '49500000');
INSERT INTO TB_ENDERECO VALUES ('Rua Comercial',214, 'Aracaju', 'Centro','Apartamento: G10', 'SE', '49500000');
INSERT INTO TB_ENDERECO VALUES ('Rua J',154, 'Aracaju', 'América','', 'SE', '49500000');
INSERT INTO TB_ENDERECO VALUES ('Rua São João',310, 'Aracaju', 'Atalaia','Apartamento: B15', 'SE', '49500000');
INSERT INTO TB_ENDERECO VALUES ('Rua C',44, 'Aracaju', 'Inácio Barbosa','Apartamento', 'SE', '495000061');
INSERT INTO TB_ENDERECO VALUES ('Rua Euclides',125, 'Aracaju', 'Centro','Apartamento: A5', 'SE', '49500097');
INSERT INTO TB_ENDERECO VALUES ('Rua Peixoto',77, 'Contagem', 'Centro','', 'MG', '49500000');
INSERT INTO TB_ENDERECO	VALUES ('Rua Valério',86, 'Aracaju', 'Bugio','Casa', 'SE', '49500000');

------ PLANO ------------------------
-- tipo plano --
INSERT INTO TB_PLANO VALUES ('VIVO VALORIZA')
INSERT INTO TB_PLANO VALUES ('VALE CULTURA')
INSERT INTO TB_PLANO VALUES ('INTEIRA')
INSERT INTO TB_PLANO VALUES ('MEIA')

-- PESSOA --
-- cpf, sexo, nome, sobrenome, dt nascimento, id endereco
INSERT INTO TB_PESSOA VALUES ('32165498713', 'M', 'Antonio', 'Nunes', '19870101',   1);   
INSERT INTO TB_PESSOA VALUES ('98765412366', 'M', 'Rafael', 'Prado', '19921015',    2);
INSERT INTO TB_PESSOA VALUES ('00012457898', 'F', 'Laura', 'Melo', '19901230',      3);
INSERT INTO TB_PESSOA VALUES ('12454789631', 'M', 'Pedro', 'Luciano', '19950311',   4);
INSERT INTO TB_PESSOA VALUES ('04512457893', 'F', 'Priscila', 'Santana', '19910526',5);
INSERT INTO TB_PESSOA VALUES ('01245368790', 'M', 'Roger', 'Machado', '19970320',   6);
INSERT INTO TB_PESSOA VALUES ('95314558764', 'F', 'Luana', 'Oliveira', '19940409',  7);
INSERT INTO TB_PESSOA VALUES ('13682457247', 'F', 'Maria', 'Santana', '19960211',   8);
INSERT INTO TB_PESSOA VALUES ('45789654125', 'M', 'Carlos', 'Eduardo', '19931219',  9);
INSERT INTO TB_PESSOA VALUES ('00245783651', 'F', 'Sara', 'Morais', '19980827',    10);
INSERT INTO TB_PESSOA VALUES ('45789621454', 'M', 'Jimmie', 'Johnson', '19960408', 11);
INSERT INTO TB_PESSOA VALUES ('02345698723', 'M', 'Edson', 'Motta', '19900723',    12);
INSERT INTO TB_PESSOA VALUES ('57695298530', 'M', 'Eduardo', 'Braga', '19861024',  13);
INSERT INTO TB_PESSOA VALUES ('14526751222', 'M', 'Valentino', 'Rossi', '19851025',14);


-- CLIENTE --
-- id pessoa, id endereco
INSERT INTO TB_CLIENTE VALUES (5,5);
INSERT INTO TB_CLIENTE VALUES (6,6);
INSERT INTO TB_CLIENTE VALUES (7,7);
INSERT INTO TB_CLIENTE VALUES (8,8);
INSERT INTO TB_CLIENTE VALUES (9,9);
INSERT INTO TB_CLIENTE VALUES (10,10);
INSERT INTO TB_CLIENTE VALUES (11,11);
INSERT INTO TB_CLIENTE VALUES (12,12);
INSERT INTO TB_CLIENTE VALUES (13,13);
INSERT INTO TB_CLIENTE VALUES (14,14);

-- FUNCIONARIO --
--cargo, carga horaria, salario, id pessoa, id endereco -----------

INSERT INTO TB_FUNCIONARIO VALUES ('Gerente', 8, 1100.00, 5, 5);
INSERT INTO TB_FUNCIONARIO VALUES ('Bilheiteiro', 12, 650.00, 2, 2);
INSERT INTO TB_FUNCIONARIO VALUES ('Balconista da lanchonete', 12, 650.00, 3, 3);
INSERT INTO TB_FUNCIONARIO VALUES ('Operador de filme', 12, 750.00, 4, 4);


-- PRODUTO --
-- nome, valor, disponibilidade -----------
INSERT INTO TB_PRODUTO VALUES ('Pipoca', 5.00, 'SIM');
INSERT INTO TB_PRODUTO VALUES ('Biscoito', 5.00, 'SIM');
INSERT INTO TB_PRODUTO VALUES ('Chiclete', 2.00, 'SIM');
INSERT INTO TB_PRODUTO VALUES ('Coca Cola', 7.00, 'SIM');
INSERT INTO TB_PRODUTO VALUES ('Guaraná Antártica', 6.00, 'SIM');
INSERT INTO TB_PRODUTO VALUES ('Cachorro Quente', 5.00, 'SIM');
INSERT INTO TB_PRODUTO VALUES ('Água', 3.00, 'SIM');
INSERT INTO TB_PRODUTO VALUES ('Chocolate', 4.00, 'SIM');
INSERT INTO TB_PRODUTO VALUES ('Barra de Cereal', 3.00, 'SIM');

-- SALA ---
-- numero ---
INSERT INTO TB_SALA VALUES (1);
INSERT INTO TB_SALA VALUES (2);
INSERT INTO TB_SALA VALUES (3);
INSERT INTO TB_SALA VALUES (4);
INSERT INTO TB_SALA VALUES (5);

-- POLTRONA --
-- SALA 1 --
INSERT INTO TB_POLTRONA  VALUES ('A', 'ATIVA',  1);
INSERT INTO TB_POLTRONA VALUES ( 'B', 'ATIVA', 1 );
INSERT INTO TB_POLTRONA VALUES ( 'C', 'ATIVA', 1);
INSERT INTO TB_POLTRONA VALUES ( 'D', 'ATIVA', 1);

-- SALA 2 --
INSERT INTO TB_POLTRONA  VALUES ('A', 'ATIVA', 2);
INSERT INTO TB_POLTRONA VALUES ( 'B', 'ATIVA', 2 );
INSERT INTO TB_POLTRONA VALUES ( 'C', 'ATIVA', 2);
INSERT INTO TB_POLTRONA VALUES ( 'D', 'ATIVA', 2);
-- SALA 3 --
INSERT INTO TB_POLTRONA  VALUES ('A', 'ATIVA', 3);
INSERT INTO TB_POLTRONA VALUES ( 'B', 'ATIVA', 3 );
INSERT INTO TB_POLTRONA VALUES ( 'C', 'ATIVA', 3);
INSERT INTO TB_POLTRONA VALUES ( 'D', 'ATIVA', 3);
    
-- SALA 4 --
INSERT INTO TB_POLTRONA  VALUES ('A', 'ATIVA', 4);
INSERT INTO TB_POLTRONA VALUES ( 'B', 'ATIVA', 4 );
INSERT INTO TB_POLTRONA VALUES ( 'C', 'ATIVA', 4);
INSERT INTO TB_POLTRONA VALUES ( 'D', 'ATIVA', 4);
    
-- SALA 5 --
INSERT INTO TB_POLTRONA  VALUES ('A', 'ATIVA', 5);
INSERT INTO TB_POLTRONA VALUES ( 'B', 'ATIVA', 5 );
INSERT INTO TB_POLTRONA VALUES ( 'C', 'ATIVA', 5);
INSERT INTO TB_POLTRONA VALUES ( 'D', 'ATIVA', 5);

-- FILME --
-- diretor, indicacao, genero, nome, sinopse, produtora, duracao

INSERT INTO TB_FILME VALUES ('Ruben Fleischer' , 16, 'Ficção científica', 'Venom','Eddie Brock é um 
    jornalista que investiga o misterioso trabalho de um cientista, suspeito de utilizar cobaias 
    humanas em experimentos mortais. Quando ele acaba entrando em contato com um simbionte alienígena.', 'Sony Pictures', 110);
    
INSERT INTO TB_FILME VALUES ('J. A. Bayona' , 14, 'Aventura', 'Jurassic World: Reino Ameaçado','Owen e Claire retornam à ilha Nublar para 
    salvar os dinossauros restantes de um vulcão que está prestes a entrar em erupção. Eles encontram novas e aterrorizantes 
    raças de dinossauros gigantes ao descobrir uma conspiração que ameaça todo o planeta.', 'Universal Pictures', 130);
    
INSERT INTO TB_FILME VALUES ('Jon Turteltaub' , 14, 'Ficção científica', 'Megatubarão','Na fossa mais profunda do Oceano Pacífico, 
    a tripulação de um submarino fica presa dentro do local após ser atacada por uma criatura pré-histórica que se achava estar extinta, 
    um tubarão de mais de 20 metros de comprimento, o Megalodon.', 'Warner Bros. Entertainment', 112);
    
INSERT INTO TB_FILME VALUES ('Corin Hardy' , 18, 'Terror', 'A Freira','Presa em um convento na Romênia, uma freira comete suicídio. 
    Para investigar o caso, o Vaticano envia um padre assombrado e uma noviça prestes a se tornar freira. Arriscando suas vidas, 
    a fé e até suas almas, os dois descobrem um segredo profano.', 'Sony Pictures', 100);
    
INSERT INTO TB_FILME VALUES ('David Leitch' , 14, 'Ficção científica', 'Deadpool 2','O supersoldado Cable vem do futuro com a missão de assassinar 
    o jovem mutante Russel e o mercenário Deadpool precisa aprender o que é ser herói de verdade para salvá-lo.', 'Marvel', 120);
    
INSERT INTO TB_FILME VALUES ('Sylvain White' , 16, 'Terror', 'Slender Man','As amigas Wren, Hallie, Chloe e Katie levam uma vida entediante no colégio. 
    Quando ouvem falar em um monstro chamado Slender Man, elas decidem invocá-lo por meio de um vídeo na Internet.', 'Sony Pictures Entertainment', 91);
    
 -- SESSAO -- 
 -- data sessao, horario, linguagem, id filme, id sala   
INSERT INTO TB_SESSAO VALUES ('04-09-2018', '19:00:00', 'DUBLADO', 1, 1);
INSERT INTO TB_SESSAO VALUES ('05-09-2018', '19:30:00', 'LEGENDADO', 2, 2);
INSERT INTO TB_SESSAO VALUES ('05-09-2018', '19:30:00', 'DUBLADO', 3, 3);    
INSERT INTO TB_SESSAO VALUES ('06-09-2018', '21:00:00', 'LEGENDADO', 4, 4);
INSERT INTO TB_SESSAO VALUES ('06-09-2018', '21:30:00', 'DUBLADO', 5, 5);
-- Plataforma --
-- tipo
INSERT INTO TB_PLATAFORMA VALUES ('ONLINE');
INSERT INTO TB_PLATAFORMA VALUES ('PRESENCIAL');

-- INGRESSOS COMPRADOS --, 
-- disponibilidade, valor ingresso, id plano, id filme, id sessao, num poltrona, id sala
-- COMPRA 1 --
INSERT INTO TB_INGRESSO VALUES ('VENDIDO', '10.0',1, 1, 1, 1, 1);
INSERT INTO TB_INGRESSO VALUES ('VENDIDO', '10.0',2, 1, 2, 2, 1);
-- COMPRA 2 --    
INSERT INTO TB_INGRESSO VALUES ('VENDIDO', '10.0', 3, 2, 1, 3,1);
-- COMPRA 3 --    
INSERT INTO TB_INGRESSO VALUES ('VENDIDO', '20.0',3, 5, 4, 4, 1);
-- COMPRA 4 --    
INSERT INTO TB_INGRESSO VALUES ('VENDIDO', '20.0',3, 3, 2, 5, 1);
-- COMPRA 5 --    
INSERT INTO TB_INGRESSO VALUES ('VENDIDO', '20.0', 4, 3, 5, 1, 2);
-- COMPRA 6 --    
INSERT INTO TB_INGRESSO VALUES ('VENDIDO', '10.0',1, 4, 2, 2, 2);
-- COMPRA 7 --    
INSERT INTO TB_INGRESSO VALUES ('VENDIDO', '20.0',2, 4, 4, 3, 2);
INSERT INTO TB_INGRESSO VALUES ('VENDIDO', '10.0',2, 3, 5, 4, 2);
-- COMPRA 8 --    
INSERT INTO TB_INGRESSO VALUES ('VENDIDO', '20.0' ,3, 5, 2, 5,2);
    
-- INGRESSOS À VENDA: SESSAO 1 --
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 1, 3, 1, 1);
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 1, 4, 2, 1);
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 1, 5, 3, 1);
 
-- INGRESSOS À VENDA: SESSAO 2 --
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 2, 2, 1, 2);
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 2, 3, 2, 2);
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 2, 4, 3, 2);
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 2, 5, 4, 2);

-- INGRESSOS À VENDA: SESSAO 3 --
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 3, 4, 1, 3);
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 3, 5, 2, 3);
    
-- INGRESSOS À VENDA: SESSAO 4 --    
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 4, 1, 3, 4);
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 4, 3, 4, 4);
    
-- INGRESSOS À VENDA: SESSAO 5 --
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 5, 1, 1, 5);
INSERT INTO TB_INGRESSO VALUES ('À VENDA','20.0',3, 5, 4, 2, 5);
 
-- COMPRA PRODUTO--
INSERT INTO TB_COMPRA VALUES ('10001', '04-09-2018', '19:10:00', 87.00, 'À PRAZO', 1, 1, 1);
INSERT INTO TB_COMPRA VALUES ('10002', '05-09-2018', '19:15:00', 35.00, 'À VISTA', 2, 2, 1);
INSERT INTO TB_COMPRA VALUES ('10003', '05-09-2018', '19:18:00', 29.00, 'À VISTA', 3, 1, 1);
INSERT INTO TB_COMPRA VALUES ('10004', '05-09-2018', '19:21:00', 20.00, 'À VISTA', 4, 2, 1);
INSERT INTO TB_COMPRA VALUES ('10005', '05-09-2018', '19:25:00', 15.00, 'À VISTA', 5, 1, 1);
INSERT INTO TB_COMPRA VALUES ('10006', '06-09-2018', '20:52:00', 31.00, 'À VISTA', 6, 2, 1);
INSERT INTO TB_COMPRA VALUES ('10007', '06-09-2018', '20:56:00', 55.00, 'À PRAZO', 7, 1, 1);
INSERT INTO TB_COMPRA VALUES ('10008', '06-09-2018', '21:15:00', 45.00, 'À PRAZO', 8, 2, 1);
    
  
-- COMPRA_INGRESSO --
INSERT INTO TB_COMPRA_INGRESSO VALUES (1, 1);
INSERT INTO TB_COMPRA_INGRESSO VALUES (2, 2);
INSERT INTO TB_COMPRA_INGRESSO VALUES (3, 3);
INSERT INTO TB_COMPRA_INGRESSO VALUES (4, 4);
INSERT INTO TB_COMPRA_INGRESSO VALUES (5, 5);
INSERT INTO TB_COMPRA_INGRESSO VALUES (6, 6);
INSERT INTO TB_COMPRA_INGRESSO VALUES (7, 7);
INSERT INTO TB_COMPRA_INGRESSO VALUES (8, 8);
    
-- COMPRA_PRODUTO --    
INSERT INTO TB_COMPRA_PRODUTO VALUES (1, 1);
INSERT INTO TB_COMPRA_PRODUTO VALUES (2, 4);  
INSERT INTO TB_COMPRA_PRODUTO VALUES (3, 5);
INSERT INTO TB_COMPRA_PRODUTO VALUES (4, 6);
INSERT INTO TB_COMPRA_PRODUTO VALUES (5, 1);
INSERT INTO TB_COMPRA_PRODUTO VALUES (6, 2);
INSERT INTO TB_COMPRA_PRODUTO VALUES (7, 1);
INSERT INTO TB_COMPRA_PRODUTO VALUES (8, 5);

-- TURNO --
INSERT INTO TB_TURNO VALUES ('MATINE')
INSERT INTO TB_TURNO VALUES ('NOITE')


-- SESSAO_TURNO --
INSERT INTO TB_SESSAO_TURNO VALUES (1,1)
INSERT INTO TB_SESSAO_TURNO VALUES (2,2)
INSERT INTO TB_SESSAO_TURNO VALUES (3,1)
INSERT INTO TB_SESSAO_TURNO VALUES (4,2)
INSERT INTO TB_SESSAO_TURNO VALUES (5,1)