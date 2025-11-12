-- =====================================================
-- RESET TOTAL DO BANCO DE DADOS (CLÍNICA PETSHOP)
-- =====================================================
-- ⚠️ Este script apaga todos os dados, reinicia AUTO_INCREMENT
-- e mantém apenas a estrutura (tabelas, procedures, triggers, views).
-- Execute apenas em ambiente de testes!
-- =====================================================

USE clinica_petshop;

SET FOREIGN_KEY_CHECKS = 0;

-- -----------------------------------------------------
-- Limpa tabelas em ordem segura (sem violar FK)
-- -----------------------------------------------------
TRUNCATE TABLE historico_pagamentos;
TRUNCATE TABLE historico_estoque;
TRUNCATE TABLE historico_atendimentos;

TRUNCATE TABLE pagamento_produtos;
TRUNCATE TABLE pagamento_atendimentos;
TRUNCATE TABLE pagamentos;

TRUNCATE TABLE atendimentos;
TRUNCATE TABLE servicos;

TRUNCATE TABLE produtos;
TRUNCATE TABLE estoque;

TRUNCATE TABLE pets;
TRUNCATE TABLE clientes;

TRUNCATE TABLE funcionarios;
TRUNCATE TABLE cargos;

SET FOREIGN_KEY_CHECKS = 1;

-- -----------------------------------------------------
-- Reinicia AUTO_INCREMENT manualmente (garantia extra)
-- -----------------------------------------------------
ALTER TABLE cargos AUTO_INCREMENT = 1;
ALTER TABLE funcionarios AUTO_INCREMENT = 1;
ALTER TABLE clientes AUTO_INCREMENT = 1;
ALTER TABLE pets AUTO_INCREMENT = 1;
ALTER TABLE estoque AUTO_INCREMENT = 1;
ALTER TABLE produtos AUTO_INCREMENT = 1;
ALTER TABLE servicos AUTO_INCREMENT = 1;
ALTER TABLE atendimentos AUTO_INCREMENT = 1;
ALTER TABLE pagamentos AUTO_INCREMENT = 1;
ALTER TABLE pagamento_produtos AUTO_INCREMENT = 1;
ALTER TABLE pagamento_atendimentos AUTO_INCREMENT = 1;
ALTER TABLE historico_pagamentos AUTO_INCREMENT = 1;
ALTER TABLE historico_estoque AUTO_INCREMENT = 1;
ALTER TABLE historico_atendimentos AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Feedback visual
-- -----------------------------------------------------
SELECT 'Banco clinica_petshop resetado com sucesso!' AS status;

-- =====================================================
-- Fim do Script
-- =====================================================
