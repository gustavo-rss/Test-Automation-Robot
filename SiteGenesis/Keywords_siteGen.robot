*** Settings ***
Library         SeleniumLibrary
Library         String
Library         Collections
Resource        CSS_locators_siteGen.robot

*** Keywords ***
Open Website
    Open Browser  http://production-sitegenesis-dw.demandware.net/s/SiteGenesis/home?lang=en_US  chrome
    Maximize Browser Window

Search Product
    [Arguments]  ${product}
    Wait Until Page Contains Element      ${search_bar}                  20s  error= Search Bar Not Found
    Clear Element Text                    ${search_bar}
    Input Text                            ${search_bar}                  ${product}
    Wait Until Page Contains Element      ${search_suggestion}           5s   error= ${product} Not Found
    Get Search Product Price
    Click Element                         ${search_button}

Search Product Price
    [Arguments]  ${product}
    Wait Until Page Contains Element      ${search_bar}                  20s  error= Search Bar Not Found
    Clear Element Text                    ${search_bar}
    Input Text                            ${search_bar}                  ${product}
    Wait Until Page Contains Element      ${search_suggestion}           5s   error= ${product} Not Found
    Get Search Product Price
    Log    ${productPrice}

Get Search Product Price
    Wait Until Element Is Visible         ${search_product_price}        5s   error= Product Price Not Found
    ${productPrice}  Get Text             ${search_product_price}
    ${productPrice}  Fetch From Right     ${productPrice}    $
    ${productPrice}  Set Test Variable    ${productPrice}

Get PLP Product Price
    Wait Until Element Is Visible         ${PLP_product_price}           5s   error= PLP Product Price Not Found
    ${plp_price}    Get Text              ${PLP_product_price}
    ${plp_price}    Fetch From Right      ${plp_price}    $
    ${plp_price}    Set Test Variable     ${plp_price}

Compare PLP price
    Wait Until Element Is Visible         ${PLP_product_price}           5s   error= PLP Product Price Not Found
    Should Be Equal As Numbers            ${plp_price}    ${productPrice}
    Log    PLP Price:${plp_price} is equal Product Price:${productPrice}

Get PDP Product Price
    Wait Until Page Contains Element      ${PDP_product_details}         20s  error= Product Details Page Not Found
    ${pdp_price}    Get Text              ${PDP_product_price}
    ${pdp_price}    Fetch From Right      ${pdp_price}    $
    ${pdp_price}    Set Test Variable     ${pdp_price}

Compare PDP price
     Wait Until Element Is Visible        ${PDP_product_price}           5s   error= PDP Product Price Not Found
     Should Be Equal As Numbers           ${pdp_price}    ${productPrice}
     Log    PDP Price:${pdp_price} is equal Product Price:${productPrice}

Get Cart Product Price
    Wait Until Element Is Visible         ${cart_product_price}          5s   error= Cart Product Price Not Found
    ${cart_price}    Get Text             ${cart_product_price}
    ${cart_price}    Fetch From Right     ${cart_price}    $
    ${cart_price}    Set Test Variable    ${cart_price}

Compare Cart Product Price
    Wait Until Element Is Visible         ${cart_product_price}          5s   error= Cart Product Price Not Found
    Should Be Equal As Numbers            ${cart_price}    ${productPrice}
    Log    Cart Price:${cart_price} is equal Product Price:${productPrice}

Get Checkout Summary Product Price
    Wait Until Element Is Visible            ${shipping_summary_price}      5s   error= Checkout Summary Product Price Not Found
    ${summary_price}    Get Text             ${shipping_summary_price}
    ${summary_price}    Fetch From Right     ${summary_price}    $
    ${summary_price}    Set Test Variable    ${summary_price}

Compare Checkout Summary Product Price
    Wait Until Element Is Visible            ${shipping_summary_price}      5s   error= Checkout Summary Product Price Not Found
    Should Be Equal As Numbers               ${summary_price}    ${productPrice}
    Log    Checkout Summary Price:${summary_price} is equal Product Price:${productPrice}

Get Order Review Price
    Wait Until Element Is Visible            ${order_review_product_price}  5s   error= Order Review Product Price Not Found
    ${review_price}    Get Text              ${order_review_product_price}
    ${review_price}    Fetch From Right      ${review_price}    $
    ${review_price}    Set Test Variable     ${review_price}

Compare Order Review Product Price
    Wait Until Element Is Visible            ${order_review_product_price}  5s   error= Order Review Product Price Not Found
    Should Be Equal As Numbers               ${review_price}    ${productPrice}
    Log    Order Review Price:${review_price} is equal Product Price:${productPrice}

Compare Full Flow Prices
    Should Be Equal As Numbers               ${plp_price}        ${productPrice}
    Should Be Equal As Numbers               ${pdp_price}        ${productPrice}
    Should Be Equal As Numbers               ${cart_price}       ${productPrice}
    Should Be Equal As Numbers               ${summary_price}    ${productPrice}
    Should Be Equal As Numbers               ${review_price}     ${productPrice}
    ${prices}   Create Dictionary  PLP=${plp_price}    PDP=${pdp_price}    Cart=${cart_price}   Checkout Summary=${summary_price}    Order Review=${review_price}
    Log    ${prices} is equal Product Price:${productPrice}

Select Product From Search Results
    Wait Until Page Contains Element         ${search_first_product}        20s  error= No Products Found
    Click Element                            ${search_first_product}

Choose Product Color
    Wait Until Page Contains Element         ${PDP_product_details}         20s  error= Product Details Page Not Found
    ${selectedCount}=   Get Element Count    ${PDP_color_selected}
    Run Keyword If    ${selectedCount} == 0
    ...    Click Element    ${PDP_color_selector}
    Wait Until Page Contains Element         ${PDP_color_selected}          5s   error= Color Not Selected

Choose Product Size
    Wait Until Page Contains Element    ${PDP_product_details}           20s  error= Product Details Page Not Found
    Click Element                       ${PDP_size_selector}
    Wait Until Page Contains Element    ${PDP_size_selected}             5s   error= Size Not Selected

Choose Product Quantity
    [Arguments]  ${quantity}
    Wait Until Page Contains Element    ${PDP_quantity}                  5s   error= Quantity Field Not Found
    Clear Element Text                  ${PDP_quantity}
    Input Text                          ${PDP_quantity}                  ${quantity}
    Handle Alert

Add to Cart
    Wait Until Element Is Not Visible   ${PDP_add_cart_disabled}         5s   error= Add to Cart Button is Disabled
    Click Element                       ${PDP_add_cart}

Go to Cart
    Wait Until Page Contains Element    ${minicart_icon}                 5s   error= Mini Cart Not Found
    Click Link                          ${minicart_icon}

Go to Checkout
    Wait Until Element Is Visible       ${cart_page}                     20s  error= Cart Page Not Found
    Click Element                       ${cart_top_checkout}
    Wait Until Page Contains Element    ${checkout_login_page}           20s  error= Checkout Login Page Not Found
    Click Element                       ${checkout_guest}

Fill Shipping Info
    [Arguments]  ${firstName}    ${lastName}    ${address1}    ${city}    ${postal}    ${country}    ${state}    ${phone}
    Wait Until Page Contains Element    ${shipping_form}                 20s  error= Shipping Page Not Found
    Clear Element Text                  ${shipping_first_name}
    Input Text                          ${shipping_first_name}           ${firstName}
    Clear Element Text                  ${shipping_last_name}
    Input Text                          ${shipping_last_name}            ${lastName}
    Clear Element Text                  ${shipping_address1}
    Input Text                          ${shipping_address1}             ${address1}
    Clear Element Text                  ${shipping_city}
    Input Text                          ${shipping_city}                 ${city}
    Clear Element Text                  ${shipping_postal}
    Input Text                          ${shipping_postal}               ${postal}
    Select From List By Value           ${shipping_country}              ${country}
    Select From List By Value           ${shipping_state}                ${state}
    Clear Element Text                  ${shipping_phone}
    Input Text                          ${shipping_phone}                ${phone}
    Select Checkbox                     ${shipping_same_billing}
    Click Element                       ${shipping_not_gift}

Select Shipping Method
    Wait Until Page Contains Element    ${shipping_method1}              5s   error= Shipping Method 01 Not Found
    Click Element                       ${shipping_method1}

Go to Billing
    Wait Until Page Contains Element    ${shipping_continue_billing}     5s   error= Continue to Billing Button Not Found
    Click Element                       ${shipping_continue_billing}

Fill Billing Info
    [Arguments]  ${email}
    Wait Until Page Contains Element    ${billing_form}                  20s  error= Billing Page Not Found
    Clear Element Text                  ${billing_email}
    Input Text                          ${billing_email}                 ${email}

Select CC Payment Method
    [Arguments]  ${creditCardName}    ${creditCardFlag}    ${creditCardNumber}    ${creditCardMonth}    ${creditCardYear}    ${creditCardCvn}
    Wait Until Page Contains Element    ${billing_method_credit}         5s   error= Credit Card Method Not Found
    Click Element                       ${billing_method_credit}
    Clear Element Text                  ${billing_card_owner}
    Input Text                          ${billing_card_owner}            ${creditCardNumber}
    Select From List By Value           ${billing_card_flag}             ${creditCardFlag}
    Clear Element Text                  ${billing_card_number}
    Input Text                          ${billing_card_number}           ${creditCardNumber}
    Select From List By Value           ${billing_card_month}            ${creditCardMonth}
    Select From List By Value           ${billing_card_year}             ${creditCardYear}
    Clear Element Text                  ${billing_card_cvn}
    Input Text                          ${billing_card_cvn}              ${creditCardCvn}
    Wait Until Element Is Not Visible   ${billing_place_order_disabled}  5s   error= Place Order Button is Disabled
    Click Element                       ${billing_place_order}

Select Paypal Payment Method
    Wait Until Page Contains Element    ${billing_method_paypal}         5s   error= Paypal Method Not Found
    Click Element                       ${billing_method_paypal}

Continue to Place Order
    Wait Until Element Is Not Visible   ${billing_place_order_disabled}  5s   error= Place Order Button is Disabled
    Click Element                       ${billing_place_order}

Place Order
    Wait Until Page Contains Element    ${place_order_page}              20s  error= Place Order Page Not Found
    Click Element                       ${place_order_button}

Check Order Review Page
    [Arguments]  ${expectedMessage}
    Wait Until Element Is Visible       ${order_review_confirmation}     20s  error= Order Review Message Not Displayed
    Page Should Contain                 ${expectedMessage}

Check Error Message
    [Arguments]  ${expectedError}
    Wait Until Element Is Visible           ${billing_error_message}     20s  error= Order Review Message Not Displayed
    SeleniumLibrary.Element Text Should Be  ${billing_error_message}     ${expectedError}
