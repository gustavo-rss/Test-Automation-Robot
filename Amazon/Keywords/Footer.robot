*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Locators.robot
Resource    ../Resources/Variables.robot


*** Keywords ***
Click on footer payment methods
    Scroll Element Into View    ${PAYMENT_METHOD}
    Click Element    ${PAYMENT_METHOD}
    Wait Until Location Contains    footer_pay

Verify accepted payment methods
    Scroll Element Into View    ${ACCEPTED_CREDIT_CARD}
    Wait Until Element Is Visible    ${ACCEPTED_CREDIT_CARD}    10s    error=Credit card is not visible
    Should Contain    ${ACCEPTED_CREDIT_CARD}    Crédito

    Scroll Element Into View    ${ACCEPTED_BOLETO}
    Wait Until Element Is Visible    ${ACCEPTED_BOLETO}    10s    error=Boleto card is not visible
    Should Contain    ${ACCEPTED_BOLETO}    Boleto

    Scroll Element Into View    ${ACCEPTED_PIX}
    Wait Until Element Is Visible    ${ACCEPTED_PIX}    10s    error=Pix card is not visible
    Should Contain    ${ACCEPTED_PIX}    Pix

    Scroll Element Into View    ${ACCEPTED_DEBIT_CARD}
    Wait Until Element Is Visible    ${ACCEPTED_DEBIT_CARD}    10s    error=Pix card is not visible
    Should Contain    ${ACCEPTED_DEBIT_CARD}    Débito

    Scroll Element Into View    ${ACCEPTED_LIVELO}
    Wait Until Element Is Visible    ${ACCEPTED_LIVELO}    10s    error=Pix card is not visible
    Should Contain    ${ACCEPTED_LIVELO}    Livelo

Scroll to footer
    Scroll Element Into View    ${FOOTER_LOGO}

Verify all footer elements
    Verify get to know us footer section
    Verify footer logo

Verify get to know us footer section
    Wait Until Element Is Visible    ${FOOTER_CORPORATE_INFO}    10s    error=Corporate footer section is not visible
    Wait Until Element Is Visible    ${FOOTER_JOBS}    10s    error=Jobs footer section is not visible
    Wait Until Element Is Visible
    ...    ${FOOTER_PRESS_RELEASE}
    ...    10s
    ...    error=Press release footer section is not visible
    Wait Until Element Is Visible    ${FOOTER_COMMUNITY}    10s    error=Community footer section is not visible
    Wait Until Element Is Visible
    ...    ${FOOTER_ACCESSIBILITY}
    ...    10s
    ...    error=Accessibility footer section is not visible
    Wait Until Element Is Visible    ${FOOTER_SCIENCE}    10s    error=Science footer section is not visible

Verify footer logo
    Wait Until Element Is Visible    ${FOOTER_LOGO}    10s    error=Footer logo is not visible
