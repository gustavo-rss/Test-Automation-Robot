*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Locators.robot


*** Keywords ***
Type in the search field "${PRODUCT}"
    Input Text    ${SEARCH_BAR}    ${PRODUCT}

Click on search button
    Click Element    ${SEARCH_BUTTON}

Click on Cart from header
    Wait Until Element Is Visible    ${HEADER_CART}    10s    error=Cart is not visible
    Click Element    ${HEADER_CART}
