*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Locators.robot


*** Keywords ***
Access the header category "Prime"
    Click Element    ${HEADER_PRIME}

Verify the benefit "${BENEFIT}" is present
    Element Should Be Visible
    ...    XPATH=//div[@class='card-title'][contains(.,'${BENEFIT}')]
    ...    error=Benefit "${BENEFIT}" not displayed
