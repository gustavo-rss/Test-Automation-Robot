*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Locators.robot
Resource    CommonWeb.robot


*** Keywords ***
Access the homepage from Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    ${HEADER_PRIME}    10s    error=Header "Prime" not displayed

Access the header category "Prime"
    Click Element    ${HEADER_PRIME}

Verify if page title is "${TITLE}"
    Wait Until Page Contains    ${TITLE}    10s    error=Page does not contain "${TITLE}"
    Title Should Be    ${TITLE}    error=Page title is not "${TITLE}"

Verify the benefit "${BENEFIT}" is present
    Element Should Be Visible
    ...    XPATH=//div[@class='card-title'][contains(.,'${BENEFIT}')]
    ...    error=Benefit "${BENEFIT}" not displayed

Type in the search field "${PRODUCT}"
    Input Text    ${SEARCH_BAR}    ${PRODUCT}

Click on search button
    Click Element    ${SEARCH_BUTTON}

Verify if the product is "${PRODUCT}"
    Wait Until Element Is Visible
    ...    XPATH=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUCT}')]
    ...    10s    error=Product "${PRODUCT}" not displayed
