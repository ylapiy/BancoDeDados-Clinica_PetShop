-- desativa restrições temporariamente
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE Pagamento_Produtos;
TRUNCATE TABLE Historico_Pagamentos;
TRUNCATE TABLE Pagamentos;
TRUNCATE TABLE Historico_Atendimentos;
TRUNCATE TABLE Atendimentos;
TRUNCATE TABLE Produtos;
TRUNCATE TABLE Estoque;
TRUNCATE TABLE Servicos;
TRUNCATE TABLE Funcionarios;
TRUNCATE TABLE Cargos;
TRUNCATE TABLE Pets;
TRUNCATE TABLE Clientes;

-- reativa restrições
SET FOREIGN_KEY_CHECKS = 1;
