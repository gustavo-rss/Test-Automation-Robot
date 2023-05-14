*** Settings ***
Documentation       This suite contains regression tests for Amazon.com.br website

Resource            ../Keywords/CommonWeb.robot
Resource            ../Keywords/Header.robot
Resource            ../Keywords/PrimeCategory.robot
Resource            ../Keywords/ProductResults.robot
Resource            ../Keywords/ProductPage.robot
Resource            ../Keywords/Cart.robot

Test Setup          Initiate browser
Test Teardown       Shutdown browser


*** Test Cases ***
TC 01 - Access the "Prime" header category
    [Documentation]    This test verifies the "Prime" header category from Amazon.com.br nd verifies the benefits "Ler" and "Música".
    [Tags]    categories
    Access the homepage from Amazon.com.br
    Verify if page title is "Amazon.com.br | Tudo pra você, de A a Z."
    Access the header category "Prime"
    Verify if page title is "Amazon.com.br: Amazon Prime"
    Verify the benefit "Ler" is present
    Verify the benefit "Música" is present

TC 02 - Search for a product
    [Documentation]    This test verifies the search for a product and verifies the product page.
    [Tags]    product_search    product_results
    Access the homepage from Amazon.com.br
    Type in the search field "Kindle"
    Click on search button
    Verify if page title is "Amazon.com.br : Kindle"
    Verify if the product results contains "Kindle"

TC 03 - Add product to cart
    [Documentation]    This test searches for a product, opens its page, adds to cart and goes to cart page.
    [Tags]    cart
    Access the homepage from Amazon.com.br
    Type in the search field "Breath Of The Wild"
    Click on search button
    Verify if the product results contains "Breath Of The Wild"
    Add product "Breath Of The Wild" to cart
    Click on Cart from header
    Verify if the product "Breath Of The Wild" was added to cart

TC 04 - Remove product from cart
    [Documentation]    This test searches for a product, opens its page, adds to cart, goes to cart page and removes the product.
    [Tags]    cart
    Access the homepage from Amazon.com.br
    Type in the search field "Breath Of The Wild"
    Click on search button
    Verify if the product results contains "Breath Of The Wild"
    Add product "Breath Of The Wild" to cart
    Click on Cart from header
    Verify if the product "Breath Of The Wild" was added to cart
    Remove product "Breath Of The Wild" from cart
    Verify if the product "Breath Of The Wild" was removed from cart
