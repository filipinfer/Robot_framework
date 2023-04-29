*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser

Documentation       To validate the login form
Library     SeleniumLibrary
Test Setup      open the browser with the Mortage payment url
Test Teardown       Close Browser Session
Resource        resource.robot
#Selenium

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***

Validate UnSuccesful Login
    Fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***

Fill the login form
    Input Text      id:username   ${user_name}
    Input Password  id:password   ${invalid_password}
    Click Button    signInBtn
    #Sleep    5 seconds


wait until it checks and display error message
    Wait Until Element Is Visible       ${Error_Message_Login}


verify error message is correct
   # ${result}=  Get Text     ${Error_Message_Login}
    #Should Be Equal As Strings    ${result}     Incorrect username/password.   # builtin
    Element Text Should Be       ${Error_Message_Login}      Incorrect username/password.














