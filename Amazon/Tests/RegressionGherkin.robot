*** Settings ***
Documentation       This suite contains regression tests for Amazon.com.br website

Resource            ../Keywords/CommonWeb.robot
Resource            ../Keywords/Header.robot
Resource            ../Keywords/PrimeCategory.robot
Resource            ../Keywords/ProductResults.robot
Resource            ../Keywords/ProductPage.robot
Resource            ../Keywords/Cart.robot
Resource            ../Keywords/Footer.robot

Test Setup          Initiate browser
Test Teardown       Shutdown browser


*** Test Cases ***
TC 01 - Access the "Prime" header category
    [Documentation]    This test verifies the "Prime" header category from Amazon.com.br nd verifies the benefits "Ler" and "Música".
    [Tags]    categories    gherkin
    Given access the homepage from Amazon.com.br
    Then verify if page title is "Amazon.com.br | Tudo pra você, de A a Z."
    When Access the header category "Prime"
    Then verify if page title is "Amazon.com.br: Amazon Prime"
    And verify the benefit "Ler" is present
    And verify the benefit "Música" is present

TC 02 - Search for a product
    [Documentation]    This test verifies the search for a product and verifies the product page.
    [Tags]    product_search    product_list    gherkin
    Given access the homepage from Amazon.com.br
    Then verify if page title is "Amazon.com.br | Tudo pra você, de A a Z."
    When type in the search field "Kindle"
    And click on search button
    Then verify if page title is "Amazon.com.br : Kindle"
    And verify if the product results contains "Kindle"

TC 03 - Add product to cart
    [Documentation]    This test searches for a product, opens its page, adds to cart and goes to cart page.
    [Tags]    cart
    Given access the homepage from Amazon.com.br
    When type in the search field "Breath Of The Wild"
    And click on search button
    Then verify if the product results contains "Breath Of The Wild"
    And add product "Breath Of The Wild" to cart
    And click on Cart from header
    Then verify if the product "Breath Of The Wild" was added to cart

TC 04 - Remove product from cart
    [Documentation]    This test searches for a product, opens its page, adds to cart, goes to cart page and removes the product.
    [Tags]    cart
    Given access the homepage from Amazon.com.br
    When type in the search field "Breath Of The Wild"
    And click on search button
    Then verify if the product results contains "Breath Of The Wild"
    And add product "Breath Of The Wild" to cart
    And click on Cart from header
    And verify if the product "Breath Of The Wild" was added to cart
    And remove product "Breath Of The Wild" from cart
    Then verify if the product "Breath Of The Wild" was removed from cart

TC 05 - Verify payment methods page
    [Documentation]    This test verifies all header categories
    [Tags]    footer    payment_methods
    Given Access the homepage from Amazon.com.br
    When Click on footer payment methods
    Then Verify accepted payment methods
