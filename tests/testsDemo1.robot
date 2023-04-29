*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser


#Resource
#Selenium

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***

Validate UnSuccesful Login
    open the browser with the Mortage payment url
    Fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortage payment url
    Create Webdriver    Chrome  executable_path=/Users/ferna/Documents/chromedriver.exe
    Go To   https://rahulshettyacademy.com/loginpagePractise/
    #Open Browser      https://rahulshettyacademy.com/loginpagePractise/         chrome         options=add_experimental_option("detach", True)


Fill the login form
    Input Text      id:username   rahulshettyacademy
    Input Password  id:password   12345678
    Click Button    signInBtn
    #Sleep    5 seconds


wait until it checks and display error message
    Wait Until Element Is Visible       ${Error_Message_Login}


verify error message is correct
   # ${result}=  Get Text     ${Error_Message_Login}
    #Should Be Equal As Strings    ${result}     Incorrect username/password.   # builtin
    Element Text Should Be       ${Error_Message_Login}      Incorrect username/password.














