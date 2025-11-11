-- ----------------------------------------------------------------------
-- Criar pagamento
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE criar_pagamento (
  IN p_id_cliente INT
)
BEGIN
  DECLARE v_id_pagamento INT;
  DECLARE v_cliente_existente INT;
  
  -- Verifica se o cliente existe
  SELECT COUNT(*) INTO v_cliente_existente
  FROM Clientes
  WHERE id_cliente = p_id_cliente;

  IF v_cliente_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Cliente não encontrado.';
  END IF;

  -- Cria o pagamento
  INSERT INTO Pagamentos (id_cliente, data_pagamento, valor_total, forma_pagamento, status_pagamento)
  VALUES (p_id_cliente, NOW(), 0.00, NULL, 'Pendente');

  SET v_id_pagamento = LAST_INSERT_ID();

  SELECT v_id_pagamento AS id_novo_pagamento;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Definir forma de pagamento
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE definir_forma_pagamento (
  IN p_id_pagamento INT,
  IN p_forma_pagamento VARCHAR(20)
)
BEGIN
  DECLARE v_pagamento_existente INT;

  -- Verifica se o pagamento existe
  SELECT COUNT(*) INTO v_pagamento_existente
  FROM Pagamentos
  WHERE id_pagamento = p_id_pagamento;

  IF v_pagamento_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pagamento não encontrado.';
  END IF;

  -- Atualiza a forma de pagamento
  UPDATE Pagamentos
  SET forma_pagamento = p_forma_pagamento
  WHERE id_pagamento = p_id_pagamento;

  SELECT CONCAT('Forma de pagamento definida como ', p_forma_pagamento, ' para o pagamento ID ', p_id_pagamento) AS resultado;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Associa o atendimento ao pagamento
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE associar_atendimento_pagamento (
  IN p_id_pagamento INT,
  IN p_id_atendimento INT
)
BEGIN
  DECLARE v_pagamento_existente INT;
  DECLARE v_atendimento_existente INT;
  DECLARE v_ja_associado INT;

  -- Verifica se o pagamento existe
  SELECT COUNT(*) INTO v_pagamento_existente
  FROM Pagamentos
  WHERE id_pagamento = p_id_pagamento;

  IF v_pagamento_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pagamento não encontrado.';
  END IF;

  -- Verifica se o atendimento existe
  SELECT COUNT(*) INTO v_atendimento_existente
  FROM Atendimentos
  WHERE id_atendimento = p_id_atendimento;

  IF v_atendimento_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Atendimento não encontrado.';
  END IF;

  -- Verifica se já está associado
  SELECT COUNT(*) INTO v_ja_associado
  FROM Pagamento_Atendimentos
  WHERE id_pagamento = p_id_pagamento AND id_atendimento = p_id_atendimento;

  IF v_ja_associado > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Esse atendimento já está associado a esse pagamento.';
  END IF;

  -- Faz a associação
  INSERT INTO Pagamento_Atendimentos (id_pagamento, id_atendimento)
  VALUES (p_id_pagamento, p_id_atendimento);
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Remove um atendimento do pagamento
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE desassociar_atendimento_pagamento (
  IN p_id_pagamento INT,
  IN p_id_atendimento INT
)
BEGIN
  DECLARE v_exists INT DEFAULT 0;
  DECLARE v_nome_servico VARCHAR(100);
  DECLARE v_pagamento_existente INT;
  DECLARE v_atendimento_existente INT;

  -- Verifica se o pagamento existe
  SELECT COUNT(*) INTO v_pagamento_existente
  FROM Pagamentos
  WHERE id_pagamento = p_id_pagamento;

  IF v_pagamento_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pagamento não encontrado.';
  END IF;

  -- Verifica se o atendimento existe
  SELECT COUNT(*) INTO v_atendimento_existente
  FROM Atendimentos
  WHERE id_atendimento = p_id_atendimento;

  IF v_atendimento_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Atendimento não encontrado.';
  END IF;

  -- Verifica se o vínculo existe
  SELECT COUNT(*) INTO v_exists
  FROM Pagamento_Atendimentos
  WHERE id_pagamento = p_id_pagamento
    AND id_atendimento = p_id_atendimento;

  IF v_exists = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Nenhum vínculo encontrado entre esse atendimento e o pagamento informado.';
  END IF;

  -- Busca o nome do serviço (opcional, pra mensagem)
  SELECT s.tipo_servico INTO v_nome_servico
  FROM Atendimentos a
  JOIN Servicos s ON s.id_servico = a.id_servico
  WHERE a.id_atendimento = p_id_atendimento;

  -- Remove o vínculo
  DELETE FROM Pagamento_Atendimentos
  WHERE id_pagamento = p_id_pagamento
    AND id_atendimento = p_id_atendimento;

  -- Resposta
  SELECT CONCAT('Atendimento (', v_nome_servico, ') removido do pagamento ID ', p_id_pagamento) AS resultado;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Associa os produtos ao pagamento com atualização do histórico
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE associar_pagamento_produto (
  IN p_id_pagamento INT,
  IN p_id_produto INT,
  IN p_quantidade INT
)
BEGIN
  DECLARE v_nome_produto VARCHAR(100);
  DECLARE v_estoque_atual INT;
  DECLARE v_pagamento_existente INT;
  DECLARE v_produto_existente INT;

  -- Valida quantidade
  IF p_quantidade <= 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Quantidade inválida. Insira um valor positivo.';
  END IF;

  -- Verifica se o pagamento existe
  SELECT COUNT(*) INTO v_pagamento_existente
  FROM Pagamentos
  WHERE id_pagamento = p_id_pagamento;

  IF v_pagamento_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pagamento não encontrado.';
  END IF;

  -- Verifica se o produto existe e pega dados
  SELECT COUNT(*), nome, quantidade_estoque
  INTO v_produto_existente, v_nome_produto, v_estoque_atual
  FROM Produtos
  WHERE id_produto = p_id_produto;

  IF v_produto_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Produto não encontrado.';
  END IF;

  -- Valida estoque
  IF v_estoque_atual < p_quantidade THEN
    SET @mensagem = CONCAT('Estoque insuficiente. Disponível: ', v_estoque_atual);
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = @mensagem;
  END IF;

  -- Associa produto ao pagamento (com upsert)
  INSERT INTO Pagamento_Produtos (id_pagamento, id_produto, quantidade)
  VALUES (p_id_pagamento, p_id_produto, p_quantidade)
  ON DUPLICATE KEY UPDATE quantidade = quantidade + p_quantidade;

  -- Atualiza estoque
  UPDATE Produtos
  SET quantidade_estoque = GREATEST(quantidade_estoque - p_quantidade, 0),
      data_atualizacao = NOW()
  WHERE id_produto = p_id_produto;

  -- Registra histórico
  INSERT INTO Historico_Estoque (id_produto, tipo_movimentacao, quantidade, observacao)
  VALUES (p_id_produto, 'Saída', p_quantidade, CONCAT('Venda - Pagamento ID: ', p_id_pagamento));

  -- Confirma
  SELECT CONCAT('Produto "', v_nome_produto, '" adicionado ao pagamento ID ', p_id_pagamento) AS resultado;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Remove produtos do pagamento com atualização do histórico
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE remover_pagamento_produto (
  IN p_id_pagamento INT,
  IN p_id_produto INT
)
BEGIN
  DECLARE v_qtd INT;
  DECLARE v_pagamento_existente INT;
  DECLARE v_produto_existente INT;

  -- Verifica se o pagamento existe
  SELECT COUNT(*) INTO v_pagamento_existente
  FROM Pagamentos
  WHERE id_pagamento = p_id_pagamento;

  IF v_pagamento_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pagamento não encontrado.';
  END IF;

  -- Verifica se o produto existe
  SELECT COUNT(*) INTO v_produto_existente
  FROM Produtos
  WHERE id_produto = p_id_produto;

  IF v_produto_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Produto não encontrado.';
  END IF;

  -- Busca quantidade associada
  SELECT quantidade INTO v_qtd
  FROM Pagamento_Produtos
  WHERE id_pagamento = p_id_pagamento AND id_produto = p_id_produto;

  IF v_qtd IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Produto não encontrado no pagamento.';
  END IF;

  -- Remove a associação
  DELETE FROM Pagamento_Produtos
  WHERE id_pagamento = p_id_pagamento AND id_produto = p_id_produto;

  -- Devolve ao estoque
  UPDATE Produtos
  SET quantidade_estoque = quantidade_estoque + v_qtd,
      data_atualizacao = NOW()
  WHERE id_produto = p_id_produto;

  -- Registra no histórico
  INSERT INTO Historico_Estoque (id_produto, tipo_movimentacao, quantidade, observacao)
  VALUES (p_id_produto, 'Entrada', v_qtd, CONCAT('Reversão - Pagamento ID: ', p_id_pagamento));
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Confirmar o pagamento com atualização do histórico
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE confirmar_pagamento (
  IN p_id_pagamento INT,
  IN p_forma_pagamento VARCHAR(20),
  IN p_status ENUM('Pago','Cancelado','Pendente')
)
BEGIN
  DECLARE v_total DECIMAL(10,2);
  DECLARE v_pagamento_existente INT;

  -- Verifica se o pagamento existe
  SELECT COUNT(*) INTO v_pagamento_existente
  FROM Pagamentos
  WHERE id_pagamento = p_id_pagamento;

  IF v_pagamento_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pagamento não encontrado.';
  END IF;

  -- Soma total de produtos
  SELECT COALESCE(SUM(pp.quantidade * pr.preco), 0)
  INTO v_total
  FROM Pagamento_Produtos pp
  JOIN Produtos pr ON pr.id_produto = pp.id_produto
  WHERE pp.id_pagamento = p_id_pagamento;

  -- Soma total de atendimentos
  SET v_total = v_total + COALESCE((
    SELECT SUM(s.preco)
    FROM Pagamento_Atendimentos pa
    JOIN Atendimentos a ON a.id_atendimento = pa.id_atendimento
    JOIN Servicos s ON s.id_servico = a.id_servico
    WHERE pa.id_pagamento = p_id_pagamento
  ), 0);

  -- Atualiza o pagamento
  UPDATE Pagamentos
  SET valor_total = v_total,
      forma_pagamento = p_forma_pagamento,
      status_pagamento = p_status,
      data_pagamento = NOW()
  WHERE id_pagamento = p_id_pagamento;

  -- Insere no histórico
  INSERT INTO Historico_Pagamentos (
    id_pagamento, status_pagamento, valor_pago, data_pagamento, data_alteracao
  )
  VALUES (
    p_id_pagamento, p_status, v_total, NOW(), NOW()
  );
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Criar atendimento com atualização do histórico
-- ----------------------------------------------------------------------
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
  DECLARE v_pet_existente INT;
  DECLARE v_func_existente INT;
  DECLARE v_servico_existente INT;

  -- Verifica se o pet existe
  SELECT COUNT(*) INTO v_pet_existente
  FROM Pets
  WHERE id_pet = p_id_pet;

  IF v_pet_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pet não encontrado.';
  END IF;

  -- Verifica se o funcionário existe
  SELECT COUNT(*) INTO v_func_existente
  FROM Funcionarios
  WHERE id_funcionario = p_id_funcionario;

  IF v_func_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Funcionário não encontrado.';
  END IF;

  -- Verifica se o serviço existe
  SELECT COUNT(*) INTO v_servico_existente
  FROM Servicos
  WHERE id_servico = p_id_servico;

  IF v_servico_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Serviço não encontrado.';
  END IF;

  -- Insere o atendimento
  INSERT INTO Atendimentos (
    id_pet, id_funcionario, id_servico,
    data_atendimento, diagnostico, receita, observacoes
  )
  VALUES (
    p_id_pet, p_id_funcionario, p_id_servico,
    NOW(), p_diagnostico, p_receita, p_observacoes
  );

  SET v_id_atendimento = LAST_INSERT_ID();

  -- Registra histórico
  INSERT INTO Historico_Atendimentos (
    id_atendimento, diagnostico, receita, observacoes, data_alteracao
  )
  VALUES (
    v_id_atendimento, p_diagnostico, p_receita, p_observacoes, NOW()
  );

  -- Retorna ID
  SELECT v_id_atendimento AS novo_atendimento;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Repor estoque manualmente (para compras ou ajustes)
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE repor_estoque (
  IN p_id_produto INT,
  IN p_quantidade INT
)
BEGIN
  DECLARE v_produto_existente INT;

  -- Verifica se o produto existe
  SELECT COUNT(*) INTO v_produto_existente
  FROM Produtos
  WHERE id_produto = p_id_produto;

  IF v_produto_existente = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Produto não encontrado.';
  END IF;

  -- Atualiza estoque do produto
  UPDATE Produtos
  SET quantidade_estoque = quantidade_estoque + p_quantidade,
      data_atualizacao = NOW()
  WHERE id_produto = p_id_produto;

  -- Atualiza data no estoque (localização)
  UPDATE Estoque e
  JOIN Produtos p ON p.id_estoque = e.id_estoque
  SET e.data_atualizacao = NOW()
  WHERE p.id_produto = p_id_produto;

  -- Registra histórico
  INSERT INTO Historico_Estoque (
    id_produto, tipo_movimentacao, quantidade, observacao
  )
  VALUES (
    p_id_produto, 'Entrada', p_quantidade, 'Reposição manual'
  );
END $$

DELIMITER ;


-- ----------------------------------------------------------------------
-- Atualizar Pagamento
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE atualizar_pagamento(
  IN p_id_pagamento INT,
  IN p_forma_pagamento VARCHAR(20),
  IN p_status_pagamento ENUM('Pendente', 'Pago', 'Cancelado'),
  IN p_valor_total DECIMAL(10,2)
)
BEGIN
  UPDATE Pagamentos
  SET forma_pagamento = p_forma_pagamento, status_pagamento = p_status_pagamento, valor_total = p_valor_total
  WHERE id_pagamento = p_id_pagamento;
END $$

DELIMITER ;



-- ----------------------------------------------------------------------
-- Atualizar Atendimento
-- ----------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE atualizar_atendimento(
  IN p_id_atendimento INT,
  IN p_diagnostico TEXT,
  IN p_receita TEXT,
  IN p_observacoes TEXT
)
BEGIN
  UPDATE Atendimentos
  SET diagnostico = p_diagnostico, receita = p_receita, observacoes = p_observacoes
  WHERE id_atendimento = p_id_atendimento;
END $$

DELIMITER ;

