*** Settings ***
Documentation       http://robotframework.org/robotframework/latest/libraries/Process.html

Library             Process


*** Test Cases ***
TC01 - Opening a program
    Open and close the Notepad

TC02 - Executing a script file
    Execute a script and expect success
    Execute a script and expect failure

TC03 - Executing prompt commands
    Executing prompt commands

*** Keywords ***
Open and close the Notepad
    ${MY_PROCESS}    Start Process    C:\\WINDOWS\\system32\\notepad.exe
    Sleep    3s
    Terminate Process    ${MY_PROCESS}    kill=True

Verify process execution success
    [Arguments]    ${PROCESS}
    ## RC zero indicates SUCCESS in the process execution
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${PROCESS.rc}    0
    ...    msg=The process did not execute successfully
    ## IF fails logs the error
    IF    ${PROCESS.rc}!=0    Log    FAILURE: "${PROCESS.stderr}"

Execute a script and expect success
    ## Iniciates a process and waites for its end
    ${MY_PROCESS}    Run Process   python    hello_world.py
    Log    Execution result (success/failure): ${MY_PROCESS.rc}
    Log    Execution outcome: ${MY_PROCESS.stdout}
    Verify process execution success    ${MY_PROCESS}

Execute a script and expect failure
    ## Iniciates a process and waites for its end
    ${MY_PROCESS}    Run Process    python    hello_world_fail.py
    Log    Execution result (success/failure): ${MY_PROCESS.rc}
    Log    Execution outcome: ${MY_PROCESS.stdout}
    Log    Execution failure: ${MY_PROCESS.stderr}
    Verify process execution success    ${MY_PROCESS}

Executing prompt commands
    ## shell=True to enable shell functions,
    Run Process    mkdir robot_test   cwd=${CURDIR}   shell=True