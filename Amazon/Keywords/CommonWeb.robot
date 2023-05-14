*** Settings ***
Documentation       A library with common keywords for web testing.

Library             SeleniumLibrary
Library             Collections


*** Variables ***
${URL}          http://www.amazon.com.br
${BROWSER}      chrome


*** Keywords ***
Initiate browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Shutdown browser
    Close All Browsers
