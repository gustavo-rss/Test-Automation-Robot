*** Settings ***
Documentation       This suite contains regression tests for Amazon.com.br website

Resource            ../Keywords/AmazonKeywords.robot
Resource            ../Keywords/CommonWeb.robot

Test Setup          Initiate browser
Test Teardown       Shutdown browser


*** Test Cases ***
TC 01 - Access the "Prime" header category
    [Documentation]    This test verifies the "Prime" header category from Amazon.com.br nd verifies the benefits "Ler" and "Música"
    [Tags]    categories    gherkin
    Given Access the homepage from Amazon.com.br
    Then verify if page title is "Amazon.com.br | Tudo pra você, de A a Z."
    When Access the header category "Prime"
    Then verify if page title is "Amazon.com.br: Amazon Prime"
    And verify the benefit "Ler" is present
    And verify the benefit "Música" is present

TC 02 - Search for a product
    [Documentation]    This test verifies the search for a product and verifies the product page
    [Tags]    product_search    product_list    gherkin
    Given Access the homepage from Amazon.com.br
    Then verify if page title is "Amazon.com.br | Tudo pra você, de A a Z."
    When Type in the search field "Kindle"
    And Click on search button
    Then verify if page title is "Amazon.com.br : Kindle"
    And verify if the product is "Kindle"
