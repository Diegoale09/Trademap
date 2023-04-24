*** Settings ***
Library              SeleniumLibrary
Resource             ../Resource/resource.robot
Test Setup           Abrir o Navegador
Test Teardown        Fechar o Navegador

*** Test Cases ***

Deve a página home do site
    [Documentation]    HOME
    Acessar a página home do site
    Capture Page Screenshot
