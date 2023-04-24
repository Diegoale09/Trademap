*** Settings ***
Library                SeleniumLibrary
Library                String
*** Variables ***

${URL}                                https://portal.trademap.com.br/
${BROWSER}                            Chrome


${LOGIN}                              cpf
${SENHA}                              password
${ACESSAR}                            //button[normalize-space()='Entrar na minha conta']
${TITLE}                              TradeMap

${CPF}                                36583161877
${EMAIL}                              diegoeana14@gmail.com
${TELEFONE}                           11981003830

${SENHA_GERAL}                        Teste2023.

${MSG_INVALIDA}                        (//span[contains(.,'E-mail ou senha incorretos, revise e tente novamente')])[1]
*** Keywords ***
Abrir o Navegador
    Open Browser                      ${URL}        ${BROWSER}
    Maximize Browser Window

Fechar o Navegador
    Close Browser


Acessar a página home do site
    Title Should Be                     TradeMap
    Sleep                               time_=2

    [Documentation]    LOGIN
Login with
    [Arguments]                        ${uname}       ${pass}

    Input Text                         locator=${LOGIN}      text=${uname}
    Input Text                         locator=${SENHA}      text=${pass}                  
         
    [Documentation]    CASOS DE TESTES VALIDOS
Dado que estou na pagina de login da TradeMap
    Acessar a página home do site

Quando coloco o login usando o CPF e senha
    Wait Until Element Is Visible     ${ACESSAR}     30
    Login With                        ${CPF}         ${SENHA_GERAL}   
    Capture Page Screenshot

E Quando clico em Entrar na minha conta
    
    Click Element                     ${ACESSAR}

Então deve logar e entrar na página da home da TradeMap
    Title Should Be                   ${TITLE}
    Sleep                             5

Quando coloco o Login usando o email e senha 
    Wait Until Element Is Visible     ${ACESSAR}     30
    Login With                        ${EMAIL}       ${SENHA_GERAL}    
    Capture Page Screenshot

Quando coloco o Login usando o telefone e senha 
    Wait Until Element Is Visible     ${ACESSAR}     30
    Login With                        ${TELEFONE}    ${SENHA_GERAL} 
    Capture Page Screenshot  

    [Documentation]    CASOS DE TESTE INVALIDO

Quando coloco o Login usando um usuário inválido
    Wait Until Element Is Visible     ${ACESSAR}     30
    Login With                        36583161844    ${SENHA_GERAL} 


Então deve aparecer a mensagem E-mail ou senha incorretos, revise e tente novamente
    Wait Until Element Is Visible     ${MSG_INVALIDA}     30
    Capture Page Screenshot