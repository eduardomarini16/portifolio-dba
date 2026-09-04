# PostgreSQL — Projeto de Portfólio DBA

Projeto prático desenvolvido para demonstrar conhecimentos em administração e desenvolvimento com PostgreSQL, incluindo modelagem de dados, consultas SQL, integridade referencial, indexação e análise de desempenho.

## Tecnologias

- PostgreSQL 16
- Docker
- Docker Compose
- SQL
- Git e GitHub

## Objetivos do projeto

- Criar e estruturar tabelas no PostgreSQL.
- Definir chaves primárias e estrangeiras.
- Aplicar restrições de integridade, como `NOT NULL`, `UNIQUE` e `FOREIGN KEY`.
- Desenvolver consultas com `JOIN`, `GROUP BY`, `SUM` e `COALESCE`.
- Criar e avaliar índices.
- Analisar planos de execução com `EXPLAIN ANALYZE`.
- Comparar operações como `Index Scan` e `Seq Scan`.
- Executar e administrar o PostgreSQL em um ambiente Docker.

## Estrutura do projeto

```text
01-postgresql/
├── .env.example
├── docker-compose.yml
├── README.md
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_queries.sql
│   └── 04_indexes.sql
└── docs/
    └── performance.md
```

### Descrição dos arquivos

- `docker-compose.yml`: configuração do ambiente PostgreSQL com Docker.
- `.env.example`: exemplo das variáveis necessárias para executar o ambiente.
- `sql/01_create_tables.sql`: criação das tabelas, restrições e relacionamentos.
- `sql/02_insert_data.sql`: inserção dos dados utilizados nos testes.
- `sql/03_queries.sql`: consultas com junções, agregações e tratamento de valores nulos.
- `sql/04_indexes.sql`: criação dos índices utilizados no projeto.
- `docs/performance.md`: documentação das análises feitas com `EXPLAIN ANALYZE`.

## Como executar

### Pré-requisitos

- Git
- Docker
- Docker Compose

### 1. Clonar o repositório

Usando SSH:

```bash
git clone git@github.com:eduardomarini16/portifolio-dba.git
cd portifolio-dba/01-postgresql
```

Ou usando HTTPS:

```bash
git clone https://github.com/eduardomarini16/portifolio-dba.git
cd portifolio-dba/01-postgresql
```

### 2. Configurar as variáveis de ambiente

Linux ou macOS:

```bash
cp .env.example .env
```

PowerShell:

```powershell
Copy-Item .env.example .env
```

Revise os valores do arquivo `.env` antes de iniciar o ambiente. Não envie esse arquivo ao GitHub caso ele contenha credenciais.

### 3. Iniciar o PostgreSQL

```bash
docker compose up -d
```

### 4. Verificar o contêiner

```bash
docker compose ps
```

### 5. Acompanhar os logs

```bash
docker compose logs -f postgres
```

> Caso o serviço tenha outro nome no `docker-compose.yml`, substitua `postgres` pelo nome correspondente.

### 6. Encerrar o ambiente

```bash
docker compose down
```

Para encerrar e também remover os volumes e dados persistidos:

```bash
docker compose down -v
```

> O parâmetro `-v` apaga os dados armazenados no volume do banco.

## Conteúdos demonstrados

- Modelagem relacional
- Integridade de dados
- Consultas e agregações SQL
- Estratégias de indexação
- Leitura de planos de execução
- Administração básica do PostgreSQL com Docker