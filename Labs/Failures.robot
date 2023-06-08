*** Test Cases ***
#### Expected failures
Dealing with expected failures
    Keyword will fail, the test will pass and continue steps execution
    Keyword will fail with fatal error ending the whole test suite    Não pare, por favor!
    Keyword will fail and the fail is expected for passing
    Keyword will fail, the test will fail, but continue steps execution
    Keyword will fail with fatal error ending the whole test suite   Finish suite execution

Test to fill the suite 1
    No Operation

Test to fill the suite 2
    No Operation


*** Keywords ***
Keyword will fail, the test will pass and continue steps execution
    Run Keyword And Ignore Error    Should Be True    "Gustavo" == "Peter"
    Log    Continues the execution

Keyword will fail and the fail is expected for passing
    Run Keyword And Expect Error    '"Gustavo" == "Peter"' should be true.    Should Be True    "Gustavo" == "Peter"

Keyword will fail, the test will fail, but continue steps execution
    Run Keyword And Continue On Failure    Should Be True    "Gustavo" == "Peter"
    Log    Continues the execution
    Log    Continues the execution 
    

Keyword will fail with fatal error ending the whole test suite
    [Arguments]    ${STOP}
    IF    "${STOP}"=="Finish suite execution"
        Fatal Error    msg=Finish suite execution due to fatal error
    END
