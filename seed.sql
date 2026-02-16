INSERT INTO clientes VALUES (1, 'João Silva');
INSERT INTO hospedagens VALUES (1, 'Hotel Central');

INSERT INTO alugueis
VALUES (1, 1, 1, '2024-01-01', '2024-01-08', 2000.00);

-- Testes
SELECT * FROM alugueis;
SELECT * FROM resumo_aluguel;

SELECT CalcularDescontoPorDias(1);
SELECT CalcularValorFinalComDesconto(1);
SELECT InfoAluguel(1);
