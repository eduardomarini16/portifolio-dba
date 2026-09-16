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

Espere aparecer a mensagem `database system is ready to accept connections`. Pressione `Ctrl+C` para sair dos logs; o contêiner continuará em execução.

### 6. Copiar os scripts e acessar o contêiner

O Compose inicia o PostgreSQL, mas não executa os arquivos SQL automaticamente. Execute os comandos abaixo na pasta `01-postgresql`. Eles funcionam tanto no PowerShell quanto no terminal Linux/macOS, sem precisar instalar o `psql` no computador:

```bash
docker compose cp ./sql/. postgres:/tmp/portfolio-sql
docker compose exec postgres bash
```

O segundo comando abre um terminal dentro do contêiner. Os próximos comandos devem ser executados nesse terminal, onde as variáveis `POSTGRES_USER` e `POSTGRES_DB` já estão disponíveis.

### 7. Criar as tabelas, carregar os dados e executar os SQLs

Este procedimento de carga inicial pressupõe um banco novo, sem as tabelas do projeto. Execute uma linha por vez, na ordem abaixo; se houver erro, corrija-o antes de continuar.

```bash
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -v ON_ERROR_STOP=1 -f /tmp/portfolio-sql/01_create_tables.sql
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -v ON_ERROR_STOP=1 --single-transaction -f /tmp/portfolio-sql/02_insert_data.sql
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -v ON_ERROR_STOP=1 -f /tmp/portfolio-sql/03_queries.sql
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -v ON_ERROR_STOP=1 -f /tmp/portfolio-sql/04_indexes.sql
```

`ON_ERROR_STOP=1` interrompe cada arquivo no primeiro erro. A carga usa `--single-transaction` para evitar inserções parciais caso algum comando falhe.

O arquivo `02_insert_data.sql` deve ser executado apenas uma vez na preparação do banco: repeti-lo causa conflito nos e-mails únicos. Reiniciar o contêiner não limpa os dados, pois eles ficam no volume persistente.

### 8. Conferir a carga e consultar o banco

Ainda no terminal do contêiner, abra o `psql`:

```bash
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB"
```

No prompt do `psql`, liste as tabelas, confira os índices de `pedidos` e valide os dados:

```sql
\dt
\d pedidos
SELECT COUNT(*) AS total_clientes FROM clientes;
SELECT COUNT(*) AS total_pedidos, SUM(valor_total) AS valor_total FROM pedidos;
```

Após a carga inicial, o resultado esperado é **4 clientes**, **4 pedidos** e **780.00** no total dos pedidos. A descrição de `pedidos` deve incluir o índice `idx_pedidos_id_cliente`.

Essa carga contém apenas os dados básicos; os registros adicionais descritos em `docs/performance.md` não são gerados por esses scripts.

Digite `\q` para sair do `psql` e, em seguida, `exit` para voltar ao terminal do computador. Se modificar os SQLs localmente, repita a cópia do passo 6 antes de executar o arquivo alterado.

### 9. Encerrar o ambiente

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
