
-- =====================================================
-- CLIENTES
-- =====================================================
DELIMITER $$

CREATE PROCEDURE cadastrar_cliente (
  IN p_nome VARCHAR(100),
  IN p_cpf VARCHAR(14),
  IN p_endereco TEXT,
  IN p_telefone VARCHAR(20)
)
BEGIN
  -- verifica se o cpf já foi cadastrado
  IF EXISTS (
    SELECT 1 FROM Clientes WHERE cpf = p_cpf
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Já existe um cliente com esse CPF.';
  END IF;

  INSERT INTO Clientes (nome, cpf, endereco, telefone)
  VALUES (p_nome, p_cpf, p_endereco, p_telefone);

  SELECT LAST_INSERT_ID() AS id_cliente_criado;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE remover_cliente(IN p_id_cliente INT)
BEGIN
  -- verifica se o cliente existe
  IF NOT EXISTS (SELECT 1 FROM Clientes WHERE id_cliente = p_id_cliente) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Cliente não encontrado.';
  END IF;

  -- remove o cliente
  DELETE FROM Clientes WHERE id_cliente = p_id_cliente;
  
  SELECT CONCAT('Cliente ID ', p_id_cliente, ' removido com sucesso.') AS resultado;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE buscar_cliente_por_id(IN p_id_cliente INT)
BEGIN
  SELECT * FROM Clientes WHERE id_cliente = p_id_cliente;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE listar_clientes()
BEGIN
  SELECT * FROM Clientes;
END $$

DELIMITER ;

DELIMITER $$
-- Atualizar Cliente
CREATE PROCEDURE atualizar_cliente(
  IN p_id_cliente INT,
  IN p_nome VARCHAR(100),
  IN p_cpf VARCHAR(14),
  IN p_endereco TEXT,
  IN p_telefone VARCHAR(20)
)
BEGIN
 -- Verifica se o cliente existe
  IF NOT EXISTS (SELECT 1 FROM Clientes WHERE id_cliente = p_id_cliente) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Cliente não encontrado.';
  END IF;
  
  UPDATE Clientes
  SET nome = p_nome, cpf = p_cpf, endereco = p_endereco, telefone = p_telefone
  WHERE id_cliente = p_id_cliente;
  
  SELECT CONCAT('Cliente ID ', p_id_cliente, ' atualizado com sucesso.') AS resultado;
END $$

DELIMITER ;


-- =====================================================
-- PETS
-- =====================================================

DELIMITER $$
CREATE PROCEDURE cadastrar_pet (
  IN p_nome VARCHAR(100),
  IN p_animal VARCHAR(50),
  IN p_idade INT,
  IN p_raca VARCHAR(100),
  IN p_peso DECIMAL(5,2),
  IN p_porte VARCHAR(20),
  IN p_sexo CHAR(1),
  IN p_id_cliente INT
)
BEGIN
  -- verifica se o pet está relacionado a um cliente existente
  IF NOT EXISTS (
    SELECT 1 FROM Clientes WHERE id_cliente = p_id_cliente
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Cliente não encontrado.';
  END IF;

  INSERT INTO Pets (
    nome, animal, idade, raca, peso, porte, sexo, id_cliente
  )
  VALUES (
    p_nome, p_animal, p_idade, p_raca, p_peso, p_porte, p_sexo, p_id_cliente
  );

  SELECT LAST_INSERT_ID() AS id_pet_criado;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE remover_pet(IN p_id_pet INT)
BEGIN
  -- verifica se o pet existe
  IF NOT EXISTS (SELECT 1 FROM Pets WHERE id_pet = p_id_pet) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pet não encontrado.';
  END IF;

  DELETE FROM Pets WHERE id_pet = p_id_pet;
  
  SELECT CONCAT('Pet ID ', p_id_pet, ' removido com sucesso.') AS resultado;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE buscar_pet_por_id(IN p_id_pet INT)
BEGIN
  SELECT * FROM Pets WHERE id_pet = p_id_pet;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE listar_pets()
BEGIN
  SELECT * FROM Pets;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE listar_pets_por_cliente(IN p_id_cliente INT)
BEGIN
  SELECT * FROM Pets WHERE id_cliente = p_id_cliente;
END $$

DELIMITER ;

DELIMITER $$
-- Atualizar Pet
CREATE PROCEDURE atualizar_pet(
  IN p_id_pet INT,
  IN p_nome VARCHAR(100),
  IN p_animal VARCHAR(50),
  IN p_idade INT,
  IN p_raca VARCHAR(100),
  IN p_peso DECIMAL(5,2),
  IN p_porte VARCHAR(20),
  IN p_sexo CHAR(1),
  IN p_id_cliente INT
)
BEGIN
  -- verifica se o pet existe
  IF NOT EXISTS (SELECT 1 FROM Pets WHERE id_pet = p_id_pet) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pet não encontrado.';
  END IF;

  UPDATE Pets
  SET nome = p_nome, animal = p_animal, idade = p_idade, raca = p_raca, peso = p_peso, porte = p_porte, sexo = p_sexo, id_cliente = p_id_cliente
  WHERE id_pet = p_id_pet;
  
  SELECT CONCAT('Pet ID ', p_id_pet, ' atualizado com sucesso.') AS resultado;
END $$

DELIMITER ;


-- =====================================================
-- CARGOS
-- =====================================================
DELIMITER $$
CREATE PROCEDURE cadastrar_cargo(
  IN p_nome VARCHAR(100),
  IN p_especialidade VARCHAR(100),
  IN p_crmv VARCHAR(20)
)
BEGIN
  INSERT INTO Cargos (nome, especialidade, crmv)
  VALUES (p_nome, p_especialidade, p_crmv);
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE remover_cargo(IN p_id_cargo INT)
BEGIN
  -- verifica se o cargo existe
  IF NOT EXISTS (SELECT 1 FROM Cargos WHERE id_cargo = p_id_cargo) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Cargo não encontrado.';
  END IF;
  
  DELETE FROM Cargos WHERE id_cargo = p_id_cargo;
  
  SELECT CONCAT('Cargo ID ', p_id_cargo, ' removido com sucesso.') AS resultado;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE buscar_cargo_por_id(IN p_id_cargo INT)
BEGIN
  SELECT * FROM cargos WHERE id_cargo = p_id_cargo;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE listar_cargos()
BEGIN
  SELECT * FROM Cargos;
END $$

DELIMITER ;

DELIMITER $$
-- Atualizar Cargo
CREATE PROCEDURE atualizar_cargo(
  IN p_id_cargo INT,
  IN p_nome VARCHAR(100),
  IN p_especialidade VARCHAR(100),
  IN p_crmv VARCHAR(20)
)
BEGIN
  -- verifica se o cargo existe
  IF NOT EXISTS (SELECT 1 FROM Cargos WHERE id_cargo = p_id_cargo) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Cargo não encontrado.';
  END IF;

  UPDATE Cargos
  SET nome = p_nome, especialidade = p_especialidade, crmv = p_crmv
  WHERE id_cargo = p_id_cargo;
  
  SELECT CONCAT('Cargo ID ', p_id_cargo, ' atualizado com sucesso.') AS resultado;
END $$

DELIMITER ;


-- =====================================================
-- FUNCIONÁRIOS
-- =====================================================
DELIMITER $$
CREATE PROCEDURE cadastrar_funcionario(
  IN p_nome VARCHAR(100),
  IN p_cpf VARCHAR(14),
  IN p_email VARCHAR(100),
  IN p_telefone VARCHAR(20),
  IN p_id_cargo INT,
  IN p_contrato VARCHAR(10)
)
BEGIN
  INSERT INTO Funcionarios (nome, cpf, email, telefone, id_cargo, contrato)
  VALUES (p_nome, p_cpf, p_email, p_telefone, p_id_cargo, p_contrato);
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE remover_funcionario(IN p_id_funcionario INT)
BEGIN
  -- verifica se o funcionário existe
  IF NOT EXISTS (SELECT 1 FROM Funcionarios WHERE id_funcionario = p_id_funcionario) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Funcionário não encontrado.';
  END IF;
  
  DELETE FROM Funcionarios WHERE id_funcionario = p_id_funcionario;
  
  SELECT CONCAT('Funcionário ID ', p_id_funcionario, ' removido com sucesso.') AS resultado;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE buscar_funcionario_por_id(IN p_id_funcionario INT)
BEGIN
  SELECT * FROM Funcionarios WHERE id_funcionario = p_id_funcionario;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE listar_funcionarios()
BEGIN
  SELECT * FROM Funcionarios;
END $$

DELIMITER ;

DELIMITER $$
-- Atualizar Funcionário
CREATE PROCEDURE atualizar_funcionario(
  IN p_id_funcionario INT,
  IN p_nome VARCHAR(100),
  IN p_cpf VARCHAR(14),
  IN p_email VARCHAR(100),
  IN p_telefone VARCHAR(20),
  IN p_id_cargo INT,
  IN p_contrato VARCHAR(10)
)
BEGIN
  -- verifica se o funcionário existe
  IF NOT EXISTS (SELECT 1 FROM Funcionarios WHERE id_funcionario = p_id_funcionario) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Funcionário não encontrado.';
  END IF;
  
  -- verifica se já existe um funcionário com o cpf inserido
  IF EXISTS (SELECT 1 FROM Funcionarios WHERE cpf = p_cpf AND id_funcionario <> p_id_funcionario) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Já existe um funcionário com esse CPF.';
  END IF;

  UPDATE Funcionarios
  SET nome = p_nome, cpf = p_cpf, email = p_email, telefone = p_telefone, id_cargo = p_id_cargo, contrato = p_contrato
  WHERE id_funcionario = p_id_funcionario;
  
  SELECT CONCAT('Funcionário ID ', p_id_funcionario, ' atualizado com sucesso.') AS resultado;
END $$

DELIMITER ;


-- =====================================================
-- PRODUTOS
-- =====================================================
DELIMITER $$
CREATE PROCEDURE cadastrar_produto(
  IN p_id_estoque INT,
  IN p_categoria VARCHAR(50),
  IN p_nome VARCHAR(100),
  IN p_preco DECIMAL(10,2),
  IN p_quantidade INT,
  IN p_descricao TEXT,
  IN p_min INT,
  IN p_max INT
)
BEGIN
  INSERT INTO Produtos (
    id_estoque, categoria, nome, preco, quantidade_estoque,
    descricao, estoque_minimo, estoque_maximo
  )
  VALUES (
    p_id_estoque, p_categoria, p_nome, p_preco, p_quantidade,
    p_descricao, p_min, p_max
  );
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE remover_produto(IN p_id_produto INT)
BEGIN
  DECLARE v_nome VARCHAR(100);

  -- verifica se o produto existe e captura nome
  SELECT nome INTO v_nome FROM Produtos WHERE id_produto = p_id_produto;
  IF v_nome IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Produto não encontrado.';
  END IF;

  DELETE FROM Produtos WHERE id_produto = p_id_produto;
  
  SELECT CONCAT('Produto "', v_nome, '" removido com sucesso.') AS resultado;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE buscar_produto_por_id(IN p_id_produto INT)
BEGIN
  SELECT * FROM produtos WHERE id_produto = p_id_produto;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE listar_produtos()
BEGIN
  SELECT * FROM Produtos;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE atualizar_produto(
  IN p_id_produto INT,
  IN p_id_estoque INT,
  IN p_categoria VARCHAR(50),
  IN p_nome VARCHAR(100),
  IN p_preco DECIMAL(10,2),
  IN p_quantidade INT,
  IN p_descricao TEXT,
  IN p_min INT,
  IN p_max INT
)
BEGIN
  DECLARE v_nome VARCHAR(100);
  
  -- verifica se o produto existe e captura nome
  SELECT nome INTO v_nome FROM Produtos WHERE id_produto = p_id_produto;
  IF v_nome IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Produto não encontrado.';
  END IF;

  UPDATE Produtos
  SET id_estoque = p_id_estoque,
      categoria = p_categoria,
      nome = p_nome,
      preco = p_preco,
      quantidade_estoque = p_quantidade,
      descricao = p_descricao,
      estoque_minimo = p_min,
      estoque_maximo = p_max,
      data_atualizacao = NOW()
  WHERE id_produto = p_id_produto;

  INSERT INTO Historico_Estoque (id_produto, tipo_movimentacao, quantidade, observacao)
  VALUES (p_id_produto, 'Atualização', p_quantidade, 'Atualização manual de produto');

  SELECT CONCAT('Produto "', v_nome, '" atualizado com sucesso.') AS resultado;
END $$

DELIMITER ;



-- =====================================================
-- SERVIÇOS
-- =====================================================
DELIMITER $$
CREATE PROCEDURE cadastrar_servico(
  IN p_tipo_servico VARCHAR(100),
  IN p_preco DECIMAL(10,2),
  IN p_descricao TEXT
)
BEGIN
  INSERT INTO Servicos (tipo_servico, preco, descricao)
  VALUES (p_tipo_servico, p_preco, p_descricao);
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE remover_servico(IN p_id_servico INT)
BEGIN
  -- verifica se o serviço existe
  IF NOT EXISTS (SELECT 1 FROM Servicos WHERE id_servico = p_id_servico) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Serviço não encontrado.';
  END IF;

  DELETE FROM Servicos WHERE id_servico = p_id_servico;
  
  SELECT CONCAT('Serviço ID ', p_id_servico, ' removido com sucesso.') AS resultado;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE buscar_servico_por_id(IN p_id_servico INT)
BEGIN
  SELECT * FROM servicos WHERE id_servico = p_id_servico;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE listar_servicos()
BEGIN
  SELECT * FROM Servicos;
END $$

DELIMITER ;

DELIMITER $$
-- Atualizar Serviço
CREATE PROCEDURE atualizar_servico(
  IN p_id_servico INT,
  IN p_tipo_servico VARCHAR(100),
  IN p_preco DECIMAL(10,2),
  IN p_descricao TEXT
)
BEGIN
  -- verifica se o serviço existe
  IF NOT EXISTS (SELECT 1 FROM Servicos WHERE id_servico = p_id_servico) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Serviço não encontrado.';
  END IF;
  
  UPDATE Servicos
  SET tipo_servico = p_tipo_servico, preco = p_preco, descricao = p_descricao
  WHERE id_servico = p_id_servico;
  
  SELECT CONCAT('Serviço ID ', p_id_servico, ' atualizado com sucesso.') AS resultado;
END $$

DELIMITER ;


-- =====================================================
-- ESTOQUE
-- =====================================================
DELIMITER $$
CREATE PROCEDURE cadastrar_estoque(IN p_localizacao VARCHAR(100))
BEGIN
  INSERT INTO Estoque (localizacao, data_atualizacao)
  VALUES (p_localizacao, NOW());
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE remover_estoque(IN p_id_estoque INT)
BEGIN
  -- verifica se o estoque existe
  IF NOT EXISTS (SELECT 1 FROM Estoque WHERE id_estoque = p_id_estoque) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Estoque não encontrado.';
  END IF;

  DELETE FROM Estoque WHERE id_estoque = p_id_estoque;
  
  SELECT CONCAT('Estoque ID ', p_id_estoque, ' removido com sucesso.') AS resultado;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE buscar_estoque_por_id(IN p_id_estoque INT)
BEGIN
  SELECT * FROM estoque WHERE id_estoque = p_id_estoque;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE listar_estoques()
BEGIN
  SELECT * FROM Estoque;
END $$

DELIMITER ;

DELIMITER $$
-- Atualizar Estoque
CREATE PROCEDURE atualizar_estoque(
  IN p_id_estoque INT,
  IN p_localizacao VARCHAR(100)
)
BEGIN
  -- verifica se o estoque existe
  IF NOT EXISTS (SELECT 1 FROM Estoque WHERE id_estoque = p_id_estoque) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Estoque não encontrado.';
  END IF;
  
  UPDATE Estoque
  SET localizacao = p_localizacao, data_atualizacao = NOW()
  WHERE id_estoque = p_id_estoque;
  
  INSERT INTO Historico_Estoque (id_produto, tipo_movimentacao, quantidade, observacao)
  VALUES (NULL, 'Atualização', 0, CONCAT('Localização do estoque ID ', p_id_estoque, ' alterada para "', p_localizacao, '".'));

  
  SELECT CONCAT('Estoque ID ', p_id_estoque, ' atualizado com sucesso.') AS resultado;
END $$

DELIMITER ;
