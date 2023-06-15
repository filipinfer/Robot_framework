*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser
#Documentation       To validate the login form
Library     SeleniumLibrary
#Test Teardown       Close Browser
Test Template       Validate UnSuccesful Login  ##link parametrize



#Resource
#Selenium

*** Variables ***
${Error_Message_Login}      css:.alert-danger


*** Test Cases ***      username        password
invalid username        fernanda        learning
invalid password        rahulshetty     1234
special characters      @#£%        learning


*** Keywords ***
Validate UnSuccesful Login
    [Arguments]     ${username}     ${password}
    open the browser with the Mortage payment url
    Fill the login form     ${username}     ${password}
    wait until it checks and display error message
    verify error message is correct

open the browser with the Mortage payment url
    Create Webdriver    Chrome  executable_path=/Users/ferna/driver_robot/chromedriver.exe
    Go To   https://rahulshettyacademy.com/loginpagePractise/
    #Open Browser      https://rahulshettyacademy.com/loginpagePractise/         chrome         options=add_experimental_option("detach", True)


Fill the login form
    [arguments]     ${username}     ${password}
    Input Text      id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn
    #Sleep    5 seconds


wait until it checks and display error message
    Wait Until Element Is Visible       ${Error_Message_Login}


verify error message is correct
   # ${result}=  Get Text     ${Error_Message_Login}
    #Should Be Equal As Strings    ${result}     Incorrect username/password.   # builtin
    Element Text Should Be       ${Error_Message_Login}      Incorrect username/password.














