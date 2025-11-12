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
WHERE a.data_atendimento >= CURDATE() - INTERVAL 30 DAY
ORDER BY a.data_atendimento DESC;


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
  
  -- Total de produtos no pagamento
  (
    SELECT SUM(pp.quantidade * pr.preco)
    FROM pagamento_produtos pp
    JOIN produtos pr ON pr.id_produto = pp.id_produto
    WHERE pp.id_pagamento = pg.id_pagamento
  ) AS valor_produtos,

  -- Total de atendimentos no pagamento
  (
    SELECT SUM(s.preco)
    FROM pagamento_atendimentos pa
    JOIN atendimentos a ON a.id_atendimento = pa.id_atendimento
    JOIN servicos s ON s.id_servico = a.id_servico
    WHERE pa.id_pagamento = pg.id_pagamento
  ) AS valor_atendimentos

FROM pagamentos pg
JOIN clientes c ON pg.id_cliente = c.id_cliente
ORDER BY pg.id_pagamento;



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
GROUP BY f.id_funcionario, f.nome
ORDER BY total_faturado DESC;


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
GROUP BY f.id_funcionario, f.nome, c.nome
ORDER BY total_atendimentos DESC;


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
GROUP BY s.tipo_servico, DATE_FORMAT(pg.data_pagamento, '%Y-%m')
ORDER BY mes DESC;


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
GROUP BY f.nome
ORDER BY total_recebido DESC;


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


-- Histórico de Pagamentos
CREATE OR REPLACE VIEW v_historico_pagamentos AS
SELECT
    hp.id_historico AS id_historico_pagamento,
    pg.id_pagamento,
    c.nome AS cliente,
    pg.status_pagamento,
    pg.forma_pagamento,
    pg.valor_total,
    hp.status_pagamento AS status_anterior,
    hp.valor_pago,
    hp.data_pagamento,
    hp.data_alteracao,
    hp.observacoes
FROM historico_pagamentos hp
JOIN pagamentos pg ON hp.id_pagamento = pg.id_pagamento
LEFT JOIN clientes c ON pg.id_cliente = c.id_cliente
ORDER BY hp.data_alteracao DESC;


-- Histórico de Atendimentos
CREATE OR REPLACE VIEW v_historico_atendimentos AS
SELECT
    ha.id_historico AS id_historico_atendimento,
    a.id_atendimento,
    c.nome AS cliente,
    p.nome AS pet,
    s.tipo_servico AS servico,
    f.nome AS funcionario,
    ha.diagnostico,
    ha.receita,
    ha.observacoes,
    ha.data_alteracao
FROM historico_atendimentos ha
JOIN atendimentos a ON ha.id_atendimento = a.id_atendimento
JOIN pets p ON a.id_pet = p.id_pet
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN servicos s ON a.id_servico = s.id_servico
JOIN funcionarios f ON a.id_funcionario = f.id_funcionario
ORDER BY ha.data_alteracao DESC;



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
GROUP BY categoria
ORDER BY categoria ASC;


-- Ranking de produtos mais vendidos
CREATE OR REPLACE VIEW v_produtos_mais_vendidos AS
SELECT
  pr.id_produto,
  pr.nome AS produto,
  SUM(pp.quantidade) AS total_vendido,
  SUM(pp.quantidade * pr.preco) AS faturamento_total
FROM pagamento_produtos pp
JOIN produtos pr ON pp.id_produto = pr.id_produto
GROUP BY pr.id_produto, pr.nome
ORDER BY total_vendido DESC;


-- Histórico de Estoque
CREATE OR REPLACE VIEW v_historico_estoque AS
SELECT
    he.id_historico AS id_historico_estoque,
    p.id_produto,
    p.nome AS produto,
    e.localizacao AS local_estoque,
    he.tipo_movimentacao,
    he.quantidade,
    he.observacao,
    he.data_movimentacao
FROM historico_estoque he
JOIN produtos p ON he.id_produto = p.id_produto
LEFT JOIN estoque e ON p.id_estoque = e.id_estoque
ORDER BY he.data_movimentacao DESC;



-- -----------------------------------------------------
-- VIEWS PARA ANÁLISE DE MERCADO
-- -----------------------------------------------------

-- Receita mensal total
CREATE OR REPLACE VIEW v_receita_mensal_total AS
SELECT
  DATE_FORMAT(pg.data_pagamento, '%Y-%m') AS mes,
  SUM(pg.valor_total) AS total_faturado,
  COUNT(pg.id_pagamento) AS total_pagamentos,
  SUM(CASE WHEN pg.status_pagamento = 'Pago' THEN 1 ELSE 0 END) AS qtd_pagos,
  SUM(CASE WHEN pg.status_pagamento = 'Pendente' THEN 1 ELSE 0 END) AS qtd_pendentes,
  SUM(CASE WHEN pg.status_pagamento = 'Cancelado' THEN 1 ELSE 0 END) AS qtd_cancelados

FROM pagamentos pg
GROUP BY DATE_FORMAT(pg.data_pagamento, '%Y-%m')
ORDER BY mes DESC;


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
GROUP BY s.tipo_servico
ORDER BY s.tipo_servico ASC;

