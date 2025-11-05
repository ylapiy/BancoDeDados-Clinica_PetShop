-- Registrar pagamento com atualização automática do histórico
DELIMITER $$

CREATE PROCEDURE registrar_pagamento (
  IN p_id_atendimento INT,
  IN p_id_cliente INT,
  IN p_valor_total DECIMAL(10,2),
  IN p_forma_pagamento ENUM('dinheiro','cartao','pix'),
  IN p_status_pagamento ENUM('pago','pendente','cancelado')
)
BEGIN
  DECLARE v_existente INT;

  -- evita duplicar pagamento do mesmo atendimento
  SELECT COUNT(*) INTO v_existente
  FROM pagamentos
  WHERE id_atendimento = p_id_atendimento;

  IF v_existente = 0 THEN
    INSERT INTO pagamentos (
      id_atendimento,
      id_cliente,
      data_pagamento,
      valor_total,
      forma_pagamento,
      status_pagamento
    )
    VALUES (
      p_id_atendimento,
      p_id_cliente,
      NOW(),
      p_valor_total,
      p_forma_pagamento,
      p_status_pagamento
    );

    INSERT INTO historico_pagamentos (
      id_pagamento,
      status_pagamento,
      valor_pago,
      data_pagamento,
      data_alteracao
    )
    VALUES (
      LAST_INSERT_ID(),
      p_status_pagamento,
      p_valor_total,
      NOW(),
      NOW()
    );
  END IF;
END $$

DELIMITER ;



-- Criar atendimento com atualização automática do histórico
DELIMITER $$

CREATE PROCEDURE registrar_atendimento (
  IN p_id_pet INT,
  IN p_id_funcionario INT,
  IN p_id_servico INT,
  IN p_diagnostico TEXT,
  IN p_receita TEXT,
  IN p_observacoes TEXT
)
BEGIN
  DECLARE v_id_atendimento INT;

  INSERT INTO atendimentos (
    id_pet,
    id_funcionario,
    id_servico,
    data_atendimento,
    diagnostico,
    receita,
    observacoes
  )
  VALUES (
    p_id_pet,
    p_id_funcionario,
    p_id_servico,
    NOW(),
    p_diagnostico,
    p_receita,
    p_observacoes
  );

  SET v_id_atendimento = LAST_INSERT_ID();

  INSERT INTO historico_atendimentos (
    id_atendimento,
    diagnostico,
    receita,
    observacoes,
    data_alteracao
  )
  VALUES (
    v_id_atendimento,
    p_diagnostico,
    p_receita,
    p_observacoes,
    NOW()
  );

  -- retorna o ID criado (facilita integração)
  SELECT v_id_atendimento AS novo_atendimento;
END $$

DELIMITER ;



-- Atualizar status de pagamento (manual ou automático)
DELIMITER $$

CREATE PROCEDURE atualizar_status_pagamento (
  IN p_id_pagamento INT,
  IN p_novo_status ENUM('pago','pendente','cancelado')
)
BEGIN
  UPDATE pagamentos
  SET status_pagamento = p_novo_status,
      data_pagamento = NOW()
  WHERE id_pagamento = p_id_pagamento;

  INSERT INTO historico_pagamentos (
    id_pagamento,
    status_pagamento,
    valor_pago,
    data_pagamento,
    data_alteracao
  )
  SELECT
    p.id_pagamento,
    p.status_pagamento,
    p.valor_total,
    p.data_pagamento,
    NOW()
  FROM pagamentos p
  WHERE p.id_pagamento = p_id_pagamento;
END $$

DELIMITER ;



-- Repor estoque manualmente (para compras ou ajustes)
DELIMITER $$

CREATE PROCEDURE repor_estoque (
  IN p_id_produto INT,
  IN p_quantidade INT
)
BEGIN
  UPDATE produtos
  SET quantidade_estoque = quantidade_estoque + p_quantidade
  WHERE id_produto = p_id_produto;

  UPDATE estoque
  SET data_atualizacao = NOW()
  WHERE id_estoque = (
    SELECT id_estoque FROM produtos WHERE id_produto = p_id_produto
  );
END $$

DELIMITER ;



-- Consultar histórico de um cliente
DELIMITER $$

CREATE PROCEDURE consultar_historico_cliente (
  IN p_id_cliente INT
)
BEGIN
  SELECT
    c.nome AS cliente,
    p.nome AS pet,
    s.tipo_servico,
    a.data_atendimento,
    pg.status_pagamento,
    pg.valor_total
  FROM clientes c
  JOIN pets p ON c.id_cliente = p.id_cliente
  JOIN atendimentos a ON p.id_pet = a.id_pet
  LEFT JOIN pagamentos pg ON a.id_atendimento = pg.id_atendimento
  JOIN servicos s ON a.id_servico = s.id_servico
  WHERE c.id_cliente = p_id_cliente
  ORDER BY a.data_atendimento DESC;
END $$

DELIMITER ;
