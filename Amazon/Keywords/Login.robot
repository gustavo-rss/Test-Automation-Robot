*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Locators.robot
Resource    ../Resources/Variables.robot


*** Keywords ***
Verify login error messages
    Click Element    ${LOGIN_CONTINUE}
    Wait Until Element Is Visible
    ...    ${LOGIN_MISSING_EMAIL_ERROR}
    ...    10s
    ...    error=Missing e-mail error message not displayed
    Element Text Should Be    ${LOGIN_MISSING_EMAIL_ERROR}    Digite seu e-mail ou número de telefone celular
    Input wrong login e-mail
    Element Text Should Be
    ...    ${LOGIN_NOT_FOUND_EMAIL_ERROR}
    ...    Não encontramos uma conta associada a este endereço de e-mail

Input wrong login e-mail
    Input Text    ${LOGIN_EMAIL}    aaaa
    Click Element    ${LOGIN_CONTINUE} 
