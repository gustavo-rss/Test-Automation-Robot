*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Locators.robot
Resource    ../Resources/Variables.robot


*** Keywords ***
Type in the search field "${PRODUCT}"
    Input Text    ${SEARCH_BAR}    ${PRODUCT}

Click on search button
    Click Element    ${SEARCH_BUTTON}

Click on Cart from header
    Wait Until Element Is Visible    ${HEADER_CART}    10s    error=Cart is not visible
    Click Element    ${HEADER_CART}

Click on footer payment methods
    Scroll Element Into View    ${PAYMENT_METHOD}
    Click Element    ${PAYMENT_METHOD}
    Wait Until Location Contains    footer_pay

Verify accepted payment methods
   Wait Until Element Is Visible    ${ACCEPTED_CREDIT_CARD}    10s    error=Credit card is not visible
   Element Text Should Be    ${ACCEPTED_CREDIT_CARD}    Crédito


