-- -----------------------------------------------------
-- VIEWS OPERACIONAIS
-- -----------------------------------------------------

-- visão geral dos atendimentos 
CREATE OR REPLACE VIEW v_atendimentos_detalhados AS
SELECT
  a.id_atendimento,
  c.nome AS cliente,
  p.nome AS pet,
  p.animal,
  f.nome AS funcionario,
  s.tipo_servico AS servico,
  s.preco,
  a.data_atendimento,
  a.diagnostico,
  a.receita,
  a.observacoes
FROM atendimentos a
JOIN pets p ON a.id_pet = p.id_pet
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN funcionarios f ON a.id_funcionario = f.id_funcionario
JOIN servicos s ON a.id_servico = s.id_servico;


-- Clientes ativos e quantidade de pets
CREATE OR REPLACE VIEW v_clientes_ativos AS
SELECT
  c.id_cliente,
  c.nome AS cliente,
  c.cpf,
  c.telefone,
  COUNT(p.id_pet) AS total_pets
FROM clientes c
LEFT JOIN pets p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome, c.cpf, c.telefone;


-- Atendimentos recentes (últimos 30 dias)
CREATE OR REPLACE VIEW v_atendimentos_recentes AS
SELECT
  a.id_atendimento,
  c.nome AS cliente,
  p.nome AS pet,
  f.nome AS funcionario,
  s.tipo_servico AS servico,
  a.data_atendimento,
  a.diagnostico,
  a.receita
FROM atendimentos a
JOIN pets p ON a.id_pet = p.id_pet
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN funcionarios f ON a.id_funcionario = f.id_funcionario
JOIN servicos s ON a.id_servico = s.id_servico
WHERE a.data_atendimento >= CURDATE() - INTERVAL 30 DAY;


-- Histórico consolidado de atendimentos e pagamentos
CREATE OR REPLACE VIEW v_historico_completo AS
SELECT
  c.nome AS cliente,
  p.nome AS pet,
  s.tipo_servico,
  a.data_atendimento,
  pg.status_pagamento,
  pg.valor_total,
  hp.data_alteracao AS ultima_alteracao_pagamento
FROM atendimentos a
JOIN pets p ON a.id_pet = p.id_pet
JOIN clientes c ON p.id_cliente = c.id_cliente
LEFT JOIN servicos s ON a.id_servico = s.id_servico
LEFT JOIN pagamento_atendimentos pa ON a.id_atendimento = pa.id_atendimento
LEFT JOIN pagamentos pg ON pa.id_pagamento = pg.id_pagamento
LEFT JOIN historico_pagamentos hp ON pg.id_pagamento = hp.id_pagamento;


-- Frequência de visitas por pet
CREATE OR REPLACE VIEW v_frequencia_visitas_pet AS
SELECT
  p.id_pet,
  p.nome AS pet,
  c.nome AS cliente,
  COUNT(a.id_atendimento) AS total_visitas
FROM atendimentos a
JOIN pets p ON a.id_pet = p.id_pet
JOIN clientes c ON p.id_cliente = c.id_cliente
GROUP BY p.id_pet, p.nome, c.nome
ORDER BY total_visitas DESC;


-- Ranking dos serviços mais realizados
CREATE OR REPLACE VIEW v_servicos_mais_usados AS
SELECT
  s.tipo_servico,
  COUNT(a.id_atendimento) AS total_atendimentos,
  SUM(s.preco) AS total_faturado
FROM atendimentos a
JOIN servicos s ON a.id_servico = s.id_servico
GROUP BY s.tipo_servico
ORDER BY total_atendimentos DESC;



-- -----------------------------------------------------
-- VIEWS DE PERFORMANCE
-- -----------------------------------------------------

-- pagamentos consolidados
CREATE OR REPLACE VIEW v_pagamentos_detalhados AS
SELECT
  pg.id_pagamento,
  c.nome AS cliente,
  pg.data_pagamento,
  pg.forma_pagamento,
  pg.status_pagamento,
  pg.valor_total,
  SUM(pp.quantidade * pr.preco) AS valor_produtos
FROM pagamentos pg
LEFT JOIN pagamento_produtos pp ON pg.id_pagamento = pp.id_pagamento
LEFT JOIN produtos pr ON pp.id_produto = pr.id_produto
JOIN clientes c ON pg.id_cliente = c.id_cliente
GROUP BY pg.id_pagamento, c.nome, pg.data_pagamento, pg.forma_pagamento, pg.status_pagamento, pg.valor_total;


-- produtividade de funcionários
CREATE OR REPLACE VIEW v_funcionarios_performance AS
SELECT
  f.id_funcionario,
  f.nome AS funcionario,
  COUNT(DISTINCT a.id_atendimento) AS total_atendimentos,
  COALESCE(SUM(pg.valor_total), 0) AS total_faturado
FROM funcionarios f
LEFT JOIN atendimentos a ON f.id_funcionario = a.id_funcionario
LEFT JOIN pagamento_atendimentos pa ON pa.id_atendimento = a.id_atendimento
LEFT JOIN pagamentos pg ON pg.id_pagamento = pa.id_pagamento
GROUP BY f.id_funcionario, f.nome;


-- Ranking de funcionários por número de atendimentos
CREATE OR REPLACE VIEW v_funcionarios_ranking AS
SELECT
  f.id_funcionario,
  f.nome AS funcionario,
  c.nome AS cargo,
  COUNT(a.id_atendimento) AS total_atendimentos
FROM funcionarios f
LEFT JOIN cargos c ON f.id_cargo = c.id_cargo
LEFT JOIN atendimentos a ON f.id_funcionario = a.id_funcionario
GROUP BY f.id_funcionario, f.nome, c.nome;


-- Faturamento mensal por serviço
CREATE OR REPLACE VIEW v_faturamento_servico_mensal AS
SELECT
  s.tipo_servico,
  DATE_FORMAT(pg.data_pagamento, '%Y-%m') AS mes,
  SUM(pg.valor_total) AS total_faturado,
  COUNT(pg.id_pagamento) AS total_pagamentos
FROM pagamentos pg
JOIN pagamento_atendimentos pa ON pa.id_pagamento = pg.id_pagamento
JOIN atendimentos a ON a.id_atendimento = pa.id_atendimento
JOIN servicos s ON a.id_servico = s.id_servico
GROUP BY s.tipo_servico, DATE_FORMAT(pg.data_pagamento, '%Y-%m');


-- Faturamento por funcionário
CREATE OR REPLACE VIEW v_faturamento_funcionario AS
SELECT
  f.nome AS funcionario,
  SUM(pg.valor_total) AS total_recebido,
  COUNT(pg.id_pagamento) AS qtd_atendimentos
FROM pagamentos pg
JOIN pagamento_atendimentos pa ON pa.id_pagamento = pg.id_pagamento
JOIN atendimentos a ON a.id_atendimento = pa.id_atendimento
JOIN funcionarios f ON a.id_funcionario = f.id_funcionario
GROUP BY f.nome;


-- Atendimentos agrupados por raça do pet
CREATE OR REPLACE VIEW v_atendimentos_por_raca AS
SELECT
  p.raca,
  COUNT(a.id_atendimento) AS total_atendimentos
FROM atendimentos a
JOIN pets p ON a.id_pet = p.id_pet
GROUP BY p.raca
ORDER BY total_atendimentos DESC;


-- Mostra todos os pagamentos ainda não finalizados.
CREATE OR REPLACE VIEW v_pagamentos_pendentes AS
SELECT
  pg.id_pagamento,
  c.nome AS cliente,
  pg.data_pagamento,
  pg.forma_pagamento,
  pg.valor_total
FROM pagamentos pg
JOIN clientes c ON pg.id_cliente = c.id_cliente
WHERE pg.status_pagamento = 'Pendente';



-- -----------------------------------------------------
-- VIEWS DE ESTOQUES
-- -----------------------------------------------------


-- Estoque geral
CREATE OR REPLACE VIEW v_estoque_completo AS
SELECT
  e.id_estoque,
  e.localizacao,
  p.id_produto,
  p.nome AS produto,
  p.categoria,
  p.quantidade_estoque,
  p.estoque_minimo,
  p.estoque_maximo,
  CASE
    WHEN p.quantidade_estoque < p.estoque_minimo THEN 'Baixo'
    WHEN p.quantidade_estoque > p.estoque_maximo THEN 'Excesso'
    ELSE 'Normal'
  END AS status_estoque,
  e.data_atualizacao
FROM produtos p
JOIN estoque e ON p.id_estoque = e.id_estoque;


-- Produtos com estoque baixo
CREATE OR REPLACE VIEW v_estoque_baixo AS
SELECT *
FROM v_estoque_completo
WHERE quantidade_estoque < estoque_minimo;
 

-- Produtos com excesso de estoque
CREATE OR REPLACE VIEW v_estoque_excesso AS
SELECT *
FROM v_estoque_completo
WHERE quantidade_estoque > estoque_maximo;


-- Produtos com estoque crítico
CREATE OR REPLACE VIEW v_estoque_critico AS
SELECT *
FROM v_estoque_completo
WHERE quantidade_estoque <= estoque_minimo + 2;


-- Estoque por categoria
CREATE OR REPLACE VIEW v_estoque_por_categoria AS
SELECT
  categoria,
  COUNT(id_produto) AS total_produtos,
  SUM(quantidade_estoque) AS total_itens,
  SUM(preco * quantidade_estoque) AS valor_total
FROM produtos
GROUP BY categoria;


-- Ranking de produtos mais vendidos
CREATE OR REPLACE VIEW v_produtos_mais_vendidos AS
SELECT
  pr.id_produto,
  pr.nome AS produto,
  SUM(pp.quantidade) AS total_vendido,
  SUM(pp.quantidade * pr.preco) AS faturamento_total
FROM pagamento_produtos pp
JOIN produtos pr ON pp.id_produto = pr.id_produto
GROUP BY pr.id_produto, pr.nome;



-- -----------------------------------------------------
-- VIEWS PARA ANÁLISE DE MERCADO
-- -----------------------------------------------------

-- Receita mensal total
CREATE OR REPLACE VIEW v_receita_mensal_total AS
SELECT
  DATE_FORMAT(pg.data_pagamento, '%Y-%m') AS mes,
  SUM(pg.valor_total) AS total_faturado,
  COUNT(pg.id_pagamento) AS total_pagamentos
FROM pagamentos pg
GROUP BY DATE_FORMAT(pg.data_pagamento, '%Y-%m');


-- Clientes que mais geram receita
CREATE OR REPLACE VIEW v_clientes_top AS
SELECT
  c.id_cliente,
  c.nome AS cliente,
  SUM(pg.valor_total) AS total_gasto,
  COUNT(pg.id_pagamento) AS total_pagamentos
FROM clientes c
JOIN pagamentos pg ON c.id_cliente = pg.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY total_gasto DESC
LIMIT 10;


-- Média de valor por atendimento
CREATE OR REPLACE VIEW v_media_valor_atendimento AS
SELECT
  s.tipo_servico,
  ROUND(AVG(pg.valor_total), 2) AS media_valor,
  COUNT(pg.id_pagamento) AS qtd
FROM pagamentos pg
JOIN pagamento_atendimentos pa ON pa.id_pagamento = pg.id_pagamento
JOIN atendimentos a ON a.id_atendimento = pa.id_atendimento
JOIN servicos s ON a.id_servico = s.id_servico
GROUP BY s.tipo_servico;

