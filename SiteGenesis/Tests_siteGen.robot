*** Settings ***
Resource        CSS_locators_siteGen.robot
Resource        Keywords_siteGen.robot
Test Setup      Open Website
Test Teardown   Close All Browsers

*** Test Cases ***
Credit Card Fail Purchase Full Flow
    Search Product                25585429
    Choose Product Color
    Choose Product Size
    Choose Product Quantity       1
    Add to Cart
    Go to Cart
    Go to Checkout
    Fill shipping info            Gustavo    Ramos    1924 Red Oak Dr    Modesto    95354    us    CA    2095265009
    Select Shipping Method
    Go to Billing
    Fill Billing Info             gustavo@test.com
    Select CC Payment Method      Gustavo    Visa    4111111111111111    1    2022    123
    Continue to Place Order
    Check Error Message           This Credit Card is expired

Paypal Success Purchase Full Flow
    Search Product                Beaded Cardigan
    Select Product From Search Results
    Choose Product Color
    Choose Product Size
    Choose Product Quantity       3
    Add to Cart
    Go to Cart
    Go to Checkout
    Fill shipping info            Gustavo    Ramos    1924 Red Oak Dr    Modesto    95354    us    CA    2095265009
    Select Shipping Method
    Go to Billing
    Fill Billing Info             gustavo@test.com
    Select Paypal Payment Method
    Continue to Place Order
    Place Order
    Check Order Review Page       Thank you for your order.

Product Price Consistency Full Flow
    Search Product                 Jeans
    Get PLP Product Price
    Compare PLP price
    Select Product From Search Results
    Get PDP Product Price
    Compare PDP price
    Choose Product Color
    Choose Product Size
    Add to Cart
    Go to Cart
    Get Cart Product Price
    Compare Cart Product Price
    Go to Checkout
    Get Checkout Summary Product Price
    Compare Checkout Summary Product Price
    Fill Shipping Info             Gustavo    Ramos    1924 Red Oak Dr    Modesto    95354    us    CA    2095265009
    Select Shipping Method
    Go to Billing
    Fill Billing Info              gustavo@test.com
    Select Paypal Payment Method
    Continue to Place Order
    Place Order
    Check Order Review Page        Thank you for your order.
    Get Order Review Price
    Compare Order Review Product Price
    Compare Full Flow Prices