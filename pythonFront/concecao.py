import mysql.connector as my


def InicarConcecao():
    try:
        conec = my.connect(
            host="127.0.0.1",
            port=3306,
            user="root",
            password="10126824",
            database="clinica_petshop",
        )
        print("✅ Conexão bem-sucedida!")
        return conec
    except my.Error as e:
        print(f"❌ Erro ao InicarConcecao: {e}")

    print("conectado com sucesso")


def exibir_view(nome_view):
    try:
        conexao = InicarConcecao()
        cursor = conexao.cursor()

        cursor.execute(f"SELECT * FROM {nome_view}")
        resultados = cursor.fetchall()

        if resultados:
            colunas = [desc[0] for desc in cursor.description]
            print(f"\n{nome_view}")
            print(" | ".join(colunas))
            for linha in resultados:
                print(" | ".join(str(c) for c in linha))
        else:
            print(f"\n{nome_view} — sem dados.")

    except Exception as e:
        print(f"Erro ao consultar {nome_view}: {e}")
    finally:
        cursor.close()
        conexao.close()


# ===================== CLIENTES =====================


def atualizar_cliente():
    print("\n=== Atualizar Cliente ===")
    id_cliente = input("Informe o ID do cliente a atualizar: ")
    nome = input("Novo nome: ")
    cpf = input("Novo CPF: ")
    endereco = input("Novo endereço: ")
    telefone = input("Novo telefone: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("atualizar_cliente", (id_cliente, nome, cpf, endereco, telefone))
    conn.commit()
    cursor.close()
    conn.close()
    print("✅ Cliente atualizado com sucesso!")


def cadastrar_cliente():
    print("\n=== Cadastro de Cliente ===")
    nome = input("Informe o nome do cliente: ")
    cpf = input("Informe o CPF: ")
    endereco = input("Informe o endereço: ")
    telefone = input("Informe o telefone: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("cadastrar_cliente", (nome, cpf, endereco, telefone))
    conn.commit()
    print("✅ Cliente cadastrado com sucesso!")
    cursor.close()
    conn.close()


def remover_cliente():
    print("\n=== Remover Cliente ===")
    id_cliente = input("Informe o ID do cliente a remover: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("remover_cliente", (id_cliente,))
    conn.commit()
    print(f"✅ Cliente {id_cliente} removido com sucesso!")
    cursor.close()
    conn.close()


def buscar_cliente_por_id():
    print("\n=== Buscar Cliente ===")
    id_cliente = input("Informe o ID do cliente: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("buscar_cliente_por_id", (id_cliente,))
    for result in cursor.stored_results():
        dados = result.fetchall()
        print("\n📋 Resultado da busca:")
        for linha in dados:
            print(linha)
    cursor.close()
    conn.close()


def listar_clientes():
    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("listar_clientes")
    for result in cursor.stored_results():
        print(result.fetchall())
    cursor.close()
    conn.close()


def consultar_historico_cliente():
    print("\n=== Histórico do Cliente ===")
    id_cliente = input("Informe o ID do cliente: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("consultar_historico_cliente", (id_cliente,))
    for result in cursor.stored_results():
        dados = result.fetchall()
        print("\n📋 Histórico:")
        for linha in dados:
            print(linha)
    cursor.close()
    conn.close()


# ===================== PETS =====================


def atualizar_pet():
    print("\n=== Atualizar Pet ===")
    id_pet = input("Informe o ID do pet: ")
    nome = input("Novo nome: ")
    animal = input("Tipo de animal (ex: cachorro, gato): ")
    idade = input("Nova idade: ")
    raca = input("Nova raça: ")
    peso = input("Novo peso (kg): ")
    porte = input("Novo porte (pequeno, médio, grande): ")
    sexo = input("Sexo (M/F): ")
    id_cliente = input("ID do cliente responsável: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc(
        "atualizar_pet",
        (id_pet, nome, animal, idade, raca, peso, porte, sexo, id_cliente),
    )
    conn.commit()
    cursor.close()
    conn.close()
    print("✅ Pet atualizado com sucesso!")


def cadastrar_pet():
    print("\n=== Cadastrar Novo Pet ===")
    nome = input("Nome do pet: ")
    animal = input("Tipo de animal (ex: cachorro, gato): ")
    idade = input("Idade: ")
    raca = input("Raça: ")
    peso = input("Peso (kg): ")
    porte = input("Porte (pequeno, médio, grande): ")
    sexo = input("Sexo (M/F): ")
    id_cliente = input("ID do cliente responsável: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc(
        "cadastrar_pet", (nome, animal, idade, raca, peso, porte, sexo, id_cliente)
    )
    conn.commit()
    print("✅ Pet cadastrado com sucesso!")
    cursor.close()
    conn.close()


def buscar_pet_por_id():
    print("\n=== Buscar Pet por ID ===")
    id_pet = input("Informe o ID do pet: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("buscar_pet_por_id", (id_pet,))
    for result in cursor.stored_results():
        dados = result.fetchall()
        print("\n📋 Resultado da busca:")
        for linha in dados:
            print(linha)
    cursor.close()
    conn.close()


def remover_pet():
    print("\n=== Remover Pet ===")
    id_pet = input("Informe o ID do pet a remover: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("remover_pet", (id_pet,))
    conn.commit()
    print(f"✅ Pet {id_pet} removido com sucesso!")
    cursor.close()
    conn.close()


def listar_pets():
    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("listar_pets")
    for result in cursor.stored_results():
        print(result.fetchall())
    cursor.close()
    conn.close()


def listar_pets_por_cliente():
    print("\n=== Listar Pets por Cliente ===")
    id_cliente = input("Informe o ID do cliente: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("listar_pets_por_cliente", (id_cliente,))
    for result in cursor.stored_results():
        dados = result.fetchall()
        if dados:
            print("\n📋 Pets do cliente:")
            for linha in dados:
                print(linha)
        else:
            print("⚠️ Nenhum pet encontrado para esse cliente.")
    cursor.close()
    conn.close()


# ===================== CARGOS =====================


def atualizar_cargo():
    print("\n=== Atualizar Cargo ===")
    id_cargo = input("Informe o ID do cargo: ")
    nome = input("Novo nome do cargo: ")
    especialidade = input("Nova especialidade: ")
    crmv = input("Novo número de CRMV (caso aplicável): ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("atualizar_cargo", (id_cargo, nome, especialidade, crmv))
    conn.commit()
    cursor.close()
    conn.close()
    print("✅ Cargo atualizado com sucesso!")


def buscar_cargo_por_id():
    print("\n=== Buscar Cargo por ID ===")
    id_cargo = input("Informe o ID do cargo: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("buscar_cargo_por_id", (id_cargo,))
    for result in cursor.stored_results():
        dados = result.fetchall()
        if dados:
            print("\n📋 Detalhes do cargo:")
            for linha in dados:
                print(linha)
        else:
            print("⚠️ Nenhum cargo encontrado com esse ID.")
    cursor.close()
    conn.close()


def listar_cargos():
    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("listar_cargos")
    for result in cursor.stored_results():
        print(result.fetchall())
    cursor.close()
    conn.close()


def cadastrar_cargo():
    print("\n=== Cadastrar Cargo ===")
    nome = input("Nome do cargo: ")
    especialidade = input("Especialidade: ")
    crmv = input("Número de CRMV (caso aplicável): ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("cadastrar_cargo", (nome, especialidade, crmv))
    conn.commit()
    cursor.close()
    conn.close()
    print("✅ Cargo cadastrado com sucesso!")


# ===================== FUNCIONÁRIOS =====================


def cadastrar_funcionario():
    print("\n=== Cadastrar Funcionário ===")
    nome = input("Nome do funcionário: ")
    cpf = input("CPF: ")
    email = input("E-mail: ")
    telefone = input("Telefone: ")
    id_cargo = input("ID do cargo: ")
    contrato = input("Tipo de contrato (ex: CLT, PJ): ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc(
        "cadastrar_funcionario", (nome, cpf, email, telefone, id_cargo, contrato)
    )
    conn.commit()
    cursor.close()
    conn.close()
    print("✅ Funcionário cadastrado com sucesso!")


def buscar_funcionario_por_id():
    print("\n=== Buscar Funcionário por ID ===")
    id_funcionario = input("Informe o ID do funcionário: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("buscar_funcionario_por_id", (id_funcionario,))
    for result in cursor.stored_results():
        resultados = result.fetchall()
        if resultados:
            print("\n📋 Resultado da busca:")
            for linha in resultados:
                print(linha)
        else:
            print("⚠️ Nenhum funcionário encontrado com esse ID.")
    cursor.close()
    conn.close()


def remover_funcionario():
    print("\n=== Remover Funcionário ===")
    id_funcionario = input("Informe o ID do funcionário a remover: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("remover_funcionario", (id_funcionario,))
    conn.commit()
    cursor.close()
    conn.close()
    print(f"✅ Funcionário {id_funcionario} removido com sucesso!")


def listar_funcionarios():
    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("listar_funcionarios")
    for result in cursor.stored_results():
        print(result.fetchall())
    cursor.close()
    conn.close()


def atualizar_funcionario(
    id_funcionario, nome, cpf, email, telefone, id_cargo, contrato
):
    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc(
        "atualizar_funcionario",
        (id_funcionario, nome, cpf, email, telefone, id_cargo, contrato),
    )
    conn.commit()
    cursor.close()
    conn.close()
    print("Funcionário atualizado com sucesso!")


def remover_cargo():
    print("\n=== Remover Cargo ===")
    id_cargo = input("Informe o ID do cargo a remover: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("remover_cargo", (id_cargo,))
    conn.commit()
    cursor.close()
    conn.close()

    print(f"✅ Cargo {id_cargo} removido com sucesso!")


# ===================== PRODUTOS =====================
def atualizar_produto(
    id_produto,
    id_estoque,
    categoria,
    nome,
    preco,
    quantidade,
    descricao,
    estoque_minimo,
    estoque_maximo,
):
    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc(
        "atualizar_produto",
        (
            id_produto,
            id_estoque,
            categoria,
            nome,
            preco,
            quantidade,
            descricao,
            estoque_minimo,
            estoque_maximo,
        ),
    )
    conn.commit()
    cursor.close()
    conn.close()
    print("Produto atualizado com sucesso!")


def buscar_produto_por_id():
    print("\n=== Buscar Produto por ID ===")
    id_produto = input("Informe o ID do produto: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("buscar_produto_por_id", (id_produto,))
    for result in cursor.stored_results():
        resultados = result.fetchall()
        if resultados:
            print("\n📋 Resultado da busca:")
            for linha in resultados:
                print(linha)
        else:
            print("⚠️ Nenhum produto encontrado com esse ID.")
    cursor.close()
    conn.close()


def remover_produto():
    print("\n=== Remover Produto ===")
    id_produto = input("Informe o ID do produto a remover: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("remover_produto", (id_produto,))
    conn.commit()
    cursor.close()
    conn.close()

    print(f"✅ Produto {id_produto} removido com sucesso!")


def cadastrar_produto(
    id_estoque,
    categoria,
    nome,
    preco,
    quantidade,
    descricao,
    estoque_minimo,
    estoque_maximo,
):
    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc(
        "cadastrar_produto",
        (
            id_estoque,
            categoria,
            nome,
            preco,
            quantidade,
            descricao,
            estoque_minimo,
            estoque_maximo,
        ),
    )
    conn.commit()
    print("Produto cadastrado com sucesso!")
    cursor.close()
    conn.close()


def listar_produtos():
    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("listar_produtos")
    for result in cursor.stored_results():
        print(result.fetchall())
    cursor.close()
    conn.close()


# ===================== ESTOQUES =====================


def listar_estoques():
    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("listar_estoques")
    for result in cursor.stored_results():
        print(result.fetchall())
    cursor.close()
    conn.close()


def cadastrar_estoque():
    print("\n=== Cadastrar Estoque ===")
    localizacao = input("Informe a localização do estoque: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("cadastrar_estoque", (localizacao,))
    conn.commit()
    cursor.close()
    conn.close()
    print("✅ Estoque cadastrado com sucesso!")


def buscar_estoque_por_id():
    print("\n=== Buscar Estoque por ID ===")
    id_estoque = input("Informe o ID do estoque: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("buscar_estoque_por_id", (id_estoque,))
    for result in cursor.stored_results():
        resultados = result.fetchall()
        if resultados:
            print("\n📦 Resultado da busca:")
            for linha in resultados:
                print(linha)
        else:
            print("⚠️ Nenhum estoque encontrado com esse ID.")
    cursor.close()
    conn.close()


def atualizar_estoque():
    print("\n=== Atualizar Estoque ===")
    id_estoque = input("Informe o ID do estoque: ")
    localizacao = input("Nova localização: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("atualizar_estoque", (id_estoque, localizacao))
    conn.commit()
    cursor.close()
    conn.close()
    print("✅ Estoque atualizado com sucesso!")


def remover_estoque():
    print("\n=== Remover Estoque ===")
    id_estoque = input("Informe o ID do estoque a remover: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("remover_estoque", (id_estoque,))
    conn.commit()
    cursor.close()
    conn.close()
    print(f"✅ Estoque {id_estoque} removido com sucesso!")


def repor_estoque():
    print("\n=== Repor Estoque ===")
    id_produto = input("Informe o ID do produto: ")
    quantidade = input("Informe a quantidade a repor: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("repor_estoque", (id_produto, quantidade))
    conn.commit()
    cursor.close()
    conn.close()
    print(f"📦 Estoque do produto {id_produto} atualizado com +{quantidade} unidades!")


# ===================== SERVIÇOS =====================


def atualizar_servico():
    print("\n=== Atualizar Serviço ===")
    id_servico = input("Informe o ID do serviço: ")
    tipo_servico = input("Novo tipo de serviço: ")
    preco = input("Novo preço: ")
    descricao = input("Nova descrição: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("atualizar_servico", (id_servico, tipo_servico, preco, descricao))
    conn.commit()
    cursor.close()
    conn.close()
    print("✅ Serviço atualizado com sucesso!")


def listar_servicos():
    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("listar_servicos")
    for result in cursor.stored_results():
        print(result.fetchall())
    cursor.close()
    conn.close()


def cadastrar_servico():
    print("\n=== Cadastrar Serviço ===")
    tipo_servico = input("Tipo de serviço: ")
    preco = input("Preço do serviço: ")
    descricao = input("Descrição do serviço: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("cadastrar_servico", (tipo_servico, preco, descricao))
    conn.commit()
    cursor.close()
    conn.close()
    print("✅ Serviço cadastrado com sucesso!")


def buscar_servico_por_id():
    print("\n=== Buscar Serviço por ID ===")
    id_servico = input("Informe o ID do serviço: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("buscar_servico_por_id", (id_servico,))
    for result in cursor.stored_results():
        resultados = result.fetchall()
        if resultados:
            print("\n📋 Resultado da busca:")
            for linha in resultados:
                print(linha)
        else:
            print("⚠️ Nenhum serviço encontrado com esse ID.")
    cursor.close()
    conn.close()


def remover_servico():
    print("\n=== Remover Serviço ===")
    id_servico = input("Informe o ID do serviço a remover: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("remover_servico", (id_servico,))
    conn.commit()
    cursor.close()
    conn.close()
    print(f"✅ Serviço {id_servico} removido com sucesso!")


def listar_servicos_por_pet():
    print("\n=== Listar Serviços por Pet ===")
    id_pet = input("Informe o ID do pet: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("listar_servicos_por_pet", (id_pet,))
    for result in cursor.stored_results():
        resultados = result.fetchall()
        if resultados:
            print(f"\n📋 Serviços vinculados ao pet {id_pet}:")
            for linha in resultados:
                print(linha)
        else:
            print("⚠️ Nenhum serviço encontrado para este pet.")
    cursor.close()
    conn.close()


# ===================== PAGAMENTOS =====================


def atualizar_pagamento():
    print("\n=== Atualizar Pagamento ===")
    id_pagamento = input("Informe o ID do pagamento: ")
    forma_pagamento = input("Nova forma de pagamento: ")
    status_pagamento = input(
        "Novo status do pagamento (ex: Pendente, Pago, Cancelado): "
    )
    valor_total = input("Novo valor total: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc(
        "atualizar_pagamento",
        (id_pagamento, forma_pagamento, status_pagamento, valor_total),
    )
    conn.commit()
    cursor.close()
    conn.close()
    print("✅ Pagamento atualizado com sucesso!")


def listar_produtos_por_pagamento():
    print("\n=== Listar Produtos por Pagamento ===")
    id_pagamento = input("Informe o ID do pagamento: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("listar_produtos_por_pagamento", (id_pagamento,))
    for result in cursor.stored_results():
        resultados = result.fetchall()
        if resultados:
            print(f"\n📦 Produtos associados ao pagamento {id_pagamento}:")
            for linha in resultados:
                print(linha)
        else:
            print("⚠️ Nenhum produto associado a este pagamento.")
    cursor.close()
    conn.close()


def criar_pagamento():
    print("\n=== Criar Pagamento ===")
    id_cliente = input("Informe o ID do cliente: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("criar_pagamento", (id_cliente,))
    for result in cursor.stored_results():
        resultados = result.fetchall()
        if resultados:
            print("\n💰 Pagamento criado com sucesso:")
            for linha in resultados:
                print(linha)
        else:
            print("⚠️ Nenhum resultado retornado.")
    conn.commit()
    cursor.close()
    conn.close()


def listar_atendimentos_por_funcionario():
    print("\n=== Listar Atendimentos por Funcionário ===")
    id_funcionario = input("Informe o ID do funcionário: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("listar_atendimentos_por_funcionario", (id_funcionario,))
    for result in cursor.stored_results():
        resultados = result.fetchall()
        if resultados:
            print(f"\n📋 Atendimentos realizados pelo funcionário {id_funcionario}:")
            for linha in resultados:
                print(linha)
        else:
            print("⚠️ Nenhum atendimento encontrado para este funcionário.")
    cursor.close()
    conn.close()


def definir_forma_pagamento():
    print("\n=== Definir Forma de Pagamento ===")
    id_pagamento = input("Informe o ID do pagamento: ")
    forma_pagamento = input("Informe a nova forma de pagamento: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("definir_forma_pagamento", (id_pagamento, forma_pagamento))
    conn.commit()
    cursor.close()
    conn.close()
    print(f"✅ Forma de pagamento atualizada para '{forma_pagamento}'!")


def confirmar_pagamento():
    print("\n=== Confirmar Pagamento ===")
    id_pagamento = input("Informe o ID do pagamento: ")
    forma_pagamento = input("Informe a forma de pagamento: ")
    status_pagamento = input("Informe o status do pagamento (ex: Pago, Pendente): ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc(
        "confirmar_pagamento", (id_pagamento, forma_pagamento, status_pagamento)
    )
    conn.commit()
    cursor.close()
    conn.close()
    print(f"✅ Pagamento {id_pagamento} confirmado com status '{status_pagamento}'!")


def associar_atendimento_pagamento():
    print("\n=== Associar Atendimento a Pagamento ===")
    id_pagamento = input("Informe o ID do pagamento: ")
    id_atendimento = input("Informe o ID do atendimento: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("associar_atendimento_pagamento", (id_pagamento, id_atendimento))
    conn.commit()
    cursor.close()
    conn.close()
    print(f"✅ Atendimento {id_atendimento} associado ao pagamento {id_pagamento}!")


def desassociar_atendimento_pagamento():
    print("\n=== Desassociar Atendimento de Pagamento ===")
    id_pagamento = input("Informe o ID do pagamento: ")
    id_atendimento = input("Informe o ID do atendimento a desassociar: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("desassociar_atendimento_pagamento", (id_pagamento, id_atendimento))
    conn.commit()
    cursor.close()
    conn.close()
    print(f"✅ Atendimento {id_atendimento} removido do pagamento {id_pagamento}!")


def associar_pagamento_produto():
    print("\n=== Associar Produto a Pagamento ===")
    id_pagamento = input("Informe o ID do pagamento: ")
    id_produto = input("Informe o ID do produto: ")
    quantidade = input("Informe a quantidade: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc(
        "associar_pagamento_produto", (id_pagamento, id_produto, quantidade)
    )
    conn.commit()
    cursor.close()
    conn.close()
    print(
        f"✅ Produto {id_produto} (x{quantidade}) associado ao pagamento {id_pagamento}!"
    )


def remover_pagamento_produto():
    print("\n=== Remover Produto de Pagamento ===")
    id_pagamento = input("Informe o ID do pagamento: ")
    id_produto = input("Informe o ID do produto a remover: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc("remover_pagamento_produto", (id_pagamento, id_produto))
    conn.commit()
    cursor.close()
    conn.close()
    print(f"✅ Produto {id_produto} removido do pagamento {id_pagamento}!")


# ===================== ATENDIMENTOS =====================


def registrar_atendimento(
    id_pet, id_funcionario, id_servico, diagnostico, receita, observacoes
):
    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc(
        "registrar_atendimento",
        (id_pet, id_funcionario, id_servico, diagnostico, receita, observacoes),
    )
    conn.commit()
    cursor.close()
    conn.close()


def atualizar_atendimento():
    print("\n=== Atualizar Atendimento ===")
    id_atendimento = input("Informe o ID do atendimento: ")
    diagnostico = input("Digite o novo diagnóstico: ")
    receita = input("Digite a nova receita: ")
    observacoes = input("Digite as novas observações: ")

    conn = InicarConcecao()
    cursor = conn.cursor()
    cursor.callproc(
        "atualizar_atendimento", (id_atendimento, diagnostico, receita, observacoes)
    )
    conn.commit()
    cursor.close()
    conn.close()
    print("✅ Atendimento atualizado com sucesso!")
