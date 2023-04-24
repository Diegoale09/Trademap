*** Settings ***
Library           SeleniumLibrary
Resource             ../Resource/resource.robot
Test Setup           Abrir o Navegador
Test Teardown        Fechar o Navegador

*** Test Cases ***
Deve validar a conta usando o CPF
    Dado que estou na pagina de login da TradeMap
    Quando coloco o login usando o CPF e senha 
    E Quando clico em Entrar na minha conta
    Então deve logar e entrar na página da home da TradeMap

Deve validar a conta usando o Email
    Dado que estou na pagina de login da TradeMap
    Quando coloco o Login usando o email e senha 
    E Quando clico em Entrar na minha conta
    Então deve logar e entrar na página da home da TradeMap


Deve validar a conta usando o Telefone
    Dado que estou na pagina de login da TradeMap
    Quando coloco o Login usando o telefone e senha 
    E Quando clico em Entrar na minha conta
    Então deve logar e entrar na página da home da TradeMap

Deve Vvalidar um usuario invalido
    Dado que estou na pagina de login da TradeMap
    Quando coloco o Login usando um usuário inválido   
    E Quando clico em Entrar na minha conta
    Então deve aparecer a mensagem E-mail ou senha incorretos, revise e tente novamente
