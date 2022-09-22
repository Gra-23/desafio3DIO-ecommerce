/* Criando Queries SQL para consulta de BD ecommerce */

-- Informações dos pedidos que estão 'Em processamento'
SELECT descricao, codigo_rastreio FROM pedido WHERE status_entrega = 'Em processamento';


-- Quantos pedidos foram pagos com Cartão de Crédito? (forma_pagamento 1)
SELECT COUNT(*) FROM pedido WHERE fk_forma_pagamento = 1;


-- Quais as categorias e quantos são os seus produtos cadastrados?
SELECT categoria, COUNT(*) as Quantidade FROM produto GROUP BY categoria;


-- Quantos pedidos tem em cada status de entrega? (Enviado, Entregue e Em processamento)
SELECT status_entrega, COUNT(*) AS Qtdade_pedidos
FROM pedido p, forma_pagamento fp
WHERE p.fk_forma_pagamento = fp.id_pagamento
GROUP BY status_entrega;


-- Relação produto e estoque com a quantidade <= 100
SELECT p.nome AS Produto, e.localidade AS Localização_estoque, e.quantidade
FROM produto p
JOIN produto_estoque pe ON p.id_produto = pe.id_PEproduto
JOIN estoque e ON pe.id_PEestoque = e.id_estoque
WHERE e.quantidade <= 100
ORDER BY p.nome;


-- Quais clientes (PF) compraram o produto Espelho ou Aspirador de Pó e quanto pagaram?
SELECT concat(pf.nome, ' ' , pf.sobrenome) AS Cliente, pf.email, p.id_pedidoPF AS Num_Pedido, pro.nome AS Produto, pro.valor
FROM pessoa_fisica pf
JOIN pedido_pf p ON pf.id_pessoa_fisica = p.id_pessoaPF
JOIN pedido_produto pp ON p.id_pedidoPF = pp.id_Ppedido
JOIN produto pro ON pp.id_Pproduto = pro.id_produto
WHERE pro.nome LIKE 'Aspir%' OR pro.nome = 'Espelho';


-- Dados cliente e qual/quais são os produtos comprados.
SELECT concat(pf.nome, ' ', pf.sobrenome) AS Cliente, pf.CPF, pf.telefone, pro.nome AS Produto_comprado
FROM pessoa_fisica AS pf
JOIN pedido_pf AS p ON pf.id_pessoa_fisica = p.id_pessoaPF
JOIN pedido_produto as pp ON p.id_pedidoPF = pp.id_Ppedido
JOIN produto AS pro ON pp.id_Pproduto = pro.id_produto
ORDER BY Cliente;


-- Valor total de todos os pedidos registrados e a quantidade de produtos comprados
SELECT id_Ppedido AS Pedido, SUM(pp.quantidade) AS Qtdade_Produtos, SUM(pp.quantidade*p.valor) AS Valor_Total_Pedido
FROM pedido_produto pp
JOIN produto p ON pp.id_Pproduto = p.id_produto
GROUP BY id_Ppedido;


-- Valor total dos pedidos com quantidade de produtos comprados >= 2
SELECT id_Ppedido AS Pedido, SUM(pp.quantidade) AS Qtdade_Produtos, SUM(pp.quantidade*p.valor) AS Valor_Total_Pedido
FROM pedido_produto pp
JOIN produto p ON pp.id_Pproduto = p.id_produto
GROUP BY id_Ppedido
HAVING Qtdade_Produtos >=2;