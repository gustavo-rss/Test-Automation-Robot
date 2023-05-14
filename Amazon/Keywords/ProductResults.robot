*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Locators.robot


*** Keywords ***
Verify if the product results contains "${PRODUCT}"
    Wait Until Element Is Visible
    ...    XPATH=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUCT}')]
    ...    10s    error=Product "${PRODUCT}" not displayed

Click on the first product result for ${PRODUCT}
    Wait Until Element Is Visible
    ...    XPATH=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUCT}')])[1]
    ...    10s    error=Product "${PRODUCT}" not displayed
    Click Element    XPATH=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUCT}')])[1]
