-- -----------------------------------------------------
-- BANCO DE DADOS
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS clinica_petshop
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;
USE clinica_petshop;



-- -----------------------------------------------------
-- TABELA: Clientes
-- -----------------------------------------------------
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(25)
);



-- -----------------------------------------------------
-- TABELA: Pets
-- -----------------------------------------------------
CREATE TABLE pets (
    id_pet INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    animal VARCHAR(50),
    idade INT,
    raca VARCHAR(50),
    peso DECIMAL(5,2),
    porte VARCHAR(20),
    sexo ENUM('M', 'F'),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
);



-- -----------------------------------------------------
-- TABELA: Cargos
-- -----------------------------------------------------
CREATE TABLE cargos (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    especialidade VARCHAR(50),
    crmv VARCHAR(10)
);



-- -----------------------------------------------------
-- TABELA: Funcionarios
-- -----------------------------------------------------
CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    contrato VARCHAR(50),
    email VARCHAR(100),
    telefone VARCHAR(25),
    id_cargo INT,
    FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo)
);



-- -----------------------------------------------------
-- TABELA: Servicos
-- -----------------------------------------------------
CREATE TABLE servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    tipo_servico VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2),
    descricao TEXT
);



-- -----------------------------------------------------
-- TABELA: Atendimentos
-- -----------------------------------------------------
CREATE TABLE atendimentos (
    id_atendimento INT AUTO_INCREMENT PRIMARY KEY,
    id_pet INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_servico INT NOT NULL,
    data_atendimento DATETIME DEFAULT CURRENT_TIMESTAMP,
    diagnostico TEXT,
    receita TEXT,
    observacoes TEXT,
    FOREIGN KEY (id_pet) REFERENCES Pets(id_pet)
        ON DELETE CASCADE,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_servico) REFERENCES servicos(id_servico)
);

  

-- -----------------------------------------------------
-- TABELA: Historico de Atendimentos
-- -----------------------------------------------------
CREATE TABLE historico_atendimentos (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_atendimento INT NOT NULL,
    diagnostico TEXT,
    receita TEXT,
    observacoes TEXT,
    data_alteracao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_atendimento) REFERENCES atendimentos(id_atendimento)
        ON DELETE CASCADE
);



-- -----------------------------------------------------
-- TABELA: Pagamentos
-- -----------------------------------------------------
CREATE TABLE pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pagamento DATETIME DEFAULT NOW(),
    valor_total DECIMAL(10,2),
    forma_pagamento ENUM('Dinheiro', 'Cartão', 'Pix', 'Outro') NULL,
    status_pagamento ENUM('Pendente', 'Pago', 'Cancelado') DEFAULT 'Pendente',
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
		ON DELETE CASCADE
);



-- -----------------------------------------------------
-- TABELA: Historico de Pagamentos
-- -----------------------------------------------------
CREATE TABLE historico_pagamentos (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_pagamento INT NOT NULL,
    status_pagamento ENUM('Pendente', 'Pago', 'Cancelado') NOT NULL,
    valor_pago DECIMAL(10, 2),
    data_pagamento DATETIME,
    observacoes TEXT,
    data_alteracao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pagamento) REFERENCES pagamentos(id_pagamento)
        ON DELETE CASCADE
);



-- -----------------------------------------------------
-- TABELA: Estoque
-- -----------------------------------------------------
CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    localizacao VARCHAR(100),
    data_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP
);



-- -----------------------------------------------------
-- TABELA: Produtos
-- -----------------------------------------------------
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_estoque INT,
    categoria VARCHAR(50),
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT DEFAULT 0,
    descricao TEXT,
    estoque_minimo INT DEFAULT 5,
    estoque_maximo INT DEFAULT 50,
    data_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque)
);



-- -----------------------------------------------------
-- TABELA: Histórico de Estoque
-- -----------------------------------------------------
CREATE TABLE historico_estoque (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    tipo_movimentacao ENUM('Entrada', 'Saída', 'Ajuste', 'UsoInterno') NOT NULL,
    quantidade INT NOT NULL,
    data_movimentacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    observacao TEXT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
        ON DELETE CASCADE
);



-- -----------------------------------------------------
-- TABELA INTERMEDIÁRIA: Produtos em Pagamentos (N:N)
-- -----------------------------------------------------
CREATE TABLE pagamento_produtos (
    id_pagamento INT,
    id_produto INT,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (id_pagamento, id_produto),
    FOREIGN KEY (id_pagamento) REFERENCES pagamentos(id_pagamento)
        ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);



-- -----------------------------------------------------
-- TABELA INTERMEDIÁRIA: Atendimentos em Pagamentos (N:N)
-- -----------------------------------------------------
CREATE TABLE pagamento_atendimentos (
    id_pagamento INT,
    id_atendimento INT,
    PRIMARY KEY (id_pagamento, id_atendimento),
    FOREIGN KEY (id_pagamento) REFERENCES pagamentos(id_pagamento)
        ON DELETE CASCADE,
    FOREIGN KEY (id_atendimento) REFERENCES atendimentos(id_atendimento)
        ON DELETE CASCADE
);



-- -----------------------------------------------------
-- ÍNDICES DE BUSCA TEXTUAL
-- ----------------------------------------------------- 
CREATE INDEX idx_nome_cliente ON clientes(nome);
CREATE INDEX idx_nome_pet ON pets(nome);
CREATE INDEX idx_nome_funcionario ON funcionarios(nome);
CREATE INDEX idx_tipo_servico ON servicos(tipo_servico);



-- -----------------------------------------------------
-- ÍNDICES DE RELATÓRIOS E DESEMPENHO
-- -----------------------------------------------------

CREATE INDEX idx_pagamentos_cliente ON pagamentos(id_cliente);
CREATE INDEX idx_pagamentos_status ON pagamentos(status_pagamento);
CREATE INDEX idx_pagamentos_data ON pagamentos(data_pagamento);

CREATE INDEX idx_pagamento_produto ON pagamento_Produtos(id_produto);
CREATE INDEX idx_pagamento_pagamento ON pagamento_Produtos(id_pagamento);

CREATE INDEX idx_atendimentos_data ON atendimentos(data_atendimento);
CREATE INDEX idx_atendimentos_funcionario ON atendimentos(id_funcionario);
CREATE INDEX idx_atendimentos_pet ON atendimentos(id_pet);
CREATE INDEX idx_atendimentos_servico ON atendimentos(id_servico);

CREATE INDEX idx_pets_cliente ON pets(id_cliente);

