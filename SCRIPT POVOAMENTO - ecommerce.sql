/* Inserção de dados - povoamento das tabelas */

USE ecommerce;
SHOW TABLES;

-- Povoando tabela pessoa_fisica (inicial e email podem ser nulos): 10 inserções
INSERT INTO pessoa_fisica (nome, inicial_nome_meio, sobrenome, CPF, data_nasc, endereco, telefone, email)
VALUES ('Rayane', 'S','Vital','28262374243', '1990-05-23', 'Rua Cambezes, 286 - Cambuí, MG','3621737871', 'rayvital@gmail.com'),
('Magda', null, 'Mena','71899345249','1994-04-19', 'Rua Vilaverde, 630, Jardim Anil - São Paulo, SP','1189698881', 'magdamena2@hotmail.com'),
('Maurício', 'A', 'Cardim', '19716420795', '1989-03-29', 'Rua Carlos Gomes, 1564 - Jundiaí, SP','1121545594', 'maumaucardim@yahoo.com.br'),
('Mila', 'G', 'Osório', '15066534736', '1968-08-06', 'Rua Cavadas, 428, Vila Aparecida - Petrópolis, RJ','2283872498', 'milagosorio21@gmail.com'),
('Leo', null, 'Naves', '21506565310', '1991-03-22', 'Rua Soverosa, 1446 - Belo Horizonte, MG','3166995665', null),
('Humberto', 'W', 'Cabral', '90676512319', '1961-09-02', 'Rua Veloso Farias, 14, Vila Ana - Ilhéus, BA','7767681679', 'humbertowagnerca@hotmail.com'),
('Poliana', null, 'Portela', '54011966418', '1985-06-12', 'Rua Fragoso, 1074 - Vila Velha, ES','2380771031', 'poliportela@gmail.com'),
('Jennifer', 'V', 'Dâmaso','80912150359', '1971-07-05', 'Avenida Quintas das Palmeiras, 51 - São Paulo, SP','1344912318', null),
('Viviana', 'B', 'Caneira','56245489702', '1988-01-16', 'Estrada 1, 31, Vila Nova - Extrema, MG','3456406012', 'vivibcaneira2@hotmail.com'),
('Edson', null, 'Lousada','31467261734', '1982-02-21', 'Rua Dinis, 661 - Vitória, ES','2181273332', 'edinholousada@gmail.com');

SELECT * FROM pessoa_fisica;


-- Povoando tabela pessoa_juridica (bairro pode ser nulo): 8 inserções
INSERT INTO pessoa_juridica (razao_social, CNPJ, nome_fantasia, logradouro, bairro, cidade, estado, cep, telefone, email, tipo_pessoa)
VALUES ('Giovanni e Renato Eletros Ltda','71542889000187', 'GR Eletros', 'Rua Fragoso 618', 'Distrito Industrial','Itupeva', 'SP', '13218520', '1794541510', 'diretoria@greletros.com.br', 'Fornecedor'),
('Antônia e Hugo Móveis ME','46963514000143', 'Rei dos Móveis', 'Avenida Cardoso, 435', 'Vila São João','Rezende', 'RJ', '15486953', '21984355478', 'reidosmoveis@gmail.com', 'Vendedor-Terceiro'),
('Allana e Marcela Entregas Expressas Ltda', '96674890000196', 'AMEE', 'Rua Soverosa, 334', 'Jardim Colônia', 'Jacareí', 'SP', '12315240', '1954261206', 'contato@ammeentregasexpressas.com.br', 'Fornecedor'),
('João e Samuel Decorações Ltda', '23629073000142', 'Decor JS', 'Travessa Melato, 998', null, 'Curitiba', 'PR', '13201133', '45991759815', 'rh@decorjoaoesamuel.com.br', 'Vendedor-Terceiro'),
('Osório Poli Ltda','19150353000104', 'Polianas', 'Rua Soverosa, 267', 'Vila Arens', 'Jundiaí', 'SP', '13215620', '1166156805', 'contato@polianas.com.br', 'Cliente'),
('Sophie e Milena Marcenaria ME', '04910203000176', 'Moveis SM', 'Avenida São Luís, 141', 'Centro', 'Ponta Grossa', 'PR', '01046910', '11996649055', 'contato@smmarcenariame.com.br', 'Fornecedor'),
('Sophie e Milena Marcenaria ME', '04910203000176', 'Moveis SM', 'Avenida São Luís, 141', 'Centro', 'Ponta Grossa', 'PR', '01046910', '11996649055', 'contato@smmarcenariame.com.br', 'Cliente'),
('Giovanni e Isabelle Eletros ME', '02917877000177', 'Eletrosmil', 'Rua Domingos Antunes, 153', null, 'Andradina', 'SP', '16900173', '1836166452', 'adm@giovannieisabelleeletrosme.com.br', 'Fornecedor');

SELECT * FROM pessoa_juridica;


-- Povoando tabela produto (avaliação tem default): 10 inserções
INSERT INTO produto (nome, categoria, descricao, fabricante, valor, avaliacao)
VALUES ('Aspirador de pó', 'Eletrodomésticos', 'Aspirador 110v vermelho', 'Mundiale', 153.90, 4.3),
		('Batedeira', 'Eletrodomésticos', 'Planetária, Branca 110v', 'Ultralar', 262.5, 4.7),
		('Liquidificador', 'Eletrodomésticos', 'Preto 220v', 'Ultralar', 230, default),
        ('Sofá', 'Móveis', 'Retrátil, 3 lug Marrom', 'Moveis SM', 1250, 3.8),
        ('Cortina', 'Decoração', 'Persiana Verde 1,20m', 'Casa & cia', 810, default),
        ('Chapinha cerâmica', 'Eletrodomésticos', 'Preta bivolt', 'Mundiale', 198, 4),
		('Air Fryer', 'Eletrodomésticos', 'Branca Bivolt', 'Venus', 287, 4.8),
		('Cafeteira Elétrica', 'Eletrodomésticos','Bivolt Verde', 'Venus', 149.99, 4.1),
        ('Cama King', 'Móveis', 'Soft Preta Baú', 'Moveis SM', 1952, 4.5),
        ('Espelho', 'Decoração', '180cm - com moldura', 'Casa & cia', 355.80, 4.6);
        
SELECT * FROM produto;


-- Povoando tabela forma_pagamento (tipo- credito, debito, pix, boleto, tranferência / parcelas tem default)
INSERT INTO forma_pagamento (tipo, parcelas)
VALUES ('Cartão Crédito', 3), 
		('Cartão Crédito', 4),
        ('Cartão Crédito', 5),
        ('Cartão Crédito', 6),
        ('Boleto', default),
        ('Pix', default),
        ('Cartão Débito', default);
        
SELECT * FROM forma_pagamento;


-- Povoando tabela pedido (status e frete tem default): 10 inserções
INSERT INTO pedido (status_entrega, descricao, frete, codigo_rastreio, fk_forma_pagamento)
VALUES ('Enviado', 'Pedido realizado dia 04-08-2022', 25.30, 'F2354bp89BR', 1),
		(default, 'Pedido realizado dia 15-09-2022', default, 'F9765nm87BR', 5),
        ('Entregue', 'Pedido realizado dia 23-05-2022', 15.8, 'F2215bf45BR', 6),
        ('Enviado', 'Pedido realizado dia 10-09-2022', default, 'F4478ds69BR', 3),
        (default, 'Pedido realizado dia 18-09-2022', 12.7, 'F6687vc63BR', 1),
        (default, 'Pedido realizado dia 19-09-2022', default, 'Fc478n231BR', 7),
        ('Entregue', 'Pedido realizado dia 11-06-2022', 21, 'F0321fg87BR', 1),
        ('Enviado', 'Pedido realizado dia 23-08-2022', 16.5, 'F1234lh96BR', 6),
        ('Em processamento', 'Pedido realizado dia 20-09-2022', 17.1, 'F4698jk23BR', 1),
        ('Entregue', 'Pedido realizado dia 03-07-2022', default, 'Fv2546g87BR', 2);
        
SELECT * FROM pedido;


-- Povoando tabela pedido_produto(id, id, qtdade, status 'Disponível' ou 'Sem Estoque': 12 inserções
INSERT INTO pedido_produto (id_Ppedido, id_Pproduto, quantidade, status_pedido)
VALUES (1, 4, 1, 'Disponível'),
		(2, 1, 1, 'Disponível'),
        (2, 6, 1, 'Disponível'),
        (3, 8, 2, 'Disponível'),
        (9, 5, 2, 'Disponível'),
        (4, 9, 1, 'Sem Estoque'),
        (4, 10, 1, 'Disponível'),
        (6, 1, 1, 'Disponível'),
        (6, 3, 1, 'Sem Estoque'),
        (7, 4, 1, 'Disponível'),
        (5, 9, 1, 'Disponível'),
        (5, 2, 2, 'Sem Estoque');
        
SELECT * FROM pedido_produto;


-- Povoando tabela estoque (id, localidade, qtdade): 10 inserções
INSERT INTO estoque (localidade, quantidade)
VALUES ('Pedreira - São Paulo', 200),
		('Rio de Janeiro', 400),
        ('Lagoa Santa - Minas Gerais', 120),
        ('São Paulo', 50),
        ('Betim - Minas Gerais', 300),
        ('São Paulo', 30),
        ('Rio de Janeiro', 80),
        ('Curitiba - Paraná', 20),
        ('Campinas - São Paulo', 600),
        ('Minas Gerais', 320);
        
SELECT * FROM estoque;


-- Povoando tabela produto_estoque (id, id, qtdade (pode ser nulo)): 12 inserções
INSERT INTO produto_estoque (id_PEproduto, id_PEestoque)
VALUES (1, 2),
		(3, 1),
        (4, 8),
        (4, 6),
        (6, 10),
        (10, 3),
        (8, 9),
        (9, 7),
        (7, 9),
        (7, 4),
        (2, 5),
        (1, 9);
        
SELECT * FROM produto_estoque;


-- Povoando tabela produto_pf
INSERT INTO produto_pf (id_PFproduto, id_PFpessoa)
VALUES (4, 10), (10, 9);

SELECT * FROM produto_pf;


-- Povoando tabela produto_pj (idpessoa 9 a 16)
INSERT INTO produto_pj (id_PJproduto, id_PJpessoa)
VALUES (1, 16), (2, 9), (2, 16), (3, 14), (5, 12), (6, 11), (7, 9), (8, 16), (9, 10);

SELECT * FROM produto_pj;


-- Povoando tabela pedido_pf
INSERT INTO pedido_pf (id_pedidoPF, id_pessoaPF)
VALUES (1, 2), (4, 10), (3, 8), (10, 4), (9, 2), (6, 3), (7, 10);

SELECT * FROM pedido_pf;


-- Povoando tabela pedido_pj (idpessoapj 9 a 16)
INSERT INTO pedido_pj (id_pedidoPJ, id_pessoaPJ)
VALUES (2, 13), (8, 15), (5, 13);

SELECT * FROM pedido_pj;
