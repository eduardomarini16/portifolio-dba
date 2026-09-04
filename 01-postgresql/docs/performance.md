# Análise de Performance com Índice no PostgreSQL

## Objetivo

Avaliar o comportamento do PostgreSQL ao realizar consultas com e sem o uso de índices, utilizando o comando `EXPLAIN ANALYZE`.

## Cenário do teste

Foi criado um índice na coluna `id_cliente` da tabela `pedidos`:

```sql
CREATE INDEX idx_pedidos_id_cliente
ON pedidos(id_cliente);
```

## Dados utilizados

Para avaliar o comportamento do índice em uma tabela maior, foram inseridos 100.000 novos pedidos associados ao cliente de `id_cliente = 1`.

Os registros foram gerados utilizando a função `generate_series` do PostgreSQL.

## Teste 1 — Cliente com poucos pedidos

Foi realizada uma consulta para buscar os pedidos do cliente `id_cliente = 7`.

```sql
EXPLAIN ANALYZE
SELECT *
FROM pedidos
WHERE id_cliente = 7;
```

Index Scan using idx_pedidos_id_cliente on pedidos

O PostgreSQL utilizou o índice `idx_pedidos_id_cliente` para localizar os registros correspondentes ao cliente.

A consulta retornou 10 pedidos e apresentou um tempo de execução de 0.062 ms.

## Teste 2 — Cliente com muitos pedidos

Foi realizada uma consulta para buscar os pedidos do cliente `id_cliente = 1`.

```sql
EXPLAIN ANALYZE
SELECT *
FROM pedidos
WHERE id_cliente = 1;
```

Seq Scan on pedidos

O PostgreSQL optou por realizar uma varredura sequencial na tabela em vez de utilizar o índice.

A consulta retornou 100.002 registros e removeu apenas 12 registros pelo filtro. Como praticamente toda a tabela correspondia ao cliente consultado, a varredura sequencial foi considerada mais eficiente pelo otimizador.

O tempo de execução observado foi de 16.031 ms.

| Consulta | Registros retornados | Plano utilizado |
|---|---:|---|
| `id_cliente = 7` | 10 | Index Scan |
| `id_cliente = 1` | 100.002 | Seq Scan |


## Conclusão

Os testes demonstraram que a existência de um índice não significa que ele será utilizado em todas as consultas.

Quando a consulta retornou poucos registros, como no caso do `id_cliente = 7`, o PostgreSQL utilizou `Index Scan`.

Quando a consulta retornou praticamente toda a tabela, como no caso do `id_cliente = 1`, o PostgreSQL optou por `Seq Scan`.

A decisão é realizada pelo otimizador do PostgreSQL com base no custo estimado de cada estratégia. Dessa forma, o uso de índices deve considerar a seletividade das consultas e o volume de dados da tabela.N

Não estamos comparando diretamente esses tempos como se fossem uma medição equivalente, porque uma consulta retornou 10 linhas e a outra retornou 100.002, a explicação do plano de execução é o ponto principal de observação.