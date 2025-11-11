
-- =====================================================
-- CARGOS
-- =====================================================
INSERT INTO cargos (nome, especialidade, crmv) VALUES
('Veterinário Clínico', 'Clínica Geral', 'PI-12345'),
('Veterinário Cirurgião', 'Cirurgias e Emergências', 'PI-54321'),
('Tosador / Banho e Tosa', 'Higiene e Estética Animal', NULL),
('Atendente de Loja / Caixa', 'Vendas e Atendimento', NULL),
('Atendente de Recepção', 'Recepção e Agendamentos', NULL);

-- =====================================================
-- FUNCIONÁRIOS
-- =====================================================
INSERT INTO funcionarios (nome, cpf, email, telefone, id_cargo, contrato) VALUES
('Rafael Duarte', '931.139.273-15', 'rafael@clinicavet.com', '(86) 99999-0000', 1, 'CLT'),
('Milena Menezes', '782.577.513-91', 'milena@clinicavet.com', '(86) 98888-1112', 2, 'CLT'),
('Carlos Souza', '043.862.323-11', 'carlos@clinicavet.com', '(86) 98888-1234', 3, 'PJ'),
('Luciana Torres', '264.318.723-71', 'luciana@clinicavet.com', '(86) 97777-4321', 3, 'PJ'),
('Amanda Ribeiro', '760.174.013-78', 'amanda@clinicavet.com', '(86) 96666-4321', 4, 'CLT'),
('Ana Lima', '838.892.493-10', 'ana@clinicavet.com', '(86) 97777-4321', 5, 'CLT');

-- =====================================================
-- CLIENTES E PETS
-- =====================================================
INSERT INTO clientes (nome, cpf, endereco, telefone) VALUES
('João Pereira', '111.222.333-44', 'Rua das Flores, 100', '(86) 98800-1234'),
('Maria Silva', '555.666.777-88', 'Av. Frei Serafim, 3000', '(86) 98700-4321'),
('Carla Oliveira', '999.888.777-66', 'Rua Coelho de Resende, 250', '(86) 98600-9999'),
('Pedro Santos', '444.333.222-11', 'Av. Presidente Kennedy, 900', '(86) 98555-6666');

INSERT INTO pets (nome, animal, idade, raca, peso, porte, sexo, id_cliente) VALUES
('Thor', 'Cachorro', 3, 'Golden Retriever', 25.5, 'Grande', 'M', 1),
('Mia', 'Gato', 2, 'Persa', 3.5, 'Pequeno', 'F', 1),
('Luna', 'Cachorro', 5, 'Poodle', 6.0, 'Pequeno', 'F', 2),
('Zeca', 'Cachorro', 1, 'SRD', 9.0, 'Médio', 'M', 2),
('Bento', 'Cachorro', 1, 'Shih-Tzu', 6.0, 'Pequeno', 'M', 3),
('Toby', 'Gato', 4, 'Siamês', 5.0, 'Pequeno', 'M', 4);

-- =====================================================
-- ESTOQUE E PRODUTOS
-- =====================================================
INSERT INTO estoque (localizacao, data_atualizacao) VALUES
('Depósito Central', NOW()),
('Balcão Principal', NOW());

INSERT INTO produtos (id_estoque, categoria, nome, preco, quantidade_estoque, descricao) VALUES
(1, 'Medicamento', 'Vermífugo Canino', 35.00, 50, 'Elimina vermes'),
(1, 'Vacina', 'Vacina V10', 70.00, 30, 'Protege contra múltiplas doenças'),
(2, 'Higiene', 'Shampoo Neutro', 25.00, 60, 'Para pele sensível'),
(2, 'Acessório', 'Coleira LED', 40.00, 15, 'Alta visibilidade noturna');

-- =====================================================
-- SERVIÇOS
-- =====================================================
INSERT INTO servicos (tipo_servico, preco, descricao) VALUES
('Consulta Veterinária', 80.00, 'Check-up completo'),
('Vacinação', 70.00, 'Aplicação de vacina V10'),
('Banho e Tosa', 55.00, 'Banho e tosa higiênica'),
('Cirurgia de Castração', 300.00, 'Cirurgia padrão'),
('Emergência Clínica', 150.00, 'Atendimento de urgência');

-- =====================================================
-- ATENDIMENTOS (via procedure)
-- =====================================================
CALL registrar_atendimento(1, 1, 1, 'Check-up geral', 'Recomendado vermífugo', 'Pet saudável');
CALL registrar_atendimento(2, 1, 2, 'Vacinação anual', 'Retornar em 12 meses', 'Sem reações');
CALL registrar_atendimento(3, 3, 3, 'Higienização completa', NULL, 'Pet tranquilo');
CALL registrar_atendimento(4, 2, 4, 'Castração com sucesso', 'Reposição de antibiótico', 'Recuperação boa');
CALL registrar_atendimento(5, 1, 5, 'Emergência por vômito', 'Soro e dieta leve', 'Estável');

-- =====================================================
-- PAGAMENTOS + ASSOCIAÇÕES (via procedures)
-- =====================================================
CALL criar_pagamento(1); -- João
CALL associar_atendimento_pagamento(1, 1);
CALL associar_pagamento_produto(1, 1, 2); -- Vermífugo

CALL criar_pagamento(2); -- João
CALL associar_atendimento_pagamento(2, 2);
CALL associar_pagamento_produto(2, 2, 1); -- Vacina

CALL criar_pagamento(3); -- Carla
CALL associar_atendimento_pagamento(3, 3);
CALL associar_pagamento_produto(3, 3, 1); -- Shampoo

CALL criar_pagamento(4); -- Maria
CALL associar_atendimento_pagamento(4, 4);

CALL criar_pagamento(5); -- Pedro
CALL associar_atendimento_pagamento(5, 5);
CALL associar_pagamento_produto(5, 4, 1); -- Coleira LED
