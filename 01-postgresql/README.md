# PostgreSQL — Projeto de Portfólio DBA

Projeto prático desenvolvido para estudo e demonstração de conhecimentos em PostgreSQL, com foco em modelagem de dados, SQL, relacionamentos, índices e análise de performance.

## Tecnologias

- PostgreSQL 16
- Docker
- Docker Compose
- SQL
- Git / GitHub

## Objetivos do projeto

- Criar e estruturar tabelas no PostgreSQL.
- Trabalhar com chaves primárias e estrangeiras.
- Aplicar restrições de integridade (`NOT NULL`, `UNIQUE` e `FOREIGN KEY`).
- Realizar consultas utilizando `JOIN`, `GROUP BY`, `SUM` e `COALESCE`.
- Criar e analisar índices.
- Utilizar `EXPLAIN ANALYZE` para analisar planos de execução.
- Compreender a diferença entre `Index Scan` e `Seq Scan`.
- Trabalhar com PostgreSQL utilizando Docker.

## Estrutura do projeto

```text
01-postgresql/
│
├── docker-compose.yml
├── README.md
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_queries.sql
│   └── 04_indexes.sql
│
└── docs/
    └── performance.md
```

docker-compose.yml — configuração do ambiente PostgreSQL utilizando Docker.
01_create_tables.sql — criação das tabelas e definição dos relacionamentos.
02_insert_data.sql — inserção dos dados utilizados nos testes.
03_queries.sql — consultas SQL, JOIN, agregações e tratamento de valores nulos.
04_indexes.sql — criação dos índices utilizados no projeto.
performance.md — documentação dos testes realizados com EXPLAIN ANALYZE.

## Como executar

### 1. Clonar o repositório

```bash
git clone <URL_DO_REPOSITORIO>
cd 01-postgresql
```

docker compose up -d

docker ps