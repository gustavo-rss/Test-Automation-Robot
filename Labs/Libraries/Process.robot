*** Settings ***
Documentation   http://robotframework.org/robotframework/latest/libraries/Process.html
Library         Process

*** Test Cases ***
TC01 - Opening a program
    Open and close the Notepad

*** Keywords ***
Open and close the Notepad
    ${MY_PROCESS}     Start Process  chmod   /System/Applications/TextEdit.app
    Sleep  3s
    Terminate Process   ${MY_PROCESS}   kill=True

