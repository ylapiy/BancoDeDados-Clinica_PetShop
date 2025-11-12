-- =====================================================
-- POPULAÇÃO PESADA - CLÍNICA PETSHOP (Dados de Teste)
-- Gera massa de dados para testar procedures, triggers e views
-- ATENÇÃO: execute em um ambiente de testes.
-- =====================================================

USE clinica_petshop;
SET time_zone = '+00:00'; -- ajuste se quiser

-- -----------------------------------------------------
-- CARGOS
-- -----------------------------------------------------
CALL cadastrar_cargo('Veterinário Clínico', 'Clínica Geral', 'PI-10001');
CALL cadastrar_cargo('Veterinário Cirurgião', 'Cirurgias e Emergências', 'PI-10002');
CALL cadastrar_cargo('Tosador / Banho e Tosa', 'Higiene e Estética Animal', NULL);
CALL cadastrar_cargo('Atendente de Loja / Caixa', 'Vendas e Atendimento', NULL);
CALL cadastrar_cargo('Atendente de Recepção', 'Recepção e Agendamentos', NULL);
CALL cadastrar_cargo('Auxiliar de Veterinária', 'Suporte Clínico', NULL);

-- -----------------------------------------------------
-- FUNCIONÁRIOS (20)
-- -----------------------------------------------------
CALL cadastrar_funcionario('Rafael Duarte', '100.000.000-00', 'rafael.duarte@clinicavet.com', '(86) 99309-2824', 1, 'PJ');
CALL cadastrar_funcionario('Milena Menezes', '100.000.000-01', 'milena.menezes@clinicavet.com', '(86) 98501-4657', 2, 'CLT');
CALL cadastrar_funcionario('Carlos Souza', '100.000.000-02', 'carlos.souza@clinicavet.com', '(86) 99385-9935', 1, 'PJ');
CALL cadastrar_funcionario('Luciana Torres', '100.000.000-03', 'luciana.torres@clinicavet.com', '(86) 98065-1488', 1, 'CLT');
CALL cadastrar_funcionario('Tiago Almeida', '100.000.000-04', 'tiago.almeida@clinicavet.com', '(86) 98476-9279', 5, 'CLT');
CALL cadastrar_funcionario('Juliana Nunes', '100.000.000-05', 'juliana.nunes@clinicavet.com', '(86) 99149-4257', 6, 'PJ');
CALL cadastrar_funcionario('Amanda Ribeiro', '100.000.000-06', 'amanda.ribeiro@clinicavet.com', '(86) 98451-8359', 5, 'PJ');
CALL cadastrar_funcionario('Lucas Fernandes', '100.000.000-07', 'lucas.fernandes@clinicavet.com', '(86) 99657-1106', 2, 'PJ');
CALL cadastrar_funcionario('Ana Lima', '100.000.000-08', 'ana.lima@clinicavet.com', '(86) 98696-5552', 2, 'CLT');
CALL cadastrar_funcionario('Marcos Oliveira', '100.000.000-09', 'marcos.oliveira@clinicavet.com', '(86) 99960-6514', 1, 'CLT');
CALL cadastrar_funcionario('Paula Azevedo', '100.000.000-10', 'paula.azevedo@clinicavet.com', '(86) 98778-2584', 3, 'PJ');
CALL cadastrar_funcionario('Bruno Gomes', '100.000.000-11', 'bruno.gomes@clinicavet.com', '(86) 99236-5333', 1, 'PJ');
CALL cadastrar_funcionario('Larissa Carvalho', '100.000.000-12', 'larissa.carvalho@clinicavet.com', '(86) 99098-3045', 4, 'CLT');
CALL cadastrar_funcionario('Pedro Santos', '100.000.000-13', 'pedro.santos@clinicavet.com', '(86) 99130-5803', 6, 'PJ');
CALL cadastrar_funcionario('Fernanda Silva', '100.000.000-14', 'fernanda.silva@clinicavet.com', '(86) 99182-4150', 6, 'CLT');
CALL cadastrar_funcionario('João Batista', '100.000.000-15', 'joão.batista@clinicavet.com', '(86) 98093-4733', 3, 'CLT');
CALL cadastrar_funcionario('Camila Freitas', '100.000.000-16', 'camila.freitas@clinicavet.com', '(86) 99751-4814', 1, 'PJ');
CALL cadastrar_funcionario('Leandro Moura', '100.000.000-17', 'leandro.moura@clinicavet.com', '(86) 98569-8428', 6, 'PJ');
CALL cadastrar_funcionario('Sofia Barbosa', '100.000.000-18', 'sofia.barbosa@clinicavet.com', '(86) 98333-7065', 3, 'CLT');
CALL cadastrar_funcionario('Roberto Castro', '100.000.000-19', 'roberto.castro@clinicavet.com', '(86) 99372-5374', 6, 'CLT');

-- -----------------------------------------------------
-- CLIENTES (30)
-- -----------------------------------------------------
CALL cadastrar_cliente('João Cavalcante', '200.000.000-00', 'Rua Coelho de Resende, 2237', '(86) 99493-5010');
CALL cadastrar_cliente('Maria Almeida', '200.000.000-01', 'Rua da Paz, 1604', '(86) 98552-4598');
CALL cadastrar_cliente('Carla Araujo', '200.000.000-02', 'Rua das Flores, 988', '(86) 99683-1525');
CALL cadastrar_cliente('Pedro Araujo', '200.000.000-03', 'Av. João XXIII, 1146', '(86) 98135-4456');
CALL cadastrar_cliente('Luciana Rocha', '200.000.000-04', 'Rua Maranhão, 920', '(86) 99342-9179');
CALL cadastrar_cliente('Gustavo Castro', '200.000.000-05', 'Rua da Paz, 635', '(86) 98542-3287');
CALL cadastrar_cliente('Aline Gomes', '200.000.000-06', 'Av. Miguel Rosa, 2257', '(86) 98538-8019');
CALL cadastrar_cliente('Felipe Rocha', '200.000.000-07', 'Av. João XXIII, 1532', '(86) 98449-3266');
CALL cadastrar_cliente('Renata Ribeiro', '200.000.000-08', 'Rua da Paz, 422', '(86) 99547-1771');
CALL cadastrar_cliente('André Santos', '200.000.000-09', 'Rua Coelho de Resende, 2620', '(86) 98327-7916');
CALL cadastrar_cliente('Patrícia Cavalcante', '200.000.000-10', 'Av. Frei Serafim, 1626', '(86) 98781-8668');
CALL cadastrar_cliente('Diego Ribeiro', '200.000.000-11', 'Rua Piauí, 2316', '(86) 99762-1188');
CALL cadastrar_cliente('Bruna Santos', '200.000.000-12', 'Av. Miguel Rosa, 3125', '(86) 98546-6573');
CALL cadastrar_cliente('Rogério Santos', '200.000.000-13', 'Rua Piauí, 1830', '(86) 98323-8433');
CALL cadastrar_cliente('Isabela Pereira', '200.000.000-14', 'Rua Piauí, 2100', '(86) 99560-3927');
CALL cadastrar_cliente('Alex Ribeiro', '200.000.000-15', 'Av. Frei Serafim, 3615', '(86) 99280-5889');
CALL cadastrar_cliente('Natália Ribeiro', '200.000.000-16', 'Rua Goiás, 864', '(86) 98313-7126');
CALL cadastrar_cliente('Henrique Almeida', '200.000.000-17', 'Av. Miguel Rosa, 3955', '(86) 99594-9689');
CALL cadastrar_cliente('Letícia Pereira', '200.000.000-18', 'Rua Goiás, 1377', '(86) 99000-1319');
CALL cadastrar_cliente('Eduardo Santos', '200.000.000-19', 'Rua Maranhão, 3649', '(86) 99703-6038');
CALL cadastrar_cliente('Márcia Gomes', '200.000.000-20', 'Rua das Flores, 1036', '(86) 99798-2290');
CALL cadastrar_cliente('Fábio Oliveira', '200.000.000-21', 'Rua da Paz, 3392', '(86) 98141-9727');
CALL cadastrar_cliente('Bianca Lima', '200.000.000-22', 'Rua Coelho de Resende, 2752', '(86) 98973-3705');
CALL cadastrar_cliente('Marcelo Carvalho', '200.000.000-23', 'Av. Miguel Rosa, 3623', '(86) 99242-7932');
CALL cadastrar_cliente('Vanessa Souza', '200.000.000-24', 'Av. Miguel Rosa, 3143', '(86) 99494-4295');
CALL cadastrar_cliente('Hugo Moura', '200.000.000-25', 'Av. João XXIII, 2801', '(86) 99330-7118');
CALL cadastrar_cliente('Tatiane Torres', '200.000.000-26', 'Av. Miguel Rosa, 1899', '(86) 98247-5061');
CALL cadastrar_cliente('Rafael Gomes', '200.000.000-27', 'Av. Frei Serafim, 1434', '(86) 98043-4770');
CALL cadastrar_cliente('Nicole Rocha', '200.000.000-28', 'Av. Presidente Kennedy, 79', '(86) 98145-1964');
CALL cadastrar_cliente('Daniel Gomes', '200.000.000-29', 'Av. Frei Serafim, 3758', '(86) 98064-6413');

-- -----------------------------------------------------
-- ESTOQUE (3 locais)
-- -----------------------------------------------------
CALL cadastrar_estoque('Depósito Principal');
CALL cadastrar_estoque('Loja Frontal');
CALL cadastrar_estoque('Sala Procedimentos');

-- -----------------------------------------------------
-- PRODUTOS (20+)
-- -----------------------------------------------------
CALL cadastrar_produto(1, 'Medicamento', 'Vermífugo Canino', 35.00, 20, 'Elimina parasitas internos', 5, 40);
CALL cadastrar_produto(1, 'Vacina', 'Vacina Antirrábica', 70.00, 10, 'Vacina contra raiva', 3, 30);
CALL cadastrar_produto(2, 'Higiene', 'Shampoo Pet Neutro', 25.00, 40, 'Shampoo neutro p/ pets', 10, 100);
CALL cadastrar_produto(2, 'Brinquedo', 'Corda Interativa', 20.00, 25, 'Brinquedo resistente p/ cães', 5, 50);
CALL cadastrar_produto(2, 'Ração', 'Ração Premium 5kg', 90.00, 15, 'Ração premium cães adultos', 5, 25);
CALL cadastrar_produto(2, 'Acessório', 'Coleira LED', 45.00, 12, 'Coleira com iluminação', 3, 30);
CALL cadastrar_produto(2, 'Acessório', 'Guia Retrátil', 60.00, 8, 'Guia retrátil médio', 2, 20);
CALL cadastrar_produto(2, 'Higiene', 'Areia Sanitária 4kg', 22.00, 30, 'Areia p/ gatos', 10, 60);
CALL cadastrar_produto(1, 'Medicamento', 'Antibiótico 250mg', 58.90, 18, 'Uso veterinário', 5, 40);
CALL cadastrar_produto(1, 'Medicamento', 'Anti-inflamatório 200mg', 49.90, 22, 'Uso veterinário', 5, 40);
CALL cadastrar_produto(2, 'Ração', 'Ração Gatos 3kg', 65.00, 20, 'Ração premium gatos', 5, 30);
CALL cadastrar_produto(2, 'Brinquedo', 'Bola de Borracha', 15.00, 35, 'Brinquedo p/ roer', 10, 80);
CALL cadastrar_produto(2, 'Acessório', 'Bebedouro Portátil', 28.50, 16, 'Passeios e viagens', 5, 40);
CALL cadastrar_produto(2, 'Higiene', 'Lenço Umedecido', 18.00, 50, 'Higiene rápida', 10, 120);
CALL cadastrar_produto(1, 'Vacina', 'V8 Canina', 85.00, 12, 'Proteção múltipla', 3, 30);
CALL cadastrar_produto(1, 'Vacina', 'V5 Felina', 80.00, 9, 'Proteção felina', 3, 25);
CALL cadastrar_produto(1, 'Ração', 'Ração Light 10kg', 120.00, 10, 'Controle de peso', 3, 20);
CALL cadastrar_produto(2, 'Brinquedo', 'Pelúcia Anti-stress', 35.00, 14, 'Enriquecimento ambiental', 3, 30);
CALL cadastrar_produto(2, 'Acessório', 'Caminha Média', 110.00, 6, 'Conforto para pets', 1, 15);
CALL cadastrar_produto(2, 'Higiene', 'Escova Dental Pet', 19.90, 40, 'Higiene bucal', 10, 100);

-- -----------------------------------------------------
-- SERVIÇOS (8)
-- -----------------------------------------------------
CALL cadastrar_servico('Consulta Veterinária', 80.00, 'Avaliação clínica geral');
CALL cadastrar_servico('Vacinação', 70.00, 'Aplicação de vacinas');
CALL cadastrar_servico('Banho e Tosa', 50.00, 'Higiene e estética');
CALL cadastrar_servico('Cirurgia de Castração', 300.00, 'Procedimento cirúrgico');
CALL cadastrar_servico('Atendimento de Emergência', 150.00, 'Atendimento urgente');
CALL cadastrar_servico('Exames Laboratoriais', 120.00, 'Hemograma e bioquímica');
CALL cadastrar_servico('Ultrassonografia', 180.00, 'Imagem diagnóstica');
CALL cadastrar_servico('Raio-X', 160.00, 'Radiografia diagnóstica');

-- -----------------------------------------------------
-- PETS (50)
-- -----------------------------------------------------
CALL cadastrar_pet('Thor', 'Cachorro', 8, 'Golden Retriever', 11.9, 'Pequeno', 'M', 18);
CALL cadastrar_pet('Mia', 'Cachorro', 4, 'Bulldog', 21.4, 'Grande', 'F', 26);
CALL cadastrar_pet('Luna', 'Gato', 11, 'Siamês', 3.0, 'Pequeno', 'F', 12);
CALL cadastrar_pet('Zeca', 'Gato', 12, 'SRD', 5.1, 'Pequeno', 'M', 22);
CALL cadastrar_pet('Bento', 'Cachorro', 2, 'SRD', 26.3, 'Médio', 'M', 7);
CALL cadastrar_pet('Toby', 'Cachorro', 3, 'Golden Retriever', 7.5, 'Médio', 'F', 15);
CALL cadastrar_pet('Nina', 'Cachorro', 9, 'Beagle', 17.2, 'Pequeno', 'M', 2);
CALL cadastrar_pet('Bolt', 'Cachorro', 8, 'SRD', 8.3, 'Pequeno', 'F', 7);
CALL cadastrar_pet('Maggie', 'Gato', 1, 'Persa', 3.4, 'Pequeno', 'F', 9);
CALL cadastrar_pet('Simba', 'Gato', 12, 'Maine Coon', 4.8, 'Pequeno', 'F', 5);
CALL cadastrar_pet('Mel', 'Cachorro', 10, 'Shih-Tzu', 34.0, 'Pequeno', 'M', 24);
CALL cadastrar_pet('Bob', 'Gato', 8, 'Persa', 2.8, 'Pequeno', 'M', 2);
CALL cadastrar_pet('Lola', 'Cachorro', 2, 'Beagle', 5.2, 'Pequeno', 'M', 13);
CALL cadastrar_pet('Max', 'Cachorro', 1, 'Golden Retriever', 21.5, 'Pequeno', 'M', 14);
CALL cadastrar_pet('Duke', 'Gato', 12, 'Maine Coon', 3.6, 'Pequeno', 'F', 8);
CALL cadastrar_pet('Charlie', 'Gato', 11, 'SRD', 3.2, 'Pequeno', 'F', 15);
CALL cadastrar_pet('Bella', 'Gato', 10, 'Persa', 2.6, 'Pequeno', 'M', 3);
CALL cadastrar_pet('Sushi', 'Cachorro', 6, 'Golden Retriever', 7.2, 'Médio', 'M', 29);
CALL cadastrar_pet('Koda', 'Cachorro', 9, 'Shih-Tzu', 8.0, 'Médio', 'F', 20);
CALL cadastrar_pet('Pipoca', 'Cachorro', 11, 'Bulldog', 12.6, 'Grande', 'M', 29);
CALL cadastrar_pet('Fiona', 'Cachorro', 12, 'Shih-Tzu', 31.5, 'Pequeno', 'M', 9);
CALL cadastrar_pet('Boris', 'Gato', 6, 'Angorá', 3.7, 'Pequeno', 'M', 22);
CALL cadastrar_pet('Nala', 'Gato', 1, 'Angorá', 5.2, 'Pequeno', 'M', 21);
CALL cadastrar_pet('Zara', 'Gato', 6, 'Maine Coon', 2.7, 'Pequeno', 'M', 21);
CALL cadastrar_pet('Toddy', 'Gato', 9, 'Siamês', 6.6, 'Pequeno', 'F', 18);
CALL cadastrar_pet('Candy', 'Cachorro', 12, 'SRD', 33.2, 'Pequeno', 'M', 18);
CALL cadastrar_pet('Mike', 'Cachorro', 3, 'Beagle', 21.6, 'Médio', 'F', 5);
CALL cadastrar_pet('Batata', 'Cachorro', 1, 'Shih-Tzu', 31.8, 'Médio', 'F', 7);
CALL cadastrar_pet('Kiara', 'Cachorro', 9, 'Bulldog', 14.3, 'Pequeno', 'F', 20);
CALL cadastrar_pet('Lupin', 'Cachorro', 3, 'Poodle', 34.2, 'Pequeno', 'F', 1);
CALL cadastrar_pet('Frajola', 'Cachorro', 7, 'Bulldog', 28.0, 'Médio', 'M', 9);
CALL cadastrar_pet('Cacau', 'Cachorro', 1, 'Beagle', 6.5, 'Grande', 'F', 8);
CALL cadastrar_pet('Amora', 'Cachorro', 4, 'Beagle', 14.2, 'Médio', 'M', 1);
CALL cadastrar_pet('Bruce', 'Cachorro', 2, 'Labrador', 11.9, 'Médio', 'F', 12);
CALL cadastrar_pet('Mandy', 'Gato', 1, 'Angorá', 4.3, 'Pequeno', 'M', 29);
CALL cadastrar_pet('Spike', 'Gato', 5, 'Siamês', 5.7, 'Pequeno', 'M', 4);
CALL cadastrar_pet('Fred', 'Gato', 6, 'Maine Coon', 6.5, 'Pequeno', 'F', 20);
CALL cadastrar_pet('Lulu', 'Cachorro', 1, 'Labrador', 9.1, 'Grande', 'F', 1);
CALL cadastrar_pet('Pudim', 'Cachorro', 11, 'Shih-Tzu', 5.2, 'Médio', 'F', 20);
CALL cadastrar_pet('Milly', 'Gato', 5, 'Persa', 6.5, 'Pequeno', 'F', 22);
CALL cadastrar_pet('Romeu', 'Gato', 5, 'Maine Coon', 4.7, 'Pequeno', 'M', 7);
CALL cadastrar_pet('Jade', 'Gato', 3, 'SRD', 6.2, 'Pequeno', 'F', 13);
CALL cadastrar_pet('Bidu', 'Cachorro', 10, 'Shih-Tzu', 9.7, 'Médio', 'F', 15);
CALL cadastrar_pet('Sansa', 'Gato', 9, 'SRD', 6.2, 'Pequeno', 'F', 26);
CALL cadastrar_pet('Arya', 'Cachorro', 11, 'Bulldog', 12.1, 'Pequeno', 'F', 3);
CALL cadastrar_pet('Loki', 'Cachorro', 4, 'Bulldog', 10.2, 'Médio', 'M', 1);
CALL cadastrar_pet('Zeus', 'Cachorro', 2, 'Poodle', 22.6, 'Médio', 'F', 14);
CALL cadastrar_pet('Apolo', 'Cachorro', 7, 'Bulldog', 15.3, 'Grande', 'M', 5);
CALL cadastrar_pet('Pandora', 'Cachorro', 4, 'Beagle', 27.9, 'Pequeno', 'M', 26);
CALL cadastrar_pet('Ozzy', 'Gato', 2, 'Persa', 5.6, 'Pequeno', 'F', 5);

-- -----------------------------------------------------
-- ATENDIMENTOS (80) via procedure + ajuste de datas
-- -----------------------------------------------------
CALL registrar_atendimento(30, 17, 6, 'Diag 1: avaliação padrão', 'Receita 1: conforme necessidade', 'Obs 1: sem intercorrências');
CALL registrar_atendimento(49, 15, 7, 'Diag 2: avaliação padrão', 'Receita 2: conforme necessidade', 'Obs 2: sem intercorrências');
CALL registrar_atendimento(36, 15, 3, 'Diag 3: avaliação padrão', 'Receita 3: conforme necessidade', 'Obs 3: sem intercorrências');
CALL registrar_atendimento(48, 16, 8, 'Diag 4: avaliação padrão', 'Receita 4: conforme necessidade', 'Obs 4: sem intercorrências');
CALL registrar_atendimento(17, 8, 5, 'Diag 5: avaliação padrão', 'Receita 5: conforme necessidade', 'Obs 5: sem intercorrências');
CALL registrar_atendimento(50, 17, 8, 'Diag 6: avaliação padrão', 'Receita 6: conforme necessidade', 'Obs 6: sem intercorrências');
CALL registrar_atendimento(41, 8, 5, 'Diag 7: avaliação padrão', 'Receita 7: conforme necessidade', 'Obs 7: sem intercorrências');
CALL registrar_atendimento(29, 3, 5, 'Diag 8: avaliação padrão', 'Receita 8: conforme necessidade', 'Obs 8: sem intercorrências');
CALL registrar_atendimento(16, 9, 6, 'Diag 9: avaliação padrão', 'Receita 9: conforme necessidade', 'Obs 9: sem intercorrências');
CALL registrar_atendimento(21, 18, 2, 'Diag 10: avaliação padrão', 'Receita 10: conforme necessidade', 'Obs 10: sem intercorrências');
CALL registrar_atendimento(9, 5, 4, 'Diag 11: avaliação padrão', 'Receita 11: conforme necessidade', 'Obs 11: sem intercorrências');
CALL registrar_atendimento(25, 5, 4, 'Diag 12: avaliação padrão', 'Receita 12: conforme necessidade', 'Obs 12: sem intercorrências');
CALL registrar_atendimento(5, 14, 7, 'Diag 13: avaliação padrão', 'Receita 13: conforme necessidade', 'Obs 13: sem intercorrências');
CALL registrar_atendimento(22, 18, 8, 'Diag 14: avaliação padrão', 'Receita 14: conforme necessidade', 'Obs 14: sem intercorrências');
CALL registrar_atendimento(27, 2, 4, 'Diag 15: avaliação padrão', 'Receita 15: conforme necessidade', 'Obs 15: sem intercorrências');
CALL registrar_atendimento(27, 13, 1, 'Diag 16: avaliação padrão', 'Receita 16: conforme necessidade', 'Obs 16: sem intercorrências');
CALL registrar_atendimento(49, 19, 7, 'Diag 17: avaliação padrão', 'Receita 17: conforme necessidade', 'Obs 17: sem intercorrências');
CALL registrar_atendimento(31, 1, 6, 'Diag 18: avaliação padrão', 'Receita 18: conforme necessidade', 'Obs 18: sem intercorrências');
CALL registrar_atendimento(20, 13, 7, 'Diag 19: avaliação padrão', 'Receita 19: conforme necessidade', 'Obs 19: sem intercorrências');
CALL registrar_atendimento(35, 18, 4, 'Diag 20: avaliação padrão', 'Receita 20: conforme necessidade', 'Obs 20: sem intercorrências');
CALL registrar_atendimento(32, 8, 5, 'Diag 21: avaliação padrão', 'Receita 21: conforme necessidade', 'Obs 21: sem intercorrências');
CALL registrar_atendimento(28, 16, 1, 'Diag 22: avaliação padrão', 'Receita 22: conforme necessidade', 'Obs 22: sem intercorrências');
CALL registrar_atendimento(25, 11, 7, 'Diag 23: avaliação padrão', 'Receita 23: conforme necessidade', 'Obs 23: sem intercorrências');
CALL registrar_atendimento(47, 6, 8, 'Diag 24: avaliação padrão', 'Receita 24: conforme necessidade', 'Obs 24: sem intercorrências');
CALL registrar_atendimento(9, 20, 1, 'Diag 25: avaliação padrão', 'Receita 25: conforme necessidade', 'Obs 25: sem intercorrências');
CALL registrar_atendimento(26, 19, 1, 'Diag 26: avaliação padrão', 'Receita 26: conforme necessidade', 'Obs 26: sem intercorrências');
CALL registrar_atendimento(6, 14, 3, 'Diag 27: avaliação padrão', 'Receita 27: conforme necessidade', 'Obs 27: sem intercorrências');
CALL registrar_atendimento(30, 6, 1, 'Diag 28: avaliação padrão', 'Receita 28: conforme necessidade', 'Obs 28: sem intercorrências');
CALL registrar_atendimento(17, 13, 6, 'Diag 29: avaliação padrão', 'Receita 29: conforme necessidade', 'Obs 29: sem intercorrências');
CALL registrar_atendimento(14, 15, 6, 'Diag 30: avaliação padrão', 'Receita 30: conforme necessidade', 'Obs 30: sem intercorrências');
CALL registrar_atendimento(22, 13, 5, 'Diag 31: avaliação padrão', 'Receita 31: conforme necessidade', 'Obs 31: sem intercorrências');
CALL registrar_atendimento(49, 14, 5, 'Diag 32: avaliação padrão', 'Receita 32: conforme necessidade', 'Obs 32: sem intercorrências');
CALL registrar_atendimento(6, 16, 1, 'Diag 33: avaliação padrão', 'Receita 33: conforme necessidade', 'Obs 33: sem intercorrências');
CALL registrar_atendimento(48, 18, 1, 'Diag 34: avaliação padrão', 'Receita 34: conforme necessidade', 'Obs 34: sem intercorrências');
CALL registrar_atendimento(23, 8, 2, 'Diag 35: avaliação padrão', 'Receita 35: conforme necessidade', 'Obs 35: sem intercorrências');
CALL registrar_atendimento(50, 2, 1, 'Diag 36: avaliação padrão', 'Receita 36: conforme necessidade', 'Obs 36: sem intercorrências');
CALL registrar_atendimento(16, 7, 1, 'Diag 37: avaliação padrão', 'Receita 37: conforme necessidade', 'Obs 37: sem intercorrências');
CALL registrar_atendimento(40, 5, 4, 'Diag 38: avaliação padrão', 'Receita 38: conforme necessidade', 'Obs 38: sem intercorrências');
CALL registrar_atendimento(9, 16, 2, 'Diag 39: avaliação padrão', 'Receita 39: conforme necessidade', 'Obs 39: sem intercorrências');
CALL registrar_atendimento(37, 7, 8, 'Diag 40: avaliação padrão', 'Receita 40: conforme necessidade', 'Obs 40: sem intercorrências');
CALL registrar_atendimento(45, 9, 6, 'Diag 41: avaliação padrão', 'Receita 41: conforme necessidade', 'Obs 41: sem intercorrências');
CALL registrar_atendimento(11, 20, 2, 'Diag 42: avaliação padrão', 'Receita 42: conforme necessidade', 'Obs 42: sem intercorrências');
CALL registrar_atendimento(50, 6, 5, 'Diag 43: avaliação padrão', 'Receita 43: conforme necessidade', 'Obs 43: sem intercorrências');
CALL registrar_atendimento(7, 19, 1, 'Diag 44: avaliação padrão', 'Receita 44: conforme necessidade', 'Obs 44: sem intercorrências');
CALL registrar_atendimento(20, 19, 7, 'Diag 45: avaliação padrão', 'Receita 45: conforme necessidade', 'Obs 45: sem intercorrências');
CALL registrar_atendimento(26, 7, 2, 'Diag 46: avaliação padrão', 'Receita 46: conforme necessidade', 'Obs 46: sem intercorrências');
CALL registrar_atendimento(38, 8, 2, 'Diag 47: avaliação padrão', 'Receita 47: conforme necessidade', 'Obs 47: sem intercorrências');
CALL registrar_atendimento(45, 10, 2, 'Diag 48: avaliação padrão', 'Receita 48: conforme necessidade', 'Obs 48: sem intercorrências');
CALL registrar_atendimento(37, 2, 6, 'Diag 49: avaliação padrão', 'Receita 49: conforme necessidade', 'Obs 49: sem intercorrências');
CALL registrar_atendimento(35, 14, 6, 'Diag 50: avaliação padrão', 'Receita 50: conforme necessidade', 'Obs 50: sem intercorrências');
CALL registrar_atendimento(5, 17, 6, 'Diag 51: avaliação padrão', 'Receita 51: conforme necessidade', 'Obs 51: sem intercorrências');
CALL registrar_atendimento(1, 14, 8, 'Diag 52: avaliação padrão', 'Receita 52: conforme necessidade', 'Obs 52: sem intercorrências');
CALL registrar_atendimento(7, 14, 6, 'Diag 53: avaliação padrão', 'Receita 53: conforme necessidade', 'Obs 53: sem intercorrências');
CALL registrar_atendimento(41, 15, 3, 'Diag 54: avaliação padrão', 'Receita 54: conforme necessidade', 'Obs 54: sem intercorrências');
CALL registrar_atendimento(28, 6, 5, 'Diag 55: avaliação padrão', 'Receita 55: conforme necessidade', 'Obs 55: sem intercorrências');
CALL registrar_atendimento(40, 18, 8, 'Diag 56: avaliação padrão', 'Receita 56: conforme necessidade', 'Obs 56: sem intercorrências');
CALL registrar_atendimento(30, 14, 5, 'Diag 57: avaliação padrão', 'Receita 57: conforme necessidade', 'Obs 57: sem intercorrências');
CALL registrar_atendimento(21, 8, 2, 'Diag 58: avaliação padrão', 'Receita 58: conforme necessidade', 'Obs 58: sem intercorrências');
CALL registrar_atendimento(18, 15, 4, 'Diag 59: avaliação padrão', 'Receita 59: conforme necessidade', 'Obs 59: sem intercorrências');
CALL registrar_atendimento(49, 15, 7, 'Diag 60: avaliação padrão', 'Receita 60: conforme necessidade', 'Obs 60: sem intercorrências');
CALL registrar_atendimento(22, 1, 8, 'Diag 61: avaliação padrão', 'Receita 61: conforme necessidade', 'Obs 61: sem intercorrências');
CALL registrar_atendimento(21, 6, 8, 'Diag 62: avaliação padrão', 'Receita 62: conforme necessidade', 'Obs 62: sem intercorrências');
CALL registrar_atendimento(14, 12, 5, 'Diag 63: avaliação padrão', 'Receita 63: conforme necessidade', 'Obs 63: sem intercorrências');
CALL registrar_atendimento(22, 9, 5, 'Diag 64: avaliação padrão', 'Receita 64: conforme necessidade', 'Obs 64: sem intercorrências');
CALL registrar_atendimento(36, 1, 4, 'Diag 65: avaliação padrão', 'Receita 65: conforme necessidade', 'Obs 65: sem intercorrências');
CALL registrar_atendimento(6, 8, 7, 'Diag 66: avaliação padrão', 'Receita 66: conforme necessidade', 'Obs 66: sem intercorrências');
CALL registrar_atendimento(32, 18, 4, 'Diag 67: avaliação padrão', 'Receita 67: conforme necessidade', 'Obs 67: sem intercorrências');
CALL registrar_atendimento(45, 16, 8, 'Diag 68: avaliação padrão', 'Receita 68: conforme necessidade', 'Obs 68: sem intercorrências');
CALL registrar_atendimento(29, 1, 2, 'Diag 69: avaliação padrão', 'Receita 69: conforme necessidade', 'Obs 69: sem intercorrências');
CALL registrar_atendimento(19, 8, 7, 'Diag 70: avaliação padrão', 'Receita 70: conforme necessidade', 'Obs 70: sem intercorrências');
CALL registrar_atendimento(45, 8, 5, 'Diag 71: avaliação padrão', 'Receita 71: conforme necessidade', 'Obs 71: sem intercorrências');
CALL registrar_atendimento(43, 19, 6, 'Diag 72: avaliação padrão', 'Receita 72: conforme necessidade', 'Obs 72: sem intercorrências');
CALL registrar_atendimento(31, 18, 6, 'Diag 73: avaliação padrão', 'Receita 73: conforme necessidade', 'Obs 73: sem intercorrências');
CALL registrar_atendimento(28, 18, 6, 'Diag 74: avaliação padrão', 'Receita 74: conforme necessidade', 'Obs 74: sem intercorrências');
CALL registrar_atendimento(23, 15, 5, 'Diag 75: avaliação padrão', 'Receita 75: conforme necessidade', 'Obs 75: sem intercorrências');
CALL registrar_atendimento(20, 9, 4, 'Diag 76: avaliação padrão', 'Receita 76: conforme necessidade', 'Obs 76: sem intercorrências');
CALL registrar_atendimento(8, 7, 6, 'Diag 77: avaliação padrão', 'Receita 77: conforme necessidade', 'Obs 77: sem intercorrências');
CALL registrar_atendimento(8, 18, 3, 'Diag 78: avaliação padrão', 'Receita 78: conforme necessidade', 'Obs 78: sem intercorrências');
CALL registrar_atendimento(13, 7, 8, 'Diag 79: avaliação padrão', 'Receita 79: conforme necessidade', 'Obs 79: sem intercorrências');
CALL registrar_atendimento(18, 19, 5, 'Diag 80: avaliação padrão', 'Receita 80: conforme necessidade', 'Obs 80: sem intercorrências');

-- Ajusta datas dos atendimentos para testes históricos
SET @rownum := 0;

UPDATE atendimentos
JOIN (
  SELECT id_atendimento, (@rownum := @rownum + 1) AS rn
  FROM atendimentos
  ORDER BY id_atendimento
) t ON t.id_atendimento = atendimentos.id_atendimento
SET atendimentos.data_atendimento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL (rn*3) DAY);


-- -----------------------------------------------------
-- PAGAMENTOS (60) + associações
-- -----------------------------------------------------
SET @id_cliente := 4;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 38);
CALL associar_pagamento_produto(@id_pg, 12, 1);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 273 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 5;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 6);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 357 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 5;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 14);
CALL associar_atendimento_pagamento(@id_pg, 2);
CALL associar_pagamento_produto(@id_pg, 16, 2);
CALL associar_pagamento_produto(@id_pg, 15, 2);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 129 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 28;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 15);
CALL associar_atendimento_pagamento(@id_pg, 9);
CALL associar_pagamento_produto(@id_pg, 16, 1);
CALL associar_pagamento_produto(@id_pg, 19, 3);
CALL associar_pagamento_produto(@id_pg, 2, 1);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 43 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 8;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_pagamento_produto(@id_pg, 20, 3);
CALL associar_pagamento_produto(@id_pg, 20, 1);
CALL associar_pagamento_produto(@id_pg, 17, 2);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 152 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 28;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 40);
CALL associar_atendimento_pagamento(@id_pg, 73);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 106 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 21;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 34);
CALL confirmar_pagamento(@id_pg, 'Cartão', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 88 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 18;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_pagamento_produto(@id_pg, 1, 2);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 149 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 2;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 37);
CALL associar_pagamento_produto(@id_pg, 15, 1);
CALL associar_pagamento_produto(@id_pg, 8, 2);
CALL confirmar_pagamento(@id_pg, 'Cartão', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 217 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 4;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 20);
CALL associar_pagamento_produto(@id_pg, 5, 1);
CALL associar_pagamento_produto(@id_pg, 2, 1);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 224 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 4;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 39);
CALL associar_atendimento_pagamento(@id_pg, 52);
-- CASO DE ERRO PARA TESTE
-- CALL associar_pagamento_produto(@id_pg, 17, 3);
-- CALL associar_pagamento_produto(@id_pg, 16, 2);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 221 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 24;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 78);
CALL associar_pagamento_produto(@id_pg, 1, 1);
CALL associar_pagamento_produto(@id_pg, 8, 3);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 344 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 27;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 74);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 265 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 21;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 36);
CALL associar_atendimento_pagamento(@id_pg, 24);
-- CASO DE ERRO PARA TESTE
-- CALL associar_pagamento_produto(@id_pg, 16, 1);
-- CALL associar_pagamento_produto(@id_pg, 16, 2);
CALL associar_pagamento_produto(@id_pg, 14, 2);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 82 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 11;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 64);
CALL associar_atendimento_pagamento(@id_pg, 37);
CALL associar_pagamento_produto(@id_pg, 18, 1);
CALL associar_pagamento_produto(@id_pg, 15, 1);
CALL associar_pagamento_produto(@id_pg, 11, 2);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 206 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 28;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_pagamento_produto(@id_pg, 14, 1);
-- CASO DE ERRO PARA TESTE
-- CALL associar_pagamento_produto(@id_pg, 7, 3);
CALL associar_pagamento_produto(@id_pg, 12, 3);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 26 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 7;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 71);
CALL associar_pagamento_produto(@id_pg, 10, 2);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 62 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 1;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 21);
CALL associar_pagamento_produto(@id_pg, 18, 1);
CALL associar_pagamento_produto(@id_pg, 18, 2);
CALL confirmar_pagamento(@id_pg, 'Cartão', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 58 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 15;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
-- CASO DE ERRO PARA TESTE
-- CALL associar_pagamento_produto(@id_pg, 16, 3);
-- CALL confirmar_pagamento(@id_pg, 'Pix', 'Pendente');
-- UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 212 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 27;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 61);
CALL associar_atendimento_pagamento(@id_pg, 32);
CALL associar_pagamento_produto(@id_pg, 18, 1);
CALL associar_pagamento_produto(@id_pg, 13, 1);
CALL associar_pagamento_produto(@id_pg, 20, 3);
CALL confirmar_pagamento(@id_pg, 'Cartão', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 35 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 9;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 44);
CALL associar_atendimento_pagamento(@id_pg, 65);
CALL associar_pagamento_produto(@id_pg, 1, 2);
CALL associar_pagamento_produto(@id_pg, 10, 3);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 76 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 15;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 45);
CALL associar_atendimento_pagamento(@id_pg, 43);
CALL associar_pagamento_produto(@id_pg, 15, 2);
CALL associar_pagamento_produto(@id_pg, 7, 3);
CALL associar_pagamento_produto(@id_pg, 8, 3);
CALL confirmar_pagamento(@id_pg, 'Cartão', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 210 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 2;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 61);
CALL associar_pagamento_produto(@id_pg, 13, 3);
CALL associar_pagamento_produto(@id_pg, 5, 2);
CALL associar_pagamento_produto(@id_pg, 2, 1);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 51 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 28;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 13);
CALL associar_atendimento_pagamento(@id_pg, 68);
CALL associar_pagamento_produto(@id_pg, 1, 3);
CALL associar_pagamento_produto(@id_pg, 5, 2);
CALL associar_pagamento_produto(@id_pg, 5, 1);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 173 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 20;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 11);
CALL associar_atendimento_pagamento(@id_pg, 43);
CALL associar_pagamento_produto(@id_pg, 11, 3);
-- CASO DE ERRO PARA TESTE
-- CALL associar_pagamento_produto(@id_pg, 16, 3);
CALL associar_pagamento_produto(@id_pg, 2, 3);
CALL confirmar_pagamento(@id_pg, 'Cartão', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 323 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 22;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 30);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 324 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 23;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_pagamento_produto(@id_pg, 6, 3);
CALL associar_pagamento_produto(@id_pg, 10, 1);
CALL associar_pagamento_produto(@id_pg, 2, 2);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 183 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 12;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 19);
CALL associar_atendimento_pagamento(@id_pg, 32);
CALL associar_pagamento_produto(@id_pg, 19, 3);
CALL associar_pagamento_produto(@id_pg, 6, 1);
CALL associar_pagamento_produto(@id_pg, 6, 1);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 317 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 22;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 64);
CALL associar_pagamento_produto(@id_pg, 8, 2);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 235 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 9;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_pagamento_produto(@id_pg, 10, 3);
CALL associar_pagamento_produto(@id_pg, 18, 1);
CALL associar_pagamento_produto(@id_pg, 3, 2);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 327 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 14;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 59);
CALL associar_pagamento_produto(@id_pg, 7, 2);
CALL associar_pagamento_produto(@id_pg, 16, 1);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 292 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 12;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 38);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 140 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 1;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_pagamento_produto(@id_pg, 10, 1);
CALL associar_pagamento_produto(@id_pg, 20, 2);
CALL associar_pagamento_produto(@id_pg, 8, 3);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 347 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 25;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 13);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 17 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 19;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 17);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 212 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 6;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 17);
CALL associar_pagamento_produto(@id_pg, 17, 3);
CALL associar_pagamento_produto(@id_pg, 9, 1);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 151 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 24;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 15);
CALL associar_pagamento_produto(@id_pg, 3, 1);
CALL associar_pagamento_produto(@id_pg, 8, 3);
CALL associar_pagamento_produto(@id_pg, 13, 3);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 202 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 1;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 69);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 344 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 24;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 75);
CALL associar_pagamento_produto(@id_pg, 12, 1);
CALL associar_pagamento_produto(@id_pg, 8, 2);
CALL associar_pagamento_produto(@id_pg, 1, 3);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 312 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 8;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_pagamento_produto(@id_pg, 10, 3);
CALL associar_pagamento_produto(@id_pg, 14, 1);
CALL associar_pagamento_produto(@id_pg, 5, 1);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 252 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 4;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_pagamento_produto(@id_pg, 18, 1);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 189 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 22;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 76);
CALL associar_atendimento_pagamento(@id_pg, 20);
CALL associar_pagamento_produto(@id_pg, 4, 2);
CALL associar_pagamento_produto(@id_pg, 20, 2);
CALL associar_pagamento_produto(@id_pg, 9, 1);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 111 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 15;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 31);
CALL associar_atendimento_pagamento(@id_pg, 47);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 278 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 29;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 8);
CALL associar_pagamento_produto(@id_pg, 9, 1);
CALL associar_pagamento_produto(@id_pg, 4, 2);
CALL associar_pagamento_produto(@id_pg, 3, 3);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 25 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 26;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 32);
-- CASO DE ERRO PARA TESTE
-- CALL associar_pagamento_produto(@id_pg, 19, 1);
CALL confirmar_pagamento(@id_pg, 'Cartão', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 300 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 7;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 43);
CALL associar_pagamento_produto(@id_pg, 20, 1);
CALL confirmar_pagamento(@id_pg, 'Cartão', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 66 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 18;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 23);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 67 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 1;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 31);
CALL associar_pagamento_produto(@id_pg, 1, 1);
CALL associar_pagamento_produto(@id_pg, 9, 1);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 269 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 4;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_pagamento_produto(@id_pg, 15, 2);
CALL associar_pagamento_produto(@id_pg, 17, 3);
CALL associar_pagamento_produto(@id_pg, 4, 2);
CALL confirmar_pagamento(@id_pg, 'Cartão', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 314 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 2;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 59);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 205 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 14;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_pagamento_produto(@id_pg, 15, 1);
CALL associar_pagamento_produto(@id_pg, 3, 2);
CALL associar_pagamento_produto(@id_pg, 20, 1);
CALL confirmar_pagamento(@id_pg, 'Cartão', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 140 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 20;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 49);
CALL associar_pagamento_produto(@id_pg, 15, 3);
CALL associar_pagamento_produto(@id_pg, 20, 2);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 335 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 21;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 56);
CALL associar_pagamento_produto(@id_pg, 8, 2);
CALL associar_pagamento_produto(@id_pg, 11, 2);
CALL associar_pagamento_produto(@id_pg, 13, 2);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 160 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 14;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 33);
CALL associar_pagamento_produto(@id_pg, 5, 3);
CALL associar_pagamento_produto(@id_pg, 16, 1);
CALL confirmar_pagamento(@id_pg, 'Dinheiro', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 47 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 14;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_pagamento_produto(@id_pg, 5, 3);
-- CASO DE ERRO PARA TESTE
-- CALL associar_pagamento_produto(@id_pg, 2, 3);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Cancelado');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 343 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 4;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 46);
CALL associar_atendimento_pagamento(@id_pg, 55);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 180 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 4;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 20);
CALL associar_pagamento_produto(@id_pg, 8, 1);
CALL associar_pagamento_produto(@id_pg, 12, 3);
CALL associar_pagamento_produto(@id_pg, 12, 1);
CALL confirmar_pagamento(@id_pg, 'Cartão', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 219 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 28;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_pagamento_produto(@id_pg, 1, 1);
CALL associar_pagamento_produto(@id_pg, 9, 3);
CALL confirmar_pagamento(@id_pg, 'Pix', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 179 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 1;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 19);
CALL associar_pagamento_produto(@id_pg, 3, 1);
CALL associar_pagamento_produto(@id_pg, 1, 1);
CALL associar_pagamento_produto(@id_pg, 17, 1);
CALL confirmar_pagamento(@id_pg, 'Outro', 'Pendente');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 232 DAY) WHERE id_pagamento = @id_pg;

SET @id_cliente := 11;
CALL criar_pagamento(@id_cliente);

SELECT id_pagamento INTO @id_pg
FROM Pagamentos
WHERE id_cliente = @id_cliente
ORDER BY id_pagamento DESC
LIMIT 1;
CALL associar_atendimento_pagamento(@id_pg, 48);
CALL associar_pagamento_produto(@id_pg, 11, 3);
CALL associar_pagamento_produto(@id_pg, 20, 1);
CALL confirmar_pagamento(@id_pg, 'Cartão', 'Pago');
UPDATE pagamentos SET data_pagamento = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 80 DAY) WHERE id_pagamento = @id_pg;

-- -----------------------------------------------------
-- REPOSIÇÕES DE ESTOQUE (gera histórico e atualiza datas)
-- -----------------------------------------------------
CALL repor_estoque(20, 1);
CALL repor_estoque(3, 5);
CALL repor_estoque(15, 11);
CALL repor_estoque(14, 8);
CALL repor_estoque(20, 8);
CALL repor_estoque(14, 5);
CALL repor_estoque(7, 13);
CALL repor_estoque(17, 2);
CALL repor_estoque(12, 7);
CALL repor_estoque(4, 5);
CALL repor_estoque(19, 8);
CALL repor_estoque(17, 11);
CALL repor_estoque(10, 1);
CALL repor_estoque(8, 7);
CALL repor_estoque(20, 1);
CALL repor_estoque(1, 4);
CALL repor_estoque(10, 4);
CALL repor_estoque(5, 13);
CALL repor_estoque(9, 5);
CALL repor_estoque(11, 2);
CALL repor_estoque(1, 8);
CALL repor_estoque(14, 3);
CALL repor_estoque(5, 7);
CALL repor_estoque(18, 12);
CALL repor_estoque(8, 9);
CALL repor_estoque(18, 14);
CALL repor_estoque(12, 2);
CALL repor_estoque(13, 14);
CALL repor_estoque(2, 7);
CALL repor_estoque(1, 8);

-- -----------------------------------------------------
-- AJUSTES temporais: espalha datas em historico_pagamentos e historico_estoque
-- -----------------------------------------------------

UPDATE historico_pagamentos hp
JOIN pagamentos pg ON pg.id_pagamento = hp.id_pagamento
SET hp.data_alteracao = pg.data_pagamento - INTERVAL FLOOR(RAND()*3) DAY;


UPDATE historico_estoque he
JOIN produtos p ON p.id_produto = he.id_produto
JOIN estoque e ON e.id_estoque = p.id_estoque
SET he.data_movimentacao = e.data_atualizacao - INTERVAL FLOOR(RAND()*5) DAY
WHERE he.data_movimentacao IS NOT NULL;
