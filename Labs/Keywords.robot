*** Test Cases ***
Testing FOR
    Simple animal list
    Registering products
    Creates translation dictionary
    Enumerating list item
    FOR in both ranges informed
    FOR in only superior range informed
    FOR in arithmetic
    FOR in specific intervals


*** Keywords ***
Simple animal list
    FOR    ${animal}    IN    cat    dog    horse
        Log    The animal in this run is: ${animal}
        Log    The next animal is...
    END

Registering products
    FOR    ${product}    IN    dress    shirt    blouse
        Logs the size of the product    ${product}
    END

Logs the size of the product
    [Arguments]    ${product}
    FOR    ${size}    IN    S    M    L
        Log    Product: ${product} - Size: ${size}
    END

Creates translation dictionary
    FOR    ${index}    ${english}    ${finish}    ${portuguese}    IN
    ...    1    cat    kissa    gato
    ...    2    dog    koira    cachorro
    ...    3    horse    hevonen    cavalo
        Log    Animal ${index}\nIn English: ${english}\nIn finish: ${finish}\nIn portuguese: ${portuguese}
    END

Enumerating list item
    FOR    ${index}    ${item}    IN ENUMERATE    S    M    L    XL    XXL
        Log    List item: ${item} - Position of the item in list: ${index}
    END

FOR in both ranges informed
    [Documentation]    Iterates from 1 to 10
    FOR    ${index}    IN RANGE    1    11
        Log    ${index}
    END

FOR in only superior range informed
    [Documentation]    Iterates from 0 to 9
    FOR    ${index}    IN RANGE    10
        Log    ${index}
    END

FOR in arithmetic
    [Documentation]    Iterates from 0 to 5
    ${var}    Set Variable    ${5}
    FOR    ${index}    IN RANGE    ${var} + 1
        Log    ${index}
    END

FOR in specific intervals
    [Documentation]    Iterates from 0 to 30, jumping 5 in 5
    FOR    ${index}    IN RANGE    0    31    5
        Log    ${index} 
    END