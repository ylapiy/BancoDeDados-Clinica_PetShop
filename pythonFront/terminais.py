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
    print("6. Visualizações e Relatórios (Views)")
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
            limpar(), visualizacoes_relatorios()
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
            limpar(), cadastrar_cliente()
        case 2:
            limpar(), exibir_view("v_clientes_ativos")
        case 3:
            limpar(), exibir_view("v_clientes_top")
        case 4:
            limpar(), remover_cliente()
        case 5:
            limpar(), atualizar_cliente()
        case 6:
            limpar(), buscar_cliente_por_id()
        case 7:
            limpar(), cadastrar_pet()
        case 8:
            limpar(), listar_pets()
        case 9:
            limpar(), remover_pet()
        case 10:
            limpar(), atualizar_pet()
        case 11:
            limpar(), buscar_pet_por_id()
        case 12:
            limpar(), exibir_view("v_frequencia_visitas_pet")
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
    print("7. Listar Funcionários")
    print("8. Remover Funcionário")
    print("9. Buscar Funcionário por ID")
    print("10. Performance Funcionarios")
    print("11, Ranking Funcionarios")
    print("0. Voltar ao Menu Principal")
    print("=" * 80)

    match pedirNumero():
        case 1:
            limpar(), cadastrar_cargo()
        case 2:
            limpar(), listar_cargos()
        case 3:
            limpar(), remover_cargo()
        case 4:
            limpar(), atualizar_cargo()
        case 5:
            limpar(), buscar_cargo_por_id()
        case 6:
            limpar(), cadastrar_funcionario()
        case 7:
            limpar(), listar_funcionarios()
        case 8:
            limpar(), remover_funcionario()
        case 9:
            limpar(), buscar_funcionario_por_id()
        case 10:
            limpar(), exibir_view("v_funcionarios_performance")
        case 11:
            limpar(), exibir_view("v_funcionarios_ranking")
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
            limpar(), cadastrar_produto()
        case 2:
            limpar(), listar_produtos()
        case 3:
            limpar(), remover_produto()
        case 4:
            limpar(), atualizar_produto()
        case 5:
            limpar(), buscar_produto_por_id()
        case 6:
            limpar(), repor_estoque()
        case 7:
            limpar(), exibir_view("v_estoque_completo")
        case 8:
            limpar(), exibir_view("v_estoque_baixo")
        case 9:
            limpar(), exibir_view("v_estoque_critico")
        case 10:
            limpar(), exibir_view("v_estoque_excesso")
        case 11:
            limpar(), exibir_view("v_estoque_por_categoria")
        case 12:
            limpar(), remover_estoque()
        case 13:
            limpar(), buscar_estoque_por_id()
        case 0:
            limpar(), menu_principal()
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
    print("7. Listar Historico")
    print("8. Cadastrar Serviço")
    print("9. Listar Serviços")
    print("10. Remover Serviço")
    print("11. Atualizar Serviço")
    print("12. Listar Serviços por Pet")
    print("13. Serviços mais Usados")
    print("0. Voltar ao Menu Principal")
    print("=" * 80)

    match pedirNumero():
        case 1:
            limpar(), registrar_atendimento()
        case 2:
            limpar(), exibir_view("v_atendimentos_detalhados")
        case 3:
            limpar(), exibir_view("v_atendimentos_por_raca")
        case 4:
            limpar(), exibir_view("v_atendimentos_recentes")
        case 5:
            limpar(), atualizar_atendimento()
        case 6:
            limpar(), exibir_view("v_media_valor_atendimento")
        case 7:
            limpar(), exibir_view("v_media_valor_atendimento")
        case 8:
            limpar(), exibir_view("v_historico_completo")
        case 9:
            limpar(), listar_servicos()
        case 10:
            limpar(), remover_servico()
        case 11:
            limpar(), atualizar_servico()
        case 12:
            limpar(), listar_servicos_por_pet()
        case 13:
            limpar(), exibir_view("v_servicos_mais_usados")
        case 0:
            limpar(), menu_principal()
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
            limpar(), criar_pagamento()
        case 2:
            limpar(), confirmar_pagamento()
        case 3:
            limpar(), exibir_view("v_pagamentos_detalhados")
        case 4:
            limpar(), exibir_view("v_pagamentos_pendentes")
        case 5:
            limpar(), atualizar_pagamento()
        case 6:
            limpar(), exibir_view("v_faturamento_funcionario")
        case 7:
            limpar(), exibir_view("v_faturamento_servico_mensal")
        case 8:
            limpar(), exibir_view("v_produtos_mais_vendidos")
        case 9:
            limpar(), exibir_view("v_produtos_mais_vendidos")
        case 0:
            menu_principal()
        case _:
            print("⚠ Opção inválida.")
            pagamentos_relatorios()


# ------------------------------------------------------------------------------------------


def visualizacoes_relatorios():
    print("\n" + "=" * 80)
    print("🐾 VISUALIZAÇÕES E RELATÓRIOS (VIEWS)")
    print("=" * 80)
    print("1. Visualizar Atendimentos Detalhados")
    print("2. Visualizar Estoque Completo")
    print("3. Visualizar Clientes Ativos")
    print("4. Visualizar Serviços Mais Usados")
    print("5. Receita Mensal Total")
    print("6. Pagamentos Pendentes")
    print("7. Relatório de Atendimentos por Funcionário")
    print("0. Voltar ao Menu Principal")
    print("=" * 80)

    match pedirNumero():
        case 1:
            exibir_view("v_atendimentos_detalhados")
            pausar()
            limpar(),
            visualizacoes_relatorios()
        case 2:
            exibir_view("v_estoque_completo")
            pausar()
            limpar(),
        case 3:
            exibir_view("v_clientes_ativos")
            pausar()
            limpar(),
        case 4:
            exibir_view("v_servicos_mais_usados")
            pausar()
            limpar(),
        case 5:
            exibir_view("v_receita_mensal_total")
            pausar()
            limpar(),
        case 6:
            exibir_view("v_pagamentos_pendentes")
            pausar()
            limpar(),
        case 7:
            exibir_view("v_listar_atendimentos_por_funcionario")
            pausar()
            limpar(),
        case 0:
            limpar(),
            menu_principal()
        case _:
            print("⚠ Opção inválida.")
            visualizacoes_relatorios()


menu_principal()
