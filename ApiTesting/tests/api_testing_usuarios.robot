*** Settings ***
Resource    ../resources/api_testing_usuarios.resource


*** Test Cases ***
TC 01: Successfully register a new user at ServeRest
    Create new user
    Register user created at ServeRest    email=${TEST_EMAIL}    status_code_desejado=201
    Verify if user was registered correctly

TC 02: Register an existing user
    Create new user
    Register user created at ServeRest    email=${TEST_EMAIL}    status_code_desejado=201
    Repeat user registration
    Verify if API doesn't allow duplicate user registration

TC 03: Consult data from a new user
    Create new user
    Register user created at ServeRest    email=${TEST_EMAIL}    status_code_desejado=201
    Consult new user data
    Check the returned data
