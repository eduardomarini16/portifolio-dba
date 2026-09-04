-- Inserção de clientes para teste

INSERT INTO clientes (nome, email, telefone) 
VALUES
    ('Eduardo Ribeiro Marini', 'eduardoribeiroi@gmail.com', '35999939881'),
    ('Marina Marini Ribeiro Borges', 'marinamarini@gmail.com', '35999939887'),
    ('Bernardo Luiz', 'bernardoluiz@gmail.com', '35999939886');

INSERT INTO clientes (nome, email, telefone)
VALUES
    ('Marcela de Souza', 'marcelasouza@gmail.com', '35999939882');
    

-- inserção de pedidos para teste

INSERT INTO pedidos (id_cliente, valor_total) 
VALUES
    (1, 150.00),
    (1, 250.00),
    (2, 80.00),
    (3, 300.00);