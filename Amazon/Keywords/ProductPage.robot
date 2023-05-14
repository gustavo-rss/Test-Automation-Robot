*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Locators.robot
Resource    ./ProductResults.robot


*** Keywords ***
Add product "${PRODUCT}" to cart
    Click on the first product result for ${PRODUCT}
    Wait Until Element Is Enabled    ${ADD_TO_CART}    10s    error=Add to cart button is not visible
    Click Element    ${ADD_TO_CART}
