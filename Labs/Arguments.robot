*** Test Cases ***
Positional arguments and declared arguments
    Using basic arguments    1    2    3    4
    Using basic arguments    arg4=1    arg3=2    arg2=3    arg1=4

Testing optional argumens
    Using optional arguments as parameters    name=Gustavo    last_name=Silva
    Using optional arguments as parameters    name=Gustavo    middle_name=Ramos    last_name=Silva

Creating list and dictionary from arguments
    [Documentation]    Known as "kwargs" in Python
    Creating a dictionary    cwd=/home/user    shell=True    env=False
    Creating a list    john    william    peter
    Creating dictionary and list    john    william    peter    shell=True    env=False


*** Keywords ***
Using basic arguments
    [Arguments]    ${arg1}    ${arg2}    ${arg3}    ${arg4}
    Log    ${arg1} - ${arg2} - ${arg3} - ${arg4}

Using optional arguments as parameters
    ### Optional parameters are always the last ones
    [Arguments]    ${name}    ${last_name}    ${middle_name}=Doe
    Log    Full name: ${name} ${middle_name} ${last_name}

Creating a dictionary
    ### Only one dictionary can be created
    [Arguments]    &{my_dictionary}
    Log    ${my_dictionary}

Creating a list
    ### Only one list can be created
    [Arguments]    @{my_list}
    Log    ${my_list}

Creating dictionary and list
    ### The list comes first
    [Arguments]    @{my_list}    &{my_dictionary}
    Log    ${my_list}\n${my_dictionary}
