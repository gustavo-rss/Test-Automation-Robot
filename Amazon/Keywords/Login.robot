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
    ...    error=Missing e-mail error not displayed
    Element Text Should Be    ${LOGIN_MISSING_EMAIL_ERROR}    Digite seu e-mail ou número de telefone celular
    Input wrong login e-mail
    Element Text Should Be
    ...    ${LOGIN_NOT_FOUND_EMAIL_ERROR}
    ...    Não encontramos uma conta associada a este endereço de e-mail
    Input wrong login password
    Element Text Should Be
    ...    ${LOGIN_WRONG_PASSWORD_ERROR}
    ...    Sua senha está incorreta

Input wrong login e-mail
    Input Text    ${LOGIN_EMAIL}    ${WRONG_PASSWORD}
    Click Element    ${LOGIN_CONTINUE}
    Wait Until Element Is Visible    ${LOGIN_NOT_FOUND_EMAIL_ERROR}    10s    error=Email not found error not displayed

Input correct login e-mail
    Input Text    ${LOGIN_EMAIL}    ${VALID_EMAIL}
    Click Element    ${LOGIN_CONTINUE}

Input wrong login password
    Input correct login e-mail
    Input Text    ${LOGIN_PASSWORD}    ${WRONG_PASSWORD}
    Click Element    ${LOGIN_SUBMIT}
    Wait Until Element Is Visible    ${LOGIN_WRONG_PASSWORD_ERROR}    10s    error=Wrong password error not displayed
