-- Criando Banco de Dados para cenário E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criando tabelas sem chaves estrangeiras: pessoa_fisica, pessoa_juridica, produto, forma_pagamento e estoque
CREATE TABLE pessoa_fisica (
id_pessoa_fisica INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(15) NOT NULL,
inicial_nome_meio VARCHAR(3),
sobrenome VARCHAR(20) NOT NULL,
CPF CHAR(11) NOT NULL,
data_nasc DATE,
endereco VARCHAR(60) NOT NULL,
telefone VARCHAR(14) NOT NULL,
email VARCHAR(40)
);

CREATE TABLE pessoa_juridica (
id_pessoa_juridica INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
razao_social VARCHAR(45) NOT NULL,
CNPJ CHAR(14) NOT NULL,
nome_fantasia VARCHAR(45),
logradouro VARCHAR(30) NOT NULL,
bairro VARCHAR(20),
cidade VARCHAR(20) NOT NULL,
estado CHAR(2) NOT NULL,
cep VARCHAR(8) NOT NULL,
telefone VARCHAR(14) NOT NULL,
email VARCHAR(45),
tipo_pessoa ENUM('Cliente', 'Fornecedor', 'Vendedor-Terceiro') NOT NULL
);

CREATE TABLE produto (
id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(25) NOT NULL,
categoria ENUM('Eletrodomésticos', 'Decoração', 'Móveis') NOT NULL,
descricao VARCHAR(45) NOT NULL,
fabricante VARCHAR(20),
valor DECIMAL(9,2) NOT NULL,
avaliacao FLOAT DEFAULT(0)
);
ALTER TABLE produto AUTO_INCREMENT=1;

CREATE TABLE forma_pagamento (
id_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
tipo ENUM('Cartão Débito','Cartão Crédito','Pix','Tranferência Bancária','Boleto') NOT NULL,
parcelas SMALLINT DEFAULT(1)
);

CREATE TABLE estoque (
id_estoque INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
localidade VARCHAR(100) NOT NULL,
quantidade INT NOT NULL DEFAULT(0)
);


-- Criando tabelas com chaves estrangeiras: pedido, produto_estoque, pedido_produto, produto_pj, produto_pf, pedido_pj, pedido_pf
CREATE TABLE pedido (
id_pedido INT  NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
status_entrega ENUM('Cancelado','Em processamento','Enviado','Entregue') DEFAULT('Em processamento'),
descricao VARCHAR(100) NOT NULL,
frete FLOAT DEFAULT(10),
codigo_rastreio VARCHAR(20),
fk_forma_pagamento INT,
CONSTRAINT fk_forma_pagamento FOREIGN KEY (fk_forma_pagamento) REFERENCES forma_pagamento (id_pagamento)
);
ALTER TABLE pedido AUTO_INCREMENT=1;

CREATE TABLE produto_estoque (
id_PEproduto INT,
id_PEestoque INT,
quantidade INT,
PRIMARY KEY (id_PEproduto, id_PEestoque),
CONSTRAINT fk_PE_produto FOREIGN KEY (id_PEproduto) REFERENCES produto (id_produto),
CONSTRAINT fk_PE_estoque FOREIGN KEY (id_PEestoque) REFERENCES estoque (id_estoque)
);

CREATE TABLE pedido_produto (
id_Ppedido INT,
id_Pproduto INT,
quantidade INT,
status_pedido ENUM('Disponível', 'Sem Estoque') DEFAULT('Disponível') NOT NULL,
PRIMARY KEY (id_Ppedido, id_Pproduto),
CONSTRAINT fk_pedido FOREIGN KEY (id_Ppedido) REFERENCES pedido (id_pedido),
CONSTRAINT fk_produto FOREIGN KEY (id_Pproduto) REFERENCES produto (id_produto)
);

CREATE TABLE produto_pj (
id_PJproduto INT,
id_PJpessoa INT,
PRIMARY KEY (id_PJproduto, id_PJpessoa),
CONSTRAINT fk_PJ_produto FOREIGN KEY (id_PJproduto) REFERENCES produto (id_produto),
CONSTRAINT fk_PJ_pessoa FOREIGN KEY (id_PJpessoa) REFERENCES pessoa_juridica (id_pessoa_juridica)
);

CREATE TABLE produto_pf (
id_PFproduto INT,
id_PFpessoa INT,
PRIMARY KEY (id_PFproduto, id_PFpessoa),
CONSTRAINT fk_PF_produto FOREIGN KEY (id_PFproduto) REFERENCES produto (id_produto),
CONSTRAINT fk_PF_pessoa FOREIGN KEY (id_PFpessoa) REFERENCES pessoa_fisica (id_pessoa_fisica)
);

CREATE TABLE pedido_pj (
id_pedidoPJ INT,
id_pessoaPJ INT,
PRIMARY KEY (id_pedidoPJ, id_pessoaPJ),
CONSTRAINT fk_pedido_PJ FOREIGN KEY (id_pedidoPJ) REFERENCES pedido (id_pedido),
CONSTRAINT fk_pessoa_PJ_pedido FOREIGN KEY (id_pessoaPJ) REFERENCES pessoa_juridica (id_pessoa_juridica)
);

CREATE TABLE pedido_pf (
id_pedidoPF INT,
id_pessoaPF INT,
PRIMARY KEY (id_pedidoPF, id_pessoaPF),
CONSTRAINT fk_pedido_PF FOREIGN KEY (id_pedidoPF) REFERENCES pedido (id_pedido),
CONSTRAINT fk_pessoa_PF_pedido FOREIGN KEY (id_pessoaPF) REFERENCES pessoa_fisica (id_pessoa_fisica)
);