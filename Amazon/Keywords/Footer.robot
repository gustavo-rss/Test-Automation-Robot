*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Locators.robot
Resource    ../Resources/Variables.robot


*** Keywords ***
Click on footer payment methods
    Scroll Element Into View    ${PAYMENT_METHOD}
    Click Element    ${PAYMENT_METHOD}
    Wait Until Location Contains    footer_pay

Verify accepted payment methods
    Scroll Element Into View    ${ACCEPTED_CREDIT_CARD}
    Wait Until Element Is Visible    ${ACCEPTED_CREDIT_CARD}    10s    error=Credit card is not visible
    Should Contain    ${ACCEPTED_CREDIT_CARD}    Crédito

    Scroll Element Into View    ${ACCEPTED_BOLETO}
    Wait Until Element Is Visible    ${ACCEPTED_BOLETO}    10s    error=Boleto card is not visible
    Should Contain    ${ACCEPTED_BOLETO}    Boleto

    Scroll Element Into View    ${ACCEPTED_PIX}
    Wait Until Element Is Visible    ${ACCEPTED_PIX}    10s    error=Pix card is not visible
    Should Contain    ${ACCEPTED_PIX}    Pix

    Scroll Element Into View    ${ACCEPTED_DEBIT_CARD}
    Wait Until Element Is Visible    ${ACCEPTED_DEBIT_CARD}    10s    error=Pix card is not visible
    Should Contain    ${ACCEPTED_DEBIT_CARD}    Débito

    Scroll Element Into View    ${ACCEPTED_LIVELO}
    Wait Until Element Is Visible    ${ACCEPTED_LIVELO}    10s    error=Pix card is not visible
    Should Contain    ${ACCEPTED_LIVELO}    Livelo
