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
   Wait Until Element Is Visible    ${ACCEPTED_CREDIT_CARD}    10s    error=Credit card is not visible
   Element Text Should Be    ${ACCEPTED_CREDIT_CARD}    Crédito


