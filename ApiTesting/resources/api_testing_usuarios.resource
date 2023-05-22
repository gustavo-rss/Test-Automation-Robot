*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections


*** Keywords ***
Create new user
    ${random_word}    Generate Random String    length=4    chars=[LETTERS]
    ${random_word}    Convert To Lower Case    ${random_word}
    Set Test Variable    ${TEST_EMAIL}    ${random_word}@emailtest.com
    Log    ${TEST_EMAIL}

Register user created at ServeRest
    [Arguments]    ${email}    ${status_code_desejado}
    ${body}    Create Dictionary
    ...    name=John Doe
    ...    email=${email}
    ...    password=1234
    ...    administrador=true
    Log    ${body}

    Create session at ServeRest

    ${resposnse}    POST On Session
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${status_code_desejado}

    Log    ${resposnse.json()}

    IF    ${response.status_code} == 201
        Set Test Variable    ${USER_ID}    ${resposnse.json()["_id"]}
    END

    Set Test Variable    ${RESPONSE}    ${resposnse.json()}

Create session at ServeRest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}

Verify if user was registered correctly
    Log    ${RESPONSE}
    Dictionary Should Contain Item    ${RESPONSE}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPONSE}    _id

Repeat user registration
    Register user created at ServeRest    email=${TEST_EMAIL}    status_code_desejado=400

Verify if API doesn't allow duplicate user registration
    Dictionary Should Contain Item    ${RESPONSE}    message    Este email já está sendo usado

Consult new user data
    ${consult_response}    GET On Session    alias=ServeRest    url=/usuarios/${USER_ID}    expected_status=200

    # Obtendo as propriedades do objeto response
    Log    ${consult_response.status_code}
    Log    ${consult_response.headers}
    Log    ${consult_response.elapsed}
    Log    ${consult_response.text}
    Log    ${consult_response.json()}

    Set Test Variable    ${CONSULT_RESP}    ${consult_response.json()}

Check the returned data
    Log    ${CONSULT_RESP}
    Dictionary Should Contain Item    ${CONSULT_RESP}    nome    John Doe
    Dictionary Should Contain Item    ${CONSULT_RESP}    email    ${TEST_EMAIL}
    Dictionary Should Contain Item    ${CONSULT_RESP}    password    1234
    Dictionary Should Contain Item    ${CONSULT_RESP}    administrador    true
    Dictionary Should Contain Item    ${CONSULT_RESP}    _id    ${USER_ID}
