/* BANCO DE DADOS 
Banco Cinema: Script de povoamento
 Igor Terriaga Santos
*/

-- ENDERECOS --
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua Riachuelo',65, 'Estância', 'Botequim','Casa');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua Moreira', 15, 'Umbaúba', 'José Ferreira','Apartamento: A8');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua B',223, 'Aracaju', 'Atalaia','Casa');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua SE',80, 'Aracaju', 'Bugio','Casa');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua E',154, 'Aracaju', 'Farolândia','Condomínio');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua Fonsceca',310, 'Aracaju', 'Atalaia','Apartamento: E26');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua X',76, 'São Cristóvão', 'Floresta','Casa');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua Comercial',214, 'Aracaju', 'Centro','Apartamento: G10');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua J',154, 'Aracaju', 'América','');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua São João',310, 'Aracaju', 'Atalaia','Apartamento: B15');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua C',44, 'Aracaju', 'Inácio Barbosa','Apartamento');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua Euclides',125, 'Aracaju', 'Centro','Apartamento: A5');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua Peixoto',77, 'Aracaju', 'Centro','');
INSERT INTO cinema.endereco (rua, numero, cidade, bairro, complemento) 
	VALUES ('Rua Valério',86, 'Aracaju', 'Bugio','Casa');
    
-- PESSOA --
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('32165498712', 'M', 'Antonio', 'Nunes', '07-06-1987', 1);   
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('98765412365', 'M', 'Rafael', 'Prado', '15-10-1992', 2);
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('00012457899', 'F', 'Laura', 'Melo', '30-12-1990', 3);
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('12454789632', 'M', 'Pedro', 'Luciano', '11-03-1995', 4);
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('04512457896', 'F', 'Priscila', 'Santana', '26-05-1991', 5);
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('01245368792', 'M', 'Roger', 'Machado', '20-03-1997', 6);
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('95314558761', 'F', 'Luana', 'Oliveira', '04-09-1994', 7);
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('13682457240', 'F', 'Maria', 'Santana', '02-11-1996', 8);
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('45789654126', 'M', 'Carlos', 'Eduardo', '19-12-1993', 9);
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('00245783650', 'F', 'Sara', 'Morais', '27-08-1998', 10);
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('45789621452', 'M', 'Jimmie', 'Johnson', '04-08-1996', 11);
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('02345698726', 'M', 'Edson', 'Motta', '23-07-1990', 12);
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('57695298532', 'M', 'Eduardo', 'Braga', '24-10-1986', 13);
INSERT INTO cinema.pessoa (cpf, sexo, primeiro_nome, sobrenome, data_nascimento, id_endereco) 
	VALUES ('14526751236', 'M', 'Valentino', 'Rossi', '24-10-1985', 14);

-- CLIENTE --
INSERT INTO cinema.cliente (id_pessoa, id_endereco) 
	VALUES (5,5);
INSERT INTO cinema.cliente (id_pessoa, id_endereco) 
	VALUES (6,6);
INSERT INTO cinema.cliente (id_pessoa, id_endereco) 
	VALUES (7,7);
INSERT INTO cinema.cliente (id_pessoa, id_endereco) 
	VALUES (8,8);
INSERT INTO cinema.cliente (id_pessoa, id_endereco) 
	VALUES (9,9);
INSERT INTO cinema.cliente (id_pessoa, id_endereco) 
	VALUES (10,10);
INSERT INTO cinema.cliente (id_pessoa, id_endereco) 
	VALUES (11,11);
INSERT INTO cinema.cliente (id_pessoa, id_endereco) 
	VALUES (12,12);
INSERT INTO cinema.cliente (id_pessoa, id_endereco) 
	VALUES (13,13);
INSERT INTO cinema.cliente (id_pessoa, id_endereco) 
	VALUES (14,14);

-- FUNCIONARIO --
INSERT INTO cinema.funcionario (cargo, carga_horaria, salario, id_pessoa, id_endereco) 
	VALUES ('Gerente', 8, 1100.00, 1, 1);
INSERT INTO cinema.funcionario (cargo, carga_horaria, salario, id_pessoa, id_endereco) 
	VALUES ('Bilheiteiro', 12, 650.00, 2, 2);
INSERT INTO cinema.funcionario (cargo, carga_horaria, salario, id_pessoa, id_endereco) 
	VALUES ('Balconista da lanchonete', 12, 650.00, 3, 3);
INSERT INTO cinema.funcionario (cargo, carga_horaria, salario, id_pessoa, id_endereco) 
	VALUES ('Operador de filme', 12, 750.00, 4, 4);


-- PRODUTO --
INSERT INTO cinema.produto (nome_produto, valor_produto, disponibilidade) 
    VALUES ('Pipoca', 5.00, 'SIM');
INSERT INTO cinema.produto (nome_produto, valor_produto, disponibilidade) 
    VALUES ('Biscoito', 5.00, 'SIM');
INSERT INTO cinema.produto (nome_produto, valor_produto, disponibilidade) 
    VALUES ('Chiclete', 2.00, 'SIM');
INSERT INTO cinema.produto (nome_produto, valor_produto, disponibilidade) 
    VALUES ('Coca Cola', 7.00, 'SIM');
INSERT INTO cinema.produto (nome_produto, valor_produto, disponibilidade) 
    VALUES ('Guaraná Antártica', 6.00, 'SIM');
INSERT INTO cinema.produto (nome_produto, valor_produto, disponibilidade) 
    VALUES ('Cachorro Quente', 5.00, 'SIM');
INSERT INTO cinema.produto (nome_produto, valor_produto, disponibilidade) 
    VALUES ('Água', 3.00, 'SIM');
INSERT INTO cinema.produto (nome_produto, valor_produto, disponibilidade) 
    VALUES ('Chocolate', 4.00, 'SIM');
INSERT INTO cinema.produto (nome_produto, valor_produto, disponibilidade) 
    VALUES ('Barra de Cereal', 3.00, 'SIM');

-- PRECO --
INSERT INTO cinema.preco (vivo_valoriza, vale_cultura, inteira, meia_entrada) 
    VALUES (10.00, 8.00, 30.00, 15.00);
INSERT INTO cinema.preco (vivo_valoriza, vale_cultura, inteira, meia_entrada) 
    VALUES (10.00, 6.00, 24.00, 12.00);
INSERT INTO cinema.preco (vivo_valoriza, vale_cultura, inteira, meia_entrada) 
    VALUES (6.00, 5.00, 15.00, 7.50);
INSERT INTO cinema.preco (vivo_valoriza, vale_cultura, inteira, meia_entrada) 
    VALUES (8.00, 6.00, 20.00, 10.00);
INSERT INTO cinema.preco (vivo_valoriza, vale_cultura, inteira, meia_entrada) 
    VALUES (7.00, 6.00, 16.00, 8.00);
INSERT INTO cinema.preco (vivo_valoriza, vale_cultura, inteira, meia_entrada) 
    VALUES (9.00, 5.00, 25.00, 12.50);

-- SALA --
INSERT INTO cinema.sala (numero_sala) 
    VALUES (1);
INSERT INTO cinema.sala (numero_sala) 
    VALUES (2);
INSERT INTO cinema.sala (numero_sala) 
    VALUES (3);
INSERT INTO cinema.sala (numero_sala) 
    VALUES (4);
INSERT INTO cinema.sala (numero_sala) 
    VALUES (5);
    
-- POLTRONA --
-- SALA 1 --
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (1, 1, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (2, 1, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (3, 1, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (4, 1, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (5, 1, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (6, 1, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (7, 1, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (8, 1, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (9, 1, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (10, 1, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (11, 1, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (12, 1, 'C', 'ATIVA');    
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (13, 1, 'D', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (14, 1, 'D', 'ATIVA');  
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (15, 1, 'D', 'ATIVA');  
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (16, 1, 'D', 'ATIVA');  
    
-- SALA 2 --
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (1, 2, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (2, 2, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (3, 2, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (4, 2, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (5, 2, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (6, 2, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (7, 2, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (8, 2, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (9, 2, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (10, 2, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (11, 2, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (12, 2, 'C', 'ATIVA');    
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (13, 2, 'D', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (14, 2, 'D', 'DESATIVADA');  
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (15, 2, 'D', 'ATIVA');  
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (16, 2, 'D', 'DESATIVADA');  
    
-- SALA 3 --
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (1, 3, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (2, 3, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (3, 3, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (4, 3, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (5, 3, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (6, 3, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (7, 3, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (8, 3, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (9, 3, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (10, 3, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (11, 3, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (12, 3, 'C', 'ATIVA');    
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (13, 3, 'D', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (14, 3, 'D', 'DESATIVADA');  
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (15, 3, 'D', 'DESATIVADA');  
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (16, 3, 'D', 'DESATIVADA');  
    
-- SALA 4 --
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (1, 4, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (2, 4, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (3, 4, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (4, 4, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (5, 4, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (6, 4, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (7, 4, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (8, 4, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (9, 4, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (10, 4, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (11, 4, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (12, 4, 'C', 'ATIVA');    
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (13, 4, 'D', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (14, 4, 'D', 'ATIVA');  
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (15, 4, 'D', 'ATIVA');  
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (16, 4, 'D', 'DESATIVADA');  
    
-- SALA 5 --
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (1, 5, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (2, 5, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (3, 5, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (4, 5, 'A', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (5, 5, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (6, 5, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (7, 5, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (8, 5, 'B', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (9, 5, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (10, 5, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (11, 5, 'C', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (12, 5, 'C', 'DESATIVADA');    
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (13, 5, 'D', 'ATIVA');
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (14, 5, 'D', 'DESATIVADA');  
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (15, 5, 'D', 'ATIVA');  
INSERT INTO cinema.poltrona (numero_poltrona, id_sala, fila, estado_poltrona) 
    VALUES (16, 5, 'D', 'ATIVA');  
    
-- FILME --
INSERT INTO cinema.filme (diretor , indicacao, genero, nome, sinopse, produtora, duracao) 
    VALUES ('Ruben Fleischer' , 16, 'Ficção científica', 'Venom','Eddie Brock é um 
    jornalista que investiga o misterioso trabalho de um cientista, suspeito de utilizar cobaias 
    humanas em experimentos mortais. Quando ele acaba entrando em contato com um simbionte alienígena.', 'Sony Pictures', 110);
    
INSERT INTO cinema.filme (diretor , indicacao, genero, nome, sinopse, produtora, duracao) 
    VALUES ('J. A. Bayona' , 14, 'Aventura', 'Jurassic World: Reino Ameaçado','Owen e Claire retornam à ilha Nublar para 
    salvar os dinossauros restantes de um vulcão que está prestes a entrar em erupção. Eles encontram novas e aterrorizantes 
    raças de dinossauros gigantes ao descobrir uma conspiração que ameaça todo o planeta.', 'Universal Pictures', 130);
    
INSERT INTO cinema.filme (diretor , indicacao, genero, nome, sinopse, produtora, duracao) 
    VALUES ('Jon Turteltaub' , 14, 'Ficção científica', 'Megatubarão','Na fossa mais profunda do Oceano Pacífico, 
    a tripulação de um submarino fica presa dentro do local após ser atacada por uma criatura pré-histórica que se achava estar extinta, 
    um tubarão de mais de 20 metros de comprimento, o Megalodon.', 'Warner Bros. Entertainment', 112);
    
INSERT INTO cinema.filme (diretor , indicacao, genero, nome, sinopse, produtora, duracao) 
    VALUES ('Corin Hardy' , 18, 'Terror', 'A Freira','Presa em um convento na Romênia, uma freira comete suicídio. 
    Para investigar o caso, o Vaticano envia um padre assombrado e uma noviça prestes a se tornar freira. Arriscando suas vidas, 
    a fé e até suas almas, os dois descobrem um segredo profano.', 'Sony Pictures', 100);
    
INSERT INTO cinema.filme (diretor , indicacao, genero, nome, sinopse, produtora, duracao) 
    VALUES ('David Leitch' , 14, 'Ficção científica', 'Deadpool 2','O supersoldado Cable vem do futuro com a missão de assassinar 
    o jovem mutante Russel e o mercenário Deadpool precisa aprender o que é ser herói de verdade para salvá-lo.', 'Marvel', 120);
    
INSERT INTO cinema.filme (diretor , indicacao, genero, nome, sinopse, produtora, duracao) 
    VALUES ('Sylvain White' , 16, 'Terror', 'Slender Man','As amigas Wren, Hallie, Chloe e Katie levam uma vida entediante no colégio. 
    Quando ouvem falar em um monstro chamado Slender Man, elas decidem invocá-lo por meio de um vídeo na Internet.', 'Sony Pictures Entertainment', 91);
    
 -- SESSAO --   
INSERT INTO cinema.sessao (data_sessao, horario_sessao, linguagem, id_filme, id_sala) 
    VALUES ('04-09-2018', '19:00:00', 'DUBLADO', 1, 1);
INSERT INTO cinema.sessao (data_sessao, horario_sessao, linguagem, id_filme, id_sala) 
    VALUES ('05-09-2018', '19:30:00', 'LEGENDADO', 2, 2);
INSERT INTO cinema.sessao (data_sessao, horario_sessao, linguagem, id_filme, id_sala) 
    VALUES ('05-09-2018', '19:30:00', 'DUBLADO', 3, 3);    
INSERT INTO cinema.sessao (data_sessao, horario_sessao, linguagem, id_filme, id_sala) 
    VALUES ('06-09-2018', '21:00:00', 'LEGENDADO', 4, 4);
INSERT INTO cinema.sessao (data_sessao, horario_sessao, linguagem, id_filme, id_sala) 
    VALUES ('06-09-2018', '21:30:00', 'DUBLADO', 5, 5);


-- INGRESSOS COMPRADOS --
-- COMPRA 1 --
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('COMPRADO', 1, 1, 1, 1);
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('COMPRADO', 1, 1, 2, 1);
-- COMPRA 2 --    
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('COMPRADO', 2, 2, 1, 2);
-- COMPRA 3 --    
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('COMPRADO', 2, 2, 4, 2);
-- COMPRA 4 --    
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('COMPRADO', 3, 3, 2, 3);
-- COMPRA 5 --    
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('COMPRADO', 3, 3, 5, 3);
-- COMPRA 6 --    
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('COMPRADO', 4, 4, 2, 4);
-- COMPRA 7 --    
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('COMPRADO', 4, 4, 6, 4);
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('COMPRADO', 4, 4, 7, 4);
-- COMPRA 8 --    
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('COMPRADO', 5, 5, 2, 5);
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('COMPRADO', 5, 5, 3, 5); 
    
    
    
-- INGRESSOS À VENDA: SESSAO 1 --
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 1, 1, 3, 1);
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 1, 1, 4, 1);
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 1, 1, 5, 1);
 
-- INGRESSOS À VENDA: SESSAO 2 --
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 2, 2, 2, 2);
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 2, 2, 3, 2);
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 2, 2, 4, 2);
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 2, 2, 5, 2);

-- INGRESSOS À VENDA: SESSAO 3 --
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 3, 3, 4, 3);
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 3, 3, 6, 3);
    
-- INGRESSOS À VENDA: SESSAO 4 --    
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 4, 4, 1, 4);
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 4, 4, 3, 4);
    
-- INGRESSOS À VENDA: SESSAO 5 --
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 5, 5, 1, 5);
INSERT INTO cinema.ingresso (status_ingresso, id_filme, id_sessao, numero_poltrona, id_sala) 
    VALUES ('À VENDA', 5, 5, 4, 5);
    
-- DISPONIBILIDADE_POLTRONA --
-- DISP_POLTRONA :SESSAO 1 --
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (1, 1, 1, 'A', 'OCUPADA');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (1, 2, 1, 'A', 'OCUPADA');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (1, 3, 1, 'A', 'DISPONIVEL');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (1, 4, 1, 'A', 'DISPONIVEL');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (1, 5, 1, 'B', 'DISPONIVEL');
    
-- DISP_POLTRONA :SESSAO 2 --  
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (2, 1, 2, 'A', 'OCUPADA'); 
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (2, 2, 2, 'A', 'DISPONIVEL');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (2, 3, 2, 'A', 'DISPONIVEL');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (2, 4, 2, 'A', 'DISPONIVEL');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (2, 5, 2, 'B', 'DISPONIVEL');
    
-- DISP_POLTRONA :SESSAO 3 --  
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (3, 2, 3, 'A', 'OCUPADA');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (3, 4, 3, 'A', 'DISPONIVEL');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (3, 5, 3, 'B', 'OCUPADA');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (3, 6, 3, 'B', 'DISPONIVEL');
    
-- DISP_POLTRONA :SESSAO 4 --  
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (4, 1, 4, 'B', 'DISPONIVEL');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (4, 3, 4, 'B', 'DISPONIVEL');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (4, 2, 4, 'A', 'OCUPADA');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (4, 6, 4, 'B', 'OCUPADA');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (4, 7, 4, 'B', 'OCUPADA');

-- DISP_POLTRONA :SESSAO 5 --  
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (5, 1, 5, 'A', 'DISPONIVEL');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (5, 2, 5, 'A', 'OCUPADA');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (5, 3, 5, 'A', 'OCUPADA');
INSERT INTO cinema.disp_poltrona (id_sessao, numero_poltrona, id_sala, fila, disponibilidade) 
    VALUES (5, 4, 5, 'A', 'DISPONIVEL');

-- PLANO_PRECO --
-- VEDIDOS --
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (1,1);  
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (2,1); 
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (3,2);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (4,3);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (5,3); 
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (6,3); 
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (7,4);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (8,4);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (9,4);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (10,5);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (11,5);

-- DISPONIVEIS --
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (12,1);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (13,1);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (14,1);    
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (15,2);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (16,2);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (17,2);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (18,3);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (19,3);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (20,4);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (21,4);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (22,5);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (23,5);
INSERT INTO cinema.plano_preco (id_ingresso, id_preco) 
    VALUES (24,5);

-- COMPRA --
INSERT INTO cinema.compra (codigo_compra, data_compra, hora_compra, valor_compra, tipo_pagamento, id_cliente) 
    VALUES ('10001', '04-09-2018', '19:10:00', 87.00, 'À PRAZO', 1);
INSERT INTO cinema.compra (codigo_compra, data_compra, hora_compra, valor_compra, tipo_pagamento, id_cliente) 
    VALUES ('10002', '05-09-2018', '19:15:00', 35.00, 'À VISTA', 2);
INSERT INTO cinema.compra (codigo_compra, data_compra, hora_compra, valor_compra, tipo_pagamento, id_cliente) 
    VALUES ('10003', '05-09-2018', '19:18:00', 29.00, 'À VISTA', 3);
INSERT INTO cinema.compra (codigo_compra, data_compra, hora_compra, valor_compra, tipo_pagamento, id_cliente) 
    VALUES ('10004', '05-09-2018', '19:21:00', 20.00, 'À VISTA', 4);
INSERT INTO cinema.compra (codigo_compra, data_compra, hora_compra, valor_compra, tipo_pagamento, id_cliente) 
    VALUES ('10005', '05-09-2018', '19:25:00', 15.00, 'À VISTA', 5);
INSERT INTO cinema.compra (codigo_compra, data_compra, hora_compra, valor_compra, tipo_pagamento, id_cliente) 
    VALUES ('10006', '06-09-2018', '20:52:00', 31.00, 'À VISTA', 6);
INSERT INTO cinema.compra (codigo_compra, data_compra, hora_compra, valor_compra, tipo_pagamento, id_cliente) 
    VALUES ('10007', '06-09-2018', '20:56:00', 55.00, 'À PRAZO', 7);
INSERT INTO cinema.compra (codigo_compra, data_compra, hora_compra, valor_compra, tipo_pagamento, id_cliente) 
    VALUES ('10008', '06-09-2018', '21:15:00', 45.00, 'À PRAZO', 8);
    
  
-- COMPRA_INGRESSO --
INSERT INTO cinema.compra_ingresso (id_compra, id_ingresso) 
    VALUES (1, 1);
INSERT INTO cinema.compra_ingresso (id_compra, id_ingresso) 
    VALUES (1, 2);
INSERT INTO cinema.compra_ingresso (id_compra, id_ingresso) 
    VALUES (2, 3);
INSERT INTO cinema.compra_ingresso (id_compra, id_ingresso) 
    VALUES (3, 4);
INSERT INTO cinema.compra_ingresso (id_compra, id_ingresso) 
    VALUES (4, 5);
INSERT INTO cinema.compra_ingresso (id_compra, id_ingresso) 
    VALUES (5, 6);
INSERT INTO cinema.compra_ingresso (id_compra, id_ingresso) 
    VALUES (6, 7);
INSERT INTO cinema.compra_ingresso (id_compra, id_ingresso) 
    VALUES (7, 8);
INSERT INTO cinema.compra_ingresso (id_compra, id_ingresso) 
    VALUES (7, 9);
INSERT INTO cinema.compra_ingresso (id_compra, id_ingresso) 
    VALUES (8, 10);
INSERT INTO cinema.compra_ingresso (id_compra, id_ingresso) 
    VALUES (8, 11);
    
-- COMPRA_PRODUTO --    
INSERT INTO cinema.compra_produto (id_compra, id_produto, quantidade) 
    VALUES (1, 1, 2);
INSERT INTO cinema.compra_produto (id_compra, id_produto, quantidade) 
    VALUES (1, 4, 2);

    
INSERT INTO cinema.compra_produto (id_compra, id_produto, quantidade) 
    VALUES (2, 5, 1);
INSERT INTO cinema.compra_produto (id_compra, id_produto, quantidade) 
    VALUES (2, 6, 1);

INSERT INTO cinema.compra_produto (id_compra, id_produto, quantidade) 
    VALUES (3, 1, 1);

INSERT INTO cinema.compra_produto (id_compra, id_produto, quantidade) 
    VALUES (4, 2, 1);

INSERT INTO cinema.compra_produto (id_compra, id_produto, quantidade) 
    VALUES (6, 1, 1);
INSERT INTO cinema.compra_produto (id_compra, id_produto, quantidade) 
    VALUES (6, 5, 1);

INSERT INTO cinema.compra_produto (id_compra, id_produto, quantidade) 
    VALUES (7, 1, 1);
INSERT INTO cinema.compra_produto (id_compra, id_produto, quantidade) 
    VALUES (7, 6, 1);

INSERT INTO cinema.compra_produto (id_compra, id_produto, quantidade) 
    VALUES (8, 1, 2);
	
-- Unidade-Cinema --

INSERT INTO cinema.unidade_cinema (id_cinema,nome,descricao) 
    VALUES(1,'Cinema Itabaiana','O único cinema em Itabaiana')
INSERT INTO cinema.unidade_cinema (id_cinema,nome,descricao) 
    VALUES(2,'Cinema Jardins','O único cinema fora do shopping no bairro Jardins em Aracaju')
INSERT INTO cinema.unidade_cinema (id_cinema,nome,descricao) 
    VALUES(3,'Cinema Centro','Um dos poucos cinemas no Centro de Aracaju')


