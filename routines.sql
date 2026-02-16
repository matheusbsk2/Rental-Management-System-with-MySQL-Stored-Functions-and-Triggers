DROP FUNCTION IF EXISTS CalcularDescontoPorDias;
DROP FUNCTION IF EXISTS CalcularValorFinalComDesconto;
DROP FUNCTION IF EXISTS InfoAluguel;

DELIMITER $$

CREATE FUNCTION CalcularDescontoPorDias(AluguelID INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE Dias INT;

    SELECT DATEDIFF(data_fim, data_inicio)
    INTO Dias
    FROM alugueis
    WHERE aluguel_id = AluguelID;

    IF Dias IS NULL OR Dias <= 0 THEN
        RETURN 0;
    ELSEIF Dias >= 7 THEN
        RETURN 15;
    ELSEIF Dias >= 3 THEN
        RETURN 10;
    ELSE
        RETURN 5;
    END IF;
END$$


CREATE FUNCTION CalcularValorFinalComDesconto(AluguelID INT)
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE ValorTotal DECIMAL(10,2);
    DECLARE Desconto INT;

    SELECT preco_total
    INTO ValorTotal
    FROM alugueis
    WHERE aluguel_id = AluguelID;

    IF ValorTotal IS NULL THEN
        RETURN NULL;
    END IF;

    SET Desconto = CalcularDescontoPorDias(AluguelID);

    RETURN ValorTotal - (ValorTotal * Desconto / 100);
END$$


CREATE FUNCTION InfoAluguel(IdAluguel INT)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE NomeCliente VARCHAR(100);
    DECLARE PrecoTotal DECIMAL(10,2);
    DECLARE Dias INT;
    DECLARE ValorDiaria DECIMAL(10,2);

    SELECT c.nome, a.preco_total, DATEDIFF(a.data_fim, a.data_inicio)
    INTO NomeCliente, PrecoTotal, Dias
    FROM alugueis a
    JOIN clientes c ON a.cliente_id = c.cliente_id
    WHERE a.aluguel_id = IdAluguel;

    IF Dias IS NULL OR Dias <= 0 THEN
        RETURN 'Dados inválidos';
    END IF;

    SET ValorDiaria = PrecoTotal / Dias;

    RETURN CONCAT(
        'Nome: ', NomeCliente,
        ', Valor Diário: R$ ',
        FORMAT(ValorDiaria,2)
    );
END$$

DELIMITER ;
