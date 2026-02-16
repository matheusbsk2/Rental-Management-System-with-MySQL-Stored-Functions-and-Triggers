CREATE DATABASE IF NOT EXISTS sistema_aluguel;
USE sistema_aluguel;

CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE hospedagens (
    hospedagem_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE alugueis (
    aluguel_id INT PRIMARY KEY,
    cliente_id INT,
    hospedagem_id INT,
    data_inicio DATE,
    data_fim DATE,
    preco_total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (hospedagem_id) REFERENCES hospedagens(hospedagem_id)
);

CREATE TABLE resumo_aluguel (
    aluguel_id INT,
    cliente_id INT,
    valor_total DECIMAL(10,2),
    desconto_aplicado INT,
    valor_final DECIMAL(10,2),
    PRIMARY KEY (aluguel_id, cliente_id),
    FOREIGN KEY (aluguel_id) REFERENCES alugueis(aluguel_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);
