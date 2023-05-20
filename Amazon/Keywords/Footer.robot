*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Locators.robot
Resource    ../Resources/Variables.robot


*** Keywords ***
Click on footer payment methods
    Scroll Element Into View    ${FOOTER_PAYMENT_METHODS}
    Click Element    ${FOOTER_PAYMENT_METHODS}
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
    Verify earn money with us footer section
    Verify payment footer section
    Verify let us help you footer section
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

Verify earn money with us footer section
    Wait Until Element Is Visible
    ...    ${FOOTER_SELL_ON_AMAZON}
    ...    10s
    ...    error=Sell on amazon footer section is not visible
    Wait Until Element Is Visible
    ...    ${FOOTER_PROTECT_BUILD_BRAND}
    ...    10s
    ...    error=Protect and build your brand footer section is not visible
    Wait Until Element Is Visible
    ...    ${FOOTER_PUBLISH_BOOKS}
    ...    10s
    ...    error=Publish your books footer section is not visible
    Wait Until Element Is Visible
    ...    ${FOOTER_BE_ASSOCIATE}
    ...    10s
    ...    error=Be an associate footer section is not visible
    Wait Until Element Is Visible
    ...    ${FOOTER_ADVERTISING}
    ...    10s
    ...    error=Advertise your products footer section is not visible

Verify payment footer section
    Wait Until Element Is Visible
    ...    ${FOOTER_PAYMENT_METHODS}
    ...    10s
    ...    error=Payment methods footer section is not visible
    Wait Until Element Is Visible
    ...    ${FOOTER_BUY_WITH_POINTS}
    ...    10s
    ...    error=Buy with points footer section is not visible

Verify let us help you footer section
    Wait Until Element Is Visible    ${FOOTER_AMAZON_COVID}    10s    error=Amazon Covid footer section is not visible
    Wait Until Element Is Visible    ${FOOTER_YOUR_ACCOUNT}    10s    error=Your accoount footer section is not visible
    Wait Until Element Is Visible    ${FOOTER_SHIP_RATES}    10s    error=Ship rates footer section is not visible
    Wait Until Element Is Visible    ${FOOTER_RETURNS}    10s    error=Returns footer section is not visible
    Wait Until Element Is Visible
    ...    ${FOOTER_CONTENT_DEVICES}
    ...    10s
    ...    error=Content and devices footer section is not visible
    Wait Until Element Is Visible    ${FOOTER_HELP}    10s    error=Help footer section is not visible

Verify footer logo
    Wait Until Element Is Visible    ${FOOTER_LOGO}    10s    error=Footer logo is not visible
