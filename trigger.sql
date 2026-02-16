DROP TRIGGER IF EXISTS AtualizarResumoAluguel;

DELIMITER $$

CREATE TRIGGER AtualizarResumoAluguel
AFTER INSERT ON alugueis
FOR EACH ROW
BEGIN
    DECLARE Desconto INT;
    DECLARE ValorFinal DECIMAL(10,2);

    SET Desconto = CalcularDescontoPorDias(NEW.aluguel_id);
    SET ValorFinal = CalcularValorFinalComDesconto(NEW.aluguel_id);

    INSERT INTO resumo_aluguel (
        aluguel_id,
        cliente_id,
        valor_total,
        desconto_aplicado,
        valor_final
    )
    VALUES (
        NEW.aluguel_id,
        NEW.cliente_id,
        NEW.preco_total,
        Desconto,
        ValorFinal
    );
END$$

DELIMITER ;
