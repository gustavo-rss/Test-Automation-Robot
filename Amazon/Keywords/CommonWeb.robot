*** Settings ***
Documentation       A library with common keywords for web testing.

Resource            ../Resources/Locators.robot
Library             SeleniumLibrary


*** Variables ***
${URL}          http://www.amazon.com.br
${BROWSER}      chrome


*** Keywords ***
Initiate browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Access the homepage from Amazon.com.br

Shutdown browser
    Close All Browsers

Access the homepage from Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    ${HEADER_PRIME}    10s    error=Header "Prime" not displayed

Verify if page title is "${TITLE}"
    Wait Until Page Contains    ${TITLE}    10s    error=Page does not contain "${TITLE}"
    Title Should Be    ${TITLE}    error=Page title is not "${TITLE}"
