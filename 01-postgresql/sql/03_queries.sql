-- 1. Listar todos os clientes
SELECT * FROM clientes;

--2. Buscar clientes pelo nome
SELECT * FROM clientes WHERE nome LIKE 'Eduardo%';

--3. Listar pedidos com o nome do cliente
SELECT
    p.id,
    c.nome,
    p.data_pedido,
    p.valor_total
FROM
    pedidos p
INNER JOIN
    clientes c
    ON p.id_cliente = c.id;

-- 4. Calcular o total de compras de cada cliente
SELECT
    c.id,
    c.nome,
    p.data_pedido,
    SUM(p.valor_total) AS total_compras
FROM clientes c
INNER JOIN pedidos p
    ON c.id = p.id_cliente
GROUP BY c.id, c.nome, p.data_pedido;

-- 5. Listar todos os clientes e seus pedidos
-- Iclui clientes que ainda não possuem pedidos

SELECT 
    c.id,
    c.nome,
    p.valor_total
FROM clientes c
LEFT JOIN pedidos p
    ON c.id = p.id_cliente;

-- 6. Mostrar o total de compras de todos os cleintes
-- Clientes sem pedidos devem aparecer com total 0
SELECT
    c.id,
    c.nome,
    COALESCE(SUM(p.valor_total), 0) AS total_compras
FROM clientes c
LEFT JOIN pedidos p
    ON c.id = p.id_cliente
GROUP BY c.id, c.nome;


