*** Settings ***
Documentation   http://robotframework.org/robotframework/latest/libraries/DateTime.html
Library         DateTime

*** Test Cases ***
TC01 - Getting current date and time
    Getting the curret date
    Getting current date and time
    Getting year/ month/ day

TC02 - Manipulating the time
    Working with time

TC03- Calculus with dates
    Adding time to date
    Subtraindo tempo de data

*** Keywords ***
Getting the curret date
    ${CURRENT}    Get Current Date     result_format=%d-%m-%y
    Log         ${CURRENT}

Getting current date and time
    ${CURRENT}    Get Current Date     result_format=%Y-%m-%dT%H:%M:%S
    Log         ${CURRENT}

Getting year/ month/ day
    ${TODAY}     Get Current Date
    ${TODAY}     Convert Date   ${TODAY}   datetime
    Log         ${TODAY.day}-${TODAY.month}-${TODAY.year}

Working with time
    ${HOUR}     Convert Time	1 minute 30 seconds
    Log         There are ${HOUR} seconds in 1 minute and 30 seconds
    ${HOUR}     Convert Time	5400   verbose
    Log         5400 seconds are ${HOUR}
    ${HOUR}     Convert Time	5500   timer   exclude_millis=yes
    Log         5500 seconds are ${HOUR}

Adding time to date
    ${BEFORE}    Get Current Date
    ${AFTER}   Add Time To Date    ${BEFORE}   4 hours   result_format=%d-%m-%Y %H:%M:%S
    Log         Before: ${BEFORE} - After: ${AFTER}
    ${BEFORE}    Get Current Date
    ${AFTER}   Add Time To Date    ${BEFORE}   7 days    result_format=%d-%m-%Y %H:%M:%S
    Log         Before: ${BEFORE} - After: ${AFTER}

Subtraindo tempo de data
    ${BEFORE}    Get Current Date
    ${AFTER}   Subtract Time From Date    ${BEFORE}   25 minutes    result_format=%d-%m-%Y %H:%M:%S
    Log         Before: ${BEFORE} - After: ${AFTER}
    ${BEFORE}    Get Current Date
    ${AFTER}   Subtract Time From Date    ${BEFORE}   2 days        result_format=%d-%m-%Y %H:%M:%S
    Log         Before: ${BEFORE} - After: ${AFTER}
