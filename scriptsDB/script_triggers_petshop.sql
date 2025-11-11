-- ----------------------------------------------------------------------
-- Atualizar data no estoque após mudança na quantidade
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER trg_update_data_estoque
AFTER UPDATE ON produtos
FOR EACH ROW
BEGIN
  IF OLD.quantidade_estoque <> NEW.quantidade_estoque THEN
    UPDATE estoque
    SET data_atualizacao = NOW()
    WHERE id_estoque = NEW.id_estoque
    AND (data_atualizacao IS NULL OR data_atualizacao < NOW());
  END IF;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Histórico de atendimento automático
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER trg_atendimento_historico_update
AFTER UPDATE ON atendimentos
FOR EACH ROW
BEGIN
  IF (OLD.diagnostico <> NEW.diagnostico OR OLD.receita <> NEW.receita OR OLD.observacoes <> NEW.observacoes) THEN
    INSERT INTO historico_atendimentos (id_atendimento, diagnostico, receita, observacoes, data_alteracao)
    VALUES (NEW.id_atendimento, NEW.diagnostico, NEW.receita, NEW.observacoes, NOW());
  END IF;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Recalcula o total do pagamento ao inserir um item
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER trg_update_total_pagamento_ins
AFTER INSERT ON pagamento_produtos
FOR EACH ROW
BEGIN
  UPDATE pagamentos
  SET valor_total = COALESCE((
    SELECT SUM(pp.quantidade * pr.preco)
    FROM pagamento_produtos pp
    JOIN produtos pr ON pr.id_produto = pp.id_produto
    WHERE pp.id_pagamento = NEW.id_pagamento
  ), 0)
  WHERE id_pagamento = NEW.id_pagamento;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Recalcula o total do pagamento ao atualizar a quantidade/produto
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER trg_update_total_pagamento_upd
AFTER UPDATE ON pagamento_produtos
FOR EACH ROW
BEGIN
  UPDATE pagamentos
  SET valor_total = COALESCE((
    SELECT SUM(pp.quantidade * pr.preco)
    FROM pagamento_produtos pp
    JOIN produtos pr ON pr.id_produto = pp.id_produto
    WHERE pp.id_pagamento = NEW.id_pagamento
  ), 0)
  WHERE id_pagamento = NEW.id_pagamento;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Recalcula o total do pagamento ao remover um item
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER trg_update_total_pagamento_del
AFTER DELETE ON pagamento_produtos
FOR EACH ROW
BEGIN
  UPDATE pagamentos
  SET valor_total = COALESCE((
    SELECT SUM(pp.quantidade * pr.preco)
    FROM pagamento_produtos pp
    JOIN produtos pr ON pr.id_produto = pp.id_produto
    WHERE pp.id_pagamento = OLD.id_pagamento
  ), 0)
  WHERE id_pagamento = OLD.id_pagamento;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Recalcula o total do pagamento ao inserir um atendimento
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER trg_update_total_pagamento_atendimento_ins
AFTER INSERT ON pagamento_atendimentos
FOR EACH ROW
BEGIN
  UPDATE pagamentos
  SET valor_total = (
    SELECT
      COALESCE((
        SELECT SUM(s.preco)
        FROM pagamento_atendimentos pa
        JOIN atendimentos a ON a.id_atendimento = pa.id_atendimento
        JOIN servicos s ON s.id_servico = a.id_servico
        WHERE pa.id_pagamento = NEW.id_pagamento
      ), 0) +
      COALESCE((
        SELECT SUM(pp.quantidade * pr.preco)
        FROM pagamento_produtos pp
        JOIN produtos pr ON pr.id_produto = pp.id_produto
        WHERE pp.id_pagamento = NEW.id_pagamento
      ), 0)
  )
  WHERE id_pagamento = NEW.id_pagamento;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Recalcula o total do pagamento ao remover um atendimento
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE TRIGGER trg_update_total_pagamento_atendimento_del
AFTER DELETE ON pagamento_atendimentos
FOR EACH ROW
BEGIN
  UPDATE pagamentos
  SET valor_total = (
    SELECT
      COALESCE((
        SELECT SUM(s.preco)
        FROM pagamento_atendimentos pa
        JOIN atendimentos a ON a.id_atendimento = pa.id_atendimento
        JOIN servicos s ON s.id_servico = a.id_servico
        WHERE pa.id_pagamento = OLD.id_pagamento
      ), 0) +
      COALESCE((
        SELECT SUM(pp.quantidade * pr.preco)
        FROM pagamento_produtos pp
        JOIN produtos pr ON pr.id_produto = pp.id_produto
        WHERE pp.id_pagamento = OLD.id_pagamento
      ), 0)
  )
  WHERE id_pagamento = OLD.id_pagamento;
END $$

DELIMITER ;

