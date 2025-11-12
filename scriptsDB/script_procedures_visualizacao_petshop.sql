-- ----------------------------------------------------------------------
-- Consulta histórico de um cliente
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE consultar_historico_cliente (
  IN p_id_cliente INT
)
BEGIN
  DECLARE v_cliente_existente INT;

  -- Verifica se o cliente existe
  SELECT COUNT(*) INTO v_cliente_existente
  FROM Clientes
  WHERE id_cliente = p_id_cliente;

  IF v_cliente_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Cliente não encontrado.';
  END IF;

  -- Consulta o histórico do cliente
  SELECT
    c.nome AS cliente,
    p.nome AS pet,
    s.tipo_servico,
    a.data_atendimento,
    pg.status_pagamento,
    pg.valor_total
  FROM Clientes c
  LEFT JOIN Pets p ON c.id_cliente = p.id_cliente
  LEFT JOIN Atendimentos a ON p.id_pet = a.id_pet
  LEFT JOIN Servicos s ON a.id_servico = s.id_servico
  LEFT JOIN Pagamento_Atendimentos pa ON pa.id_atendimento = a.id_atendimento
  LEFT JOIN Pagamentos pg ON pa.id_pagamento = pg.id_pagamento
  WHERE c.id_cliente = p_id_cliente
  ORDER BY a.data_atendimento DESC;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Lista serviços de um pet
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE listar_servicos_por_pet (
  IN p_id_pet INT
)
BEGIN
  DECLARE v_pet_existente INT;

  SELECT COUNT(*) INTO v_pet_existente
  FROM Pets
  WHERE id_pet = p_id_pet;

  IF v_pet_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pet não encontrado.';
  END IF;

  SELECT
    p.nome AS pet,
    s.tipo_servico,
    a.data_atendimento,
    a.diagnostico,
    a.receita
  FROM Atendimentos a
  JOIN Servicos s ON a.id_servico = s.id_servico
  JOIN Pets p ON p.id_pet = a.id_pet
  WHERE a.id_pet = p_id_pet
  ORDER BY a.data_atendimento DESC;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Lista produtos de um pagamento
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE listar_produtos_por_pagamento (
  IN p_id_pagamento INT
)
BEGIN
  DECLARE v_pagamento_existente INT;

  SELECT COUNT(*) INTO v_pagamento_existente
  FROM Pagamentos
  WHERE id_pagamento = p_id_pagamento;

  IF v_pagamento_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pagamento não encontrado.';
  END IF;

  SELECT
    pr.nome AS produto,
    pr.preco,
    pp.quantidade,
    (pr.preco * pp.quantidade) AS subtotal
  FROM Pagamento_Produtos pp
  JOIN Produtos pr ON pr.id_produto = pp.id_produto
  WHERE pp.id_pagamento = p_id_pagamento;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Lista atendimentos de um funcionário
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE listar_atendimentos_por_funcionario (
  IN p_id_funcionario INT
)
BEGIN
  DECLARE v_func_existente INT;

  SELECT COUNT(*) INTO v_func_existente
  FROM Funcionarios
  WHERE id_funcionario = p_id_funcionario;

  IF v_func_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Funcionário não encontrado.';
  END IF;

  SELECT
    f.nome AS funcionario,
    c.nome AS cliente,
    p.nome AS pet,
    s.tipo_servico,
    a.data_atendimento
  FROM Atendimentos a
  JOIN Funcionarios f ON f.id_funcionario = a.id_funcionario
  JOIN Pets p ON p.id_pet = a.id_pet
  JOIN Clientes c ON c.id_cliente = p.id_cliente
  JOIN Servicos s ON s.id_servico = a.id_servico
  WHERE a.id_funcionario = p_id_funcionario
  ORDER BY a.data_atendimento DESC;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Lista pagamentos que possuem status específico
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE relatorio_pagamentos_por_status()
BEGIN
  SELECT
    status_pagamento,
    COUNT(*) AS quantidade,
    SUM(COALESCE(valor_total,0)) AS total
  FROM Pagamentos
  GROUP BY status_pagamento;
END $$

DELIMITER ;
