*** Settings ***
Documentation       This suite contains regression tests for Amazon.com.br website

Resource            ../Keywords/AmazonKeywords.robot
Resource            ../Keywords/CommonWeb.robot

Test Setup          Initiate browser
Test Teardown       Shutdown browser


*** Test Cases ***
TC 01 - Access the "Prime" header category
    [Documentation]    This test verifies the "Prime" header category from Amazon.com.br nd verifies the benefits "Ler" and "Música"
    [Tags]    categories
    Access the homepage from Amazon.com.br
    Verify if page title is "Amazon.com.br | Tudo pra você, de A a Z."
    Access the header category "Prime"
    Verify if page title is "Amazon.com.br: Amazon Prime"
    Verify the benefit "Ler" is present
    Verify the benefit "Música" is present

TC 02 - Search for a product
    [Documentation]    This test verifies the search for a product and verifies the product page
    [Tags]    product_search    product_list
    Access the homepage from Amazon.com.br
    Type in the search field "Kindle"
    Click on search button
    Verify if page title is "Amazon.com.br : Kindle"
    Verify if the product is "Kindle"

# TC 03 - Access the "Kindle" product page
#    [Documentation]    This test verifies the "Kindle" product page
#    ...    and verifies the product price
