*** Settings ***
Documentation       http://robotframework.org/robotframework/latest/libraries/String.html

Library             String
Library             OperatingSystem


*** Test Cases ***
TC01 - Working with lines of a string
    Counting lines
    Getting specific line
    Getting specific line with word "line 01"
    Getting until a marker

TC02 - Manipulating a string
    Changing text values
    All lower case
    All capital letter


*** Keywords ***
Get the file
    ##Get file returns file content as a string
    ${FILE_CONTENT}    Get File    ./my_files/text_file_lines.txt
    RETURN    ${FILE_CONTENT}

Counting lines
    ${STRING}    Get the file
    ${LINES}    Get Line Count    ${STRING}
    Log    My file has ${LINES} lines

Getting specific line
    ${STRING}    Get the file
    ${LINE_3}    Get Line    ${STRING}    3
    Log    Line 03 content from file:\n"${LINE_3}"
    FOR    ${LINE_NUMBER}    IN RANGE    0    6
        ${LINE_CONTENT}    Get Line    ${STRING}    ${LINE_NUMBER}
        Log    Content from line ${LINE_NUMBER} of file:\n"${LINE_CONTENT}"
    END

Getting specific line with word "${WORD}"
    ${STRING}    Get the file
    ${LINE}    Get Lines Containing String    ${STRING}    ${WORD}
    Log    Line with ${WORD}:\n"${LINE}"

Getting until a marker
    ## ${SPACE} means a white space
    ${STRING}    Get the file
    ${LINE}    Get Line    ${STRING}    0
    ${START}    Fetch From Left    ${LINE}    0
    ${END}    Fetch From Right    ${LINE}    line${SPACE}
    Log    Start: "${START}"\nEnd:"${END}"\n\All together: "${START}${END}"

Changing text values
    ${TEXT}    Get the file
    ${NEW_TEXT}    Replace String
    ...    string=${TEXT}
    ...    search_for=My line
    ...    replace_with=My line content
    Log    Old text was:\n${TEXT}\nNew text is:\n${NEW_TEXT}
    Create File    ./my_files/my_new_file.txt    ${NEW_TEXT}

All lower case
    ${TEXT}    Get the file
    ${TEXT}    Convert To Lowercase    ${TEXT}
    Log    My lower case text:\n${TEXT}

All capital letter
    ${TEXT}    Get the file
    ${TEXT}    Convert To Uppercase    ${TEXT}
    Log    My capital letter text:\n${TEXT}
