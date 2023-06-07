*** Settings ***
Suite Teardown  Controling the suite teardown
Test Teardown   Controling the test teardown

*** Test Cases ***
#### Success
Working with Suite and Test Teardowns pass top of the run
    This keyword makes the test pass, not running bellow keywords
    This keyword will pass
    This keyword makes the test fail, not running bellow keywords

Working with Suite and Test Teardowns pass middle of the run
    This keyword will pass
    This keyword will pass
    This keyword will pass with a condition and stop executing bellow keywords
    This keyword will pass
    This keyword will pass

#### Fails
Working with Suite and Test Teardowns fail middle of the run
    This keyword will pass
    This keyword makes the test fail, not running bellow keywords
    This keyword will pass
    This keyword will fail

Working with Suite and Test Teardowns fail
    This keyword will fail

*** Keywords ***
### SUITE TEARDOWNS
Controling the suite teardown
    Run Keyword If All Tests Passed     Log  All of the tests passed
    Run Keyword If Any Tests Failed     Log  Some test failed

### TEST TEARDOWNS
Controling the test teardown
    Run Keyword If Test Passed          Log  My test has passed
    Run Keyword If Test Failed          Log  My test failed

### Working with status
This keyword makes the test pass, not running bellow keywords
    Pass Execution      message=Test is being forced to pass

This keyword makes the test fail, not running bellow keywords
    Fail                msg=Test is being forced to fail


This keyword will pass with a condition and stop executing bellow keywords
    ${STATUS}   Run Keyword And Return Status   Should Be True    "Gustavo" == "Gustavo"
    Log  ${STATUS}
    Pass Execution If    ${STATUS}    message=Gustavo is equal Gustavo so it passes

This keyword will pass
    Should Be True    "Gustavo" == "Gus"

This keyword will fail
    Should Be True    "Gustavo" == "Peter"
