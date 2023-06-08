*** Settings ***
Library         DateTime
Test Teardown   Teardown of the test
Test Timeout    1 seconds

*** Test Cases ***
#### TIMEOUT
Dealing with test timeout
    Simulates test waits    2s

#### ESPERANDO UMA KEYWORD
Waiting test
    [Timeout]   2 minutes
    Waites until keyword succeeds

*** Keywords ***
Teardown of the test
    Run Keyword If Timeout Occurred     Log  Esse teste demorou demais, possível problema de performance!

Simulates test waits
    [Arguments]     ${TIME}
    Sleep           ${TIME}

Waites until keyword succeeds
    Wait Until Keyword Succeeds    60x   1 seconds   This keyword will succeed at 15 seconds

This keyword will succeed at 15 seconds
    ${CURRENT_TIME}   Get Current Date    result_format=datetime
    Log    Current hour: ${CURRENT_TIME.hour}\nCurrent minute: ${CURRENT_TIME.minute}\nCurrent second: ${CURRENT_TIME.second}
    Run Keyword If    "${CURRENT_TIME.second}"!="15"    Fail    msg=We are not at 15 seconds
