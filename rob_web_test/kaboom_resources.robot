*** Settings ***

Library    SeleniumLibrary
Library    XML

*** Variables ***
${URL}                         https://www.kabum.com.br
${MENU_DEPARTAMENTOS}          //span[contains(.,'DEPARTAMENTOS')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Kabum.com.br
    Go To                            url=${URL}
    Wait Until Element Is Visible    locator=${MENU_DEPARTAMENTOS}
    Click Element                    locator=//button[contains(.,'Entendi')]

Entrar no menu "Departamentos"
    Mouse Up        locator=${MENU_DEPARTAMENTOS}

Selecionar a categoria "${FRASE}"
    Wait Until Element Is Visible    locator=//a[@href='https://www.kabum.com.br/computadores']
    Mouse Up                         locator=//a[@href='https://www.kabum.com.br/computadores']

Selecionar a subcategoria "${FRASE}"
    Wait Until Element Is Visible    locator=//a[@href='https://www.kabum.com.br/computadores/pc']
    Mouse Up                         locator=//a[@href='https://www.kabum.com.br/computadores/pc']

Clicar na categoria ${FRASE}"
    Wait Until Element Is Visible    locator=//a[@href='https://www.kabum.com.br/computadores/pc/pc-gamer']
    Click Element                    locator=//a[@href='https://www.kabum.com.br/computadores/pc/pc-gamer']
    
Filtrar pelo preço
    Scroll Element Into View         locator=//summary[@class='filterHeader'][contains(.,'Marcas')]
    Wait Until Element Is Visible    locator=//span[contains(.,'Categorias relacionadas')]
    Mouse Up                         locator=//select[contains(@class,'sc-8c5ed0b2-0 dRMwzp')]
    Wait Until Element Is Visible    locator=//summary[contains(.,'Preço')]
    Click Element                    locator=//option[@value='-price'][contains(.,'Preço decrescente')]

Acessar produto
    Wait Until Element Is Visible    locator=//span[contains(.,'Pc Gamer Ocex Intel I9 - Rtx 4080 - 64GB Ddr5 - M.2 2TB G4')]
    Scroll Element Into View         locator=//summary[@class='filterHeader'][contains(.,'Marcas')]
    Click Image                      locator=//img[contains(@title,'Pc Gamer Ocex Intel I9 - Rtx 4080 - 64GB Ddr5 - M.2 2TB G4')]

Adicionar ao carrinho de compras
    Wait Until Element Is Visible    locator=//h1[contains(.,'Pc Gamer Ocex Intel I9 - Rtx 4080 - 64GB Ddr5 - M.2 2TB G4')]
    Scroll Element Into View         locator=//input[@id='inputCalcularFrete']
    Click Element                    locator=//button[@class='sc-8b813326-0 jqYsju'][contains(.,'COMPRAR')]

Verificar se o produto foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//strong[contains(.,'PRODUTO ADICIONADO NO CARRINHO')]