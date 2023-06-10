*** Settings ***
Documentation       http://robotframework.org/robotframework/latest/libraries/OperatingSystem.html

Library             OperatingSystem


*** Test Cases ***
TC01 - Creating files
    Creating a text file
    Creating a JSON file

TC02 - Copying files
    Copying a file

TC03 - Reading files
    Read the file
    Read the binary

TC04 - Deleting files
    Listing directory files
    Deleting files    TEXT_file_copy.txt
    Deleting files    JSON_file_copy.json
    Listing directory files


*** Keywords ***
Creating a text file
    Create File    ./my_files/TEXT_file.txt    This is a dummy text for testing :)

Creating a JSON file
    Create File    ./my_files/JSON_file.json    {"test01": "value01", "test02": 2, "test03": [1, 2, 3]}

Copying a file
    Copy File    ./my_files/TEXT_file.txt    ./my_files/TEXT_file_copy.txt
    Copy File    ./my_files/JSON_file.json    ./my_files/JSON_file_copy.json

Read the file
    ## String is returned
    ${MY_FILE}    Get File    ./my_files/TEXT_file.txt
    ${SIZE}    Get File Size    ./my_files/TEXT_file.txt
    Log    ${MY_FILE}

Read the binary
    ## Binary is returned
    Should Exist    ./my_files/PDF_file.pdf    msg=File does not exist
    ${MY_FILE}    Get Binary File    ./my_files/PDF_file.pdf
    ${SIZE}    Get File Size    ./my_files/PDF_file.pdf
    Log    ${MY_FILE}

Listing directory files
    List Directory    ./my_files

Deleting files
    [Arguments]    ${FILE}
    Remove File    ./my_files/${FILE}
