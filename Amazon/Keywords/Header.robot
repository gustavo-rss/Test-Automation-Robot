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

Click on login from header
    Wait Until Element Is Visible    ${HEADER_ACC_LIST}
    Mouse Over    ${HEADER_ACC_LIST}
    Wait Until Element Is Visible    ${HEADER_LOGIN}
    Click Element    ${HEADER_LOGIN}
    Wait Until Element Is Visible    ${LOGIN_CONTINUE}    10s    error=Login continue button not displayed

Verify login error messages
    Click Element    ${LOGIN_CONTINUE}
    Wait Until Element Is Visible    ${LOGIN_MISSING_EMAIL_ERROR}     10s    error=Missing e-mail error message not displayed
    ${error_text}    Get Text    ${LOGIN_MISSING_EMAIL_ERROR}
    Element Text Should Be    ${error_text}    Digite seu e-mail ou número de telefone celular 