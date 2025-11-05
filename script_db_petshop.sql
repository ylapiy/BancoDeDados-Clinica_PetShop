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
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(25)
);

-- -----------------------------------------------------
-- TABELA: Pets
-- -----------------------------------------------------
CREATE TABLE Pets (
    id_pet INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    animal VARCHAR(50),
    idade INT,
    raca VARCHAR(50),
    peso DECIMAL(5,2),
    porte VARCHAR(20),
    sexo ENUM('M', 'F'),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
        ON DELETE CASCADE
);

-- -----------------------------------------------------
-- TABELA: Cargos
-- -----------------------------------------------------
CREATE TABLE Cargos (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    especialidade VARCHAR(50),
    crmv VARCHAR(10)
);

-- -----------------------------------------------------
-- TABELA: Funcionarios
-- -----------------------------------------------------
CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    contrato VARCHAR(50),
    email VARCHAR(100),
    telefone VARCHAR(25),
    id_cargo INT,
    FOREIGN KEY (id_cargo) REFERENCES Cargos(id_cargo)
);

-- -----------------------------------------------------
-- TABELA: Servicos
-- -----------------------------------------------------
CREATE TABLE Servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    tipo_servico VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2),
    descricao TEXT
);

-- -----------------------------------------------------
-- TABELA: Atendimentos
-- -----------------------------------------------------
CREATE TABLE Atendimentos (
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
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario),
    FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico)
);

-- -----------------------------------------------------
-- TABELA: Historico de Atendimentos
-- -----------------------------------------------------
CREATE TABLE Historico_Atendimentos (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_atendimento INT NOT NULL,
    diagnostico TEXT,
    receita TEXT,
    observacoes TEXT,
    data_alteracao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_atendimento) REFERENCES Atendimentos(id_atendimento)
        ON DELETE CASCADE
);

-- -----------------------------------------------------
-- TABELA: Pagamentos
-- -----------------------------------------------------
CREATE TABLE Pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_atendimento INT NOT NULL,
    id_cliente INT NOT NULL,
    data_pagamento DATE,
    valor_total DECIMAL(10,2),
    forma_pagamento ENUM('Dinheiro', 'Cartão', 'Pix', 'Outro'),
    status_pagamento ENUM('Pendente', 'Pago', 'Cancelado') DEFAULT 'Pendente',
    FOREIGN KEY (id_atendimento) REFERENCES Atendimentos(id_atendimento)
        ON DELETE CASCADE,
	FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
		ON DELETE CASCADE
);

-- -----------------------------------------------------
-- TABELA: Historico de Pagamentos
-- -----------------------------------------------------
CREATE TABLE Historico_Pagamentos (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_pagamento INT NOT NULL,
    status_pagamento ENUM('Pendente', 'Pago', 'Cancelado') NOT NULL,
    valor_pago DECIMAL(10, 2),
    data_pagamento DATE,
    observacoes TEXT,
    data_alteracao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pagamento) REFERENCES Pagamentos(id_pagamento)
        ON DELETE CASCADE
);

-- -----------------------------------------------------
-- TABELA: Estoque
-- -----------------------------------------------------
CREATE TABLE Estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    localizacao VARCHAR(100),
    data_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- TABELA: Produtos
-- -----------------------------------------------------
CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_estoque INT,
    categoria VARCHAR(50),
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT DEFAULT 0,
    descricao TEXT,
    FOREIGN KEY (id_estoque) REFERENCES Estoque(id_estoque)
);

-- -----------------------------------------------------
-- TABELA INTERMEDIÁRIA: Produtos em Pagamentos (N:N)
-- -----------------------------------------------------
CREATE TABLE Pagamento_Produtos (
    id_pagamento INT,
    id_produto INT,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (id_pagamento, id_produto),
    FOREIGN KEY (id_pagamento) REFERENCES Pagamentos(id_pagamento)
        ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- -----------------------------------------------------
-- EXTRAS: ÍNDICES E AJUSTES DE PERFORMANCE
-- ----------------------------------------------------- 
CREATE INDEX idx_nome_cliente ON Clientes(nome);
CREATE INDEX idx_nome_pet ON Pets(nome);
CREATE INDEX idx_nome_funcionario ON Funcionarios(nome);
CREATE INDEX idx_tipo_servico ON Servicos(tipo_servico);
