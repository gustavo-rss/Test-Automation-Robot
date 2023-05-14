*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Locators.robot


*** Keywords ***
Verify if the product "${PRODUCT}" was added to cart
    Wait Until Element Is Visible
    ...    XPATH=//span[@class='a-truncate-cut'][contains(.,'${PRODUCT}')]
    ...    10s
    ...    error=Product not added to cart

Remove product "${PRODUCT}" from cart
    Click Element    XPATH=//*[@data-action="delete"]//input[contains(@aria-label,'${PRODUCT}')]

Verify if the product "${PRODUCT}" was removed from cart
    Wait Until Element Is Not Visible
    ...    XPATH=//span[@class='a-truncate-cut'][contains(.,'${PRODUCT}')]
    ...    10s
    ...    error=Product not removed from cart
