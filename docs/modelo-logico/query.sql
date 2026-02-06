 -- TESTE DAS QUERIES COM OS DADOS INSERIDOS
 
 -- 1 - Quantos pedidos cada cliente fez?
 
SELECT c.nome, COUNT(p.idPedido) AS total_pedidos
	FROM Cliente c
		LEFT JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
	GROUP BY c.nome;

-- 2 - Recuperação simples com WHERE

SELECT * FROM Pedido
	WHERE status = 'Finalizado';

-- 3 - Atributo derivado – valor total do pedido

SELECT p.idPedido,
       SUM(pp.quantidade * pr.valor) + p.frete AS valor_total
		FROM Pedido p
			JOIN Produto_Pedido pp ON p.idPedido = pp.Pedido_idPedido
			JOIN Produto pr ON pp.Produto_idProduto = pr.idProduto
	GROUP BY p.idPedido;

-- 4 - Ordenação com ORDER BY

SELECT nome, valor
	FROM Produto
	ORDER BY valor DESC;

-- 5 - HAVING – pedidos com valor pago acima de 200

SELECT p.idPedido,
       SUM(pg.valor) AS total_pago
FROM Pedido p
JOIN Pagamento pg ON p.idPedido = pg.Pedido_idPedido
GROUP BY p.idPedido
HAVING total_pago > 200;

-- 6 - Junção complexa – fornecedor, produto e estoque

SELECT f.razao_social AS fornecedor,
       pr.nome AS produto,
       e.local,
       pe.quantidade
FROM Fornecedor f
		JOIN Fornecedor_Produto fp ON f.idFornecedor = fp.Fornecedor_idFornecedor
		JOIN Produto pr ON fp.Produto_idProduto = pr.idProduto
		JOIN Produto_Estoque pe ON pr.idProduto = pe.Produto_idProduto
		JOIN Estoque e ON pe.Estoque_idEstoque = e.idEstoque;

-- 7 - Quais clientes tiveram o maior valor total gasto em pedidos?

SELECT c.nome,
       SUM(pg.valor) AS total_gasto
	FROM Cliente c
		JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
		JOIN Pagamento pg ON p.idPedido = pg.Pedido_idPedido
	GROUP BY c.nome
	ORDER BY total_gasto DESC;

-- 8 - Existem pedidos cujo valor pago difere do valor total calculado dos produtos?

SELECT p.idPedido,
       SUM(pg.valor) AS total_pago,
       SUM(pp.quantidade * pr.valor) + p.frete AS total_calculado
	FROM Pedido p
		JOIN Pagamento pg ON p.idPedido = pg.Pedido_idPedido
		JOIN Produto_Pedido pp ON p.idPedido = pp.Pedido_idPedido
		JOIN Produto pr ON pp.Produto_idProduto = pr.idProduto
	GROUP BY p.idPedido
	HAVING total_pago <> total_calculado;

-- 9 - Quantos produtos foram vendidos por categoria?

SELECT pr.categoria,
       SUM(pp.quantidade) AS total_vendido
	FROM Produto pr
		JOIN Produto_Pedido pp ON pr.idProduto = pp.Produto_idProduto
	GROUP BY pr.categoria;

-- 10 - Quais fornecedores fornecem mais de um produto?

SELECT f.razao_social,
       COUNT(fp.Produto_idProduto) AS total_produtos
FROM Fornecedor f
JOIN Fornecedor_Produto fp ON f.idFornecedor = fp.Fornecedor_idFornecedor
GROUP BY f.razao_social
HAVING total_produtos > 1;

-- 11 - Quais produtos possuem estoque crítico? (< 20)

SELECT pr.nome,
       e.local,
       pe.quantidade
FROM Produto pr
JOIN Produto_Estoque pe ON pr.idProduto = pe.Produto_idProduto
JOIN Estoque e ON pe.Estoque_idEstoque = e.idEstoque
WHERE pe.quantidade < 20;

-- 12 - Quais clientes PJ já realizaram pedidos?

SELECT pj.razao_social,
       COUNT(p.idPedido) AS total_pedidos
FROM Cliente_PJ pj
JOIN Cliente c ON pj.idCliente = c.idCliente
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY pj.razao_social;

-- 13 -  Qual o status das entregas por cliente?

SELECT c.nome,
       p.idPedido,
       e.status_entrega
FROM Cliente c
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
JOIN Entrega e ON p.idPedido = e.Pedido_idPedido
ORDER BY c.nome;

-- 14 - Qual o valor médio pago por cada pedido?

SELECT p.idPedido, ROUND(AVG(pg.valor), 2) AS valor_medio_pago
		FROM Pedido p
			JOIN Pagamento pg ON p.idPedido = pg.Pedido_idPedido
	GROUP BY p.idPedido;

