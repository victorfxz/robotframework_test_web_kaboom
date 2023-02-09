*** Settings ***
Documentation    Essa suite testa o site da Kabum.com.br
Resource         kaboom_resources.robot
Task Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Adicionar PC Gamer mais caro ao carrinho de compras
    [Documentation]    Esse teste verifica o acesso, filtragem e adicão de produto ao carrinho de compras
    [Tags]             procura_pcgamer
    Acessar a home page do site Kabum.com.br
    Entrar no menu "Departamentos"
    Selecionar a categoria "Computadores"
    Selecionar a subcategoria "PC"
    Clicar na categoria "PC Gamer"
    Filtrar pelo preço
    Acessar produto
    Adicionar ao carrinho de compras
    Verificar se o produto foi adicionado com sucesso
