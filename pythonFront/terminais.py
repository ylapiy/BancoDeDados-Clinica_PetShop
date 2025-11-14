from concecao import *
import os


def pedirNumero():
    print("Digite o número para continuar")
    saida = int(input())
    return saida


def limpar():
    os.system("cls")


def pausar():
    os.system("pause")


# ----------------------------------------------------------------------------------------


def menu_principal():
    print("\n" + "=" * 80)
    print("🐾 SISTEMA DE GESTÃO PETSHOP - MENU PRINCIPAL")
    print("=" * 80)
    print("1. Clientes e Pets")
    print("2. Funcionários e Cargos")
    print("3. Produtos e Estoque")
    print("4. Atendimentos e Serviços")
    print("5. Pagamentos e Relatórios Financeiros")
    print("6. Visualizações de Historico")
    print("7. SQL Querry")
    print("0. Sair")
    print("=" * 80)

    match pedirNumero():
        case 1:
            limpar(), clientes_pets()
        case 2:
            limpar(), funcionarios_cargos()
        case 3:
            limpar(), produtos_estoque()
        case 4:
            limpar(), atendimentos_servicos()
        case 5:
            limpar(), pagamentos_relatorios()
        case 6:
            limpar(), visualizacoes_historicos()
        case 7:
            limpar(), executar_query_personalizada(), pausar(), limpar(), menu_principal()
        case 0:
            limpar()
            return
        case _:
            print("⚠️  Opção inválida.")
            menu_principal()


# ----------------------------------------------------------------------------------------


def clientes_pets():
    print("\n" + "=" * 80)
    print("🐾 GESTÃO DE CLIENTES E PETS")
    print("=" * 80)
    print("1. Cadastrar Cliente")
    print("2. Listar Clientes")
    print("3. Listar Clientes Tops")
    print("4. Remover Cliente")
    print("5. Atualizar Cliente")
    print("6. Buscar Cliente por ID")
    print("7. Cadastrar Pet")
    print("8. Listar Pets")
    print("9. Remover Pet")
    print("10. Atualizar Pet")
    print("11. Buscar Pet por ID")
    print("12. Frequancia de Visitas")
    print("0. Voltar ao Menu Principal")
    print("=" * 80)

    match pedirNumero():
        case 1:
            limpar(), cadastrar_cliente(), clientes_pets()
        case 2:
            limpar(), exibir_view("v_clientes_ativos"), pausar(), clientes_pets()
        case 3:
            limpar(), exibir_view("v_clientes_top"), pausar(), clientes_pets()
        case 4:
            limpar(), remover_cliente(), clientes_pets()
        case 5:
            limpar(), atualizar_cliente(), clientes_pets()
        case 6:
            limpar(), buscar_cliente_por_id(), clientes_pets()
        case 7:
            limpar(), cadastrar_pet(), clientes_pets()
        case 8:
            limpar(), listar_pets(), clientes_pets()
        case 9:
            limpar(), remover_pet(), clientes_pets()
        case 10:
            limpar(), atualizar_pet(), clientes_pets()
        case 11:
            limpar(), buscar_pet_por_id(), clientes_pets()
        case 12:
            limpar(), exibir_view("v_frequencia_visitas_pet"), pausar(), clientes_pets()
        case 0:
            limpar(), menu_principal()
        case _:
            print("⚠ Opção inválida.")
            clientes_pets()


# -----------------------------------------------------------------------------------------


def funcionarios_cargos():
    print("\n" + "=" * 80)
    print("🐾 GESTÃO DE FUNCIONÁRIOS E CARGOS")
    print("=" * 80)
    print("1. Cadastrar Cargo")
    print("2. Listar Cargos")
    print("3. Remover Cargo")
    print("4. Atualizar Cargo")
    print("5. Buscar Cargo por ID")
    print("6. Cadastrar Funcionário")
    print("7. Atualizar Funcionário")
    print("7. Listar Funcionários")
    print("8. Remover Funcionário")
    print("9. Buscar Funcionário por ID")
    print("10. Performance Funcionarios")
    print("11. Ranking Funcionarios")
    print("0. Voltar ao Menu Principal")
    print("=" * 80)

    match pedirNumero():
        case 1:
            limpar(), cadastrar_cargo(), funcionarios_cargos()
        case 2:
            limpar(), listar_cargos(), funcionarios_cargos()
        case 3:
            limpar(), remover_cargo(), funcionarios_cargos()
        case 4:
            limpar(), atualizar_cargo(), funcionarios_cargos()
        case 5:
            limpar(), buscar_cargo_por_id(), funcionarios_cargos()
        case 6:
            limpar(), cadastrar_funcionario(), funcionarios_cargos()
        case 7:
            limpar(), listar_funcionarios(), funcionarios_cargos()
        case 8:
            limpar(), remover_funcionario(), funcionarios_cargos()
        case 9:
            limpar(), buscar_funcionario_por_id(), funcionarios_cargos()
        case 10:
            limpar(), exibir_view(
                "v_funcionarios_performance"
            ), pausar(), funcionarios_cargos()
        case 11:
            limpar(), exibir_view(
                "v_funcionarios_ranking"
            ), pausar(), funcionarios_cargos()
        case 0:
            limpar(), menu_principal()
        case _:
            print("⚠ Opção inválida.")
            funcionarios_cargos()


# ------------------------------------------------------------------------------------------


def produtos_estoque():
    print("\n" + "=" * 80)
    print("🐾 GESTÃO DE PRODUTOS E ESTOQUE")
    print("=" * 80)
    print("1. Cadastrar Produto")
    print("2. Listar Produtos")
    print("3. Remover Produto")
    print("4. Atualizar Produto")
    print("5. Buscar Produto por ID")
    print("6. Repor Estoque")
    print("7. Listar Estoques")
    print("8. Listar Estoque baixo")
    print("9. Listar Estoques critico")
    print("10. Listar Estoques excesso")
    print("11. Listar Estoques por categoria")
    print("12. Remover Estoque")
    print("13. Buscar Estoque por ID")
    print("0. Voltar ao Menu Principal")
    print("=" * 80)

    match pedirNumero():
        case 1:
            limpar(), cadastrar_produto(), produtos_estoque()
        case 2:
            limpar(), listar_produtos(), produtos_estoque()
        case 3:
            limpar(), remover_produto(), produtos_estoque()
        case 4:
            limpar(), atualizar_produto(), produtos_estoque()
        case 5:
            limpar(), buscar_produto_por_id(), produtos_estoque()
        case 6:
            limpar(), repor_estoque(), produtos_estoque()
        case 7:
            limpar(), exibir_view("v_estoque_completo"), pausar(), produtos_estoque()
        case 8:
            limpar(), exibir_view("v_estoque_baixo"), pausar(), produtos_estoque()
        case 9:
            limpar(), exibir_view("v_estoque_critico"), pausar(), produtos_estoque()
        case 10:
            limpar(), exibir_view("v_estoque_excesso"), pausar(), produtos_estoque()
        case 11:
            limpar(), exibir_view(
                "v_estoque_por_categoria"
            ), pausar(), produtos_estoque()
        case 12:
            limpar(), remover_estoque(), produtos_estoque()
        case 13:
            limpar(), buscar_estoque_por_id(), produtos_estoque()
        case 0:
            limpar(), menu_principal(), produtos_estoque()
        case _:
            print("⚠ Opção inválida.")
            produtos_estoque()


# ------------------------------------------------------------------------------------------


def atendimentos_servicos():
    print("\n" + "=" * 80)
    print("🐾 GESTÃO DE ATENDIMENTOS E SERVIÇOS")
    print("=" * 80)
    print("1. Registrar Atendimento")
    print("2. Listar Atendimentos detalhados")
    print("3. Listar Atendimentos por raca")
    print("4. Listar Atendimentos recentes")
    print("5. Atualizar Atendimento")
    print("6. Media Valor Atendimento")
    print("7. Cadastrar Serviço")
    print("8. Listar Serviços")
    print("9. Remover Serviço")
    print("10. Atualizar Serviço")
    print("11. Listar Serviços por Pet")
    print("12. Serviços mais Usados")
    print("0. Voltar ao Menu Principal")
    print("=" * 80)

    match pedirNumero():
        case 1:
            limpar(), registrar_atendimento(), atendimentos_servicos()
        case 2:
            limpar(), exibir_view(
                "v_atendimentos_detalhados"
            ), pausar(), atendimentos_servicos()
        case 3:
            limpar(), exibir_view(
                "v_atendimentos_por_raca"
            ), pausar(), atendimentos_servicos()
        case 4:
            limpar(), exibir_view(
                "v_atendimentos_recentes"
            ), pausar(), atendimentos_servicos()
        case 5:
            limpar(), atualizar_atendimento(), atendimentos_servicos()
        case 6:
            limpar(), exibir_view(
                "v_media_valor_atendimento"
            ), pausar(), atendimentos_servicos()
        case 7:
            limpar(), exibir_view(
                "v_media_valor_atendimento"
            ), pausar(), atendimentos_servicos()
        case 8:
            limpar(), listar_servicos(), atendimentos_servicos()
        case 9:
            limpar(), remover_servico(), atendimentos_servicos()
        case 10:
            limpar(), atualizar_servico(), atendimentos_servicos()
        case 11:
            limpar(), listar_servicos_por_pet(), atendimentos_servicos()
        case 12:
            limpar(), exibir_view(
                "v_servicos_mais_usados"
            ), pausar(), atendimentos_servicos()
        case 0:
            limpar(), menu_principal(), atendimentos_servicos()
        case _:
            print("⚠ Opção inválida.")
            atendimentos_servicos()


# ------------------------------------------------------------------------------------------


def pagamentos_relatorios():
    print("\n" + "=" * 80)
    print("🐾 GESTÃO DE PAGAMENTOS E RELATÓRIOS FINANCEIROS")
    print("=" * 80)
    print("1. Criar Pagamento")
    print("2. Confirmar Pagamento")
    print("3. Listar Pagamentos")
    print("4. Listar Pagamentos pedentes")
    print("5. Atualizar Pagamento")
    print("6. Faturamento por Funcionário")
    print("7. Faturamento Mensal por Serviço")
    print("8. Faturamento Total Mensal")
    print("9. Produtos Mais Vendidos")
    print("0. Voltar ao Menu Principal")
    print("=" * 80)

    match pedirNumero():
        case 1:
            limpar(), criar_pagamento(), pagamentos_relatorios()
        case 2:
            limpar(), confirmar_pagamento(), pagamentos_relatorios()
        case 3:
            limpar(), exibir_view(
                "v_pagamentos_detalhados"
            ), pausar(), pagamentos_relatorios()
        case 4:
            limpar(), exibir_view(
                "v_pagamentos_pendentes"
            ), pausar(), pagamentos_relatorios()
        case 5:
            limpar(), atualizar_pagamento(), pagamentos_relatorios()
        case 6:
            limpar(), exibir_view(
                "v_faturamento_funcionario"
            ), pausar(), pagamentos_relatorios()
        case 7:
            limpar(), exibir_view(
                "v_faturamento_servico_mensal"
            ), pausar(), pagamentos_relatorios()
        case 8:
            limpar(), exibir_view(
                "v_receita_mensal_total"
            ), pausar(), pagamentos_relatorios()
        case 9:
            limpar(), exibir_view(
                "v_produtos_mais_vendidos"
            ), pausar(), pagamentos_relatorios()
        case 0:
            limpar(), menu_principal()
        case _:
            print("⚠ Opção inválida.")
            pagamentos_relatorios()


# ------------------------------------------------------------------------------------------


def visualizacoes_historicos():
    print("\n" + "=" * 80)
    print("🐾 VISUALIZAÇÕES DE HISTORICOS")
    print("=" * 80)
    print("1. Historico Atendimentos")
    print("2. Historico Pagamentos")
    print("3. Historico Estoque")
    print("0. Voltar ao Menu Principal")
    print("=" * 80)

    match pedirNumero():
        case 1:
            limpar(), exibir_view(
                "v_historico_atendimentos"
            ), pausar(), visualizacoes_historicos()
        case 2:
            limpar(), exibir_view(
                "v_historico_pagamentos"
            ), pausar(), visualizacoes_historicos()
        case 3:
            limpar(), exibir_view(
                "v_historico_estoque"
            ), pausar(), visualizacoes_historicos()
        case 0:
            limpar(), menu_principal()
        case _:
            print("⚠ Opção inválida.")
            visualizacoes_historicos()


menu_principal()
