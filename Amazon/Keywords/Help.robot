*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Locators.robot


*** Keywords ***
Search for a new solution
    [Arguments]    ${solution}
    Wait Until Element Is Visible
    ...    ${FIND_MORE_SOLUTIONS}
    ...    10s
    ...    error=Find More solutions search bar not displayed
    Input Text    ${FIND_MORE_SOLUTIONS}    ${solution}
    Press Keys    ${FIND_MORE_SOLUTIONS}    RETURN 

    Wait Until Element Is Visible
    ...    ${MORE_SOLUTIONS_RESULTS}
    ...    10s
    ...    error=Search results not displayed
    ${displayed_results}    Get Text    ${MORE_SOLUTIONS_RESULTS}
    Should Contain    ${displayed_results}    ${solution}
