README — Scooby Petshop: Clínica & PetShop (Banco de Dados Completo)

Autores:

- Kaielly Vitória Sousa De Morais
- Mateus Farias Dos Santos
- Vinícius Azevedo Da Fonseca
- Ygor Jivago Leal Félix

Projeto: Sistema de Gestão de Clínica Veterinária
Banco: clinica_petshop
Versão: Final — pronta pra execução
Depedencias : mysql.connector

⚙️ SEQUÊNCIA DE EXECUÇÃO (ORDENADA)

1️⃣ script_db_petshop.sql

Cria o banco de dados, tabelas e relacionamentos principais.
⚠️ Deve ser o primeiro a ser executado.

2️⃣ script_procedures_crud_completo.sql

Procedures de CRUD (cadastrar, buscar, listar, atualizar e remover)
para todas as entidades principais: Clientes, Pets, Cargos, Funcionários, Produtos, Serviços e Estoques.

3️⃣ script_procedures_gerenciamento_petshop.sql

Procedures de controle de histórico, pagamentos, atendimentos, associações e relatórios específicos.

4️⃣ script_procedures_visualizacao_petshop.sql

Procedures auxiliares e relatórios de consultas complexas
(ex: histórico de cliente, serviços por pet, atendimentos por funcionário, etc).

5️⃣ script_triggers_petshop.sql

Cria os triggers automáticos que atualizam histórico, estoque e valores de pagamento
(inclui triggers de atualização, inserção e recalculagem de totais).

6️⃣ script_views_petshop.sql

Cria todas as views analíticas e de visualização geral do sistema
(ex: faturamento mensal, estoque crítico, top clientes...).

7️⃣ popular_clinica_petshop_ajustado.sql

Popula o banco com uma grande massa de dados de teste -
incluindo clientes, pets, funcionários, produtos, serviços, atendimentos e pagamentos simulados.

8️⃣ test_views_selects.sql

Script de teste que executa SELECT em todas as views,
confirmando se o sistema está funcionando corretamente.

9️⃣ reset.sql (opcional)

Limpa todas as tabelas e redefine IDs -
útil pra reiniciar o banco e popular novamente com novos dados de teste.
