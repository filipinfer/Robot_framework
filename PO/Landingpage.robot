*** Settings ***
#Documentation    all the page objects and keywords of landing pages

Library         SeleniumLibrary
Resource        Generic.robot


*** Variables ***
${Error_Message_Login}  css:.alert-danger



*** Keywords ***

Fill the login form
    [arguments]     ${username}     ${password}
    Input Text      id:username   ${username}
    Input Password  id:password   ${password}
    Click Button    signInBtn


Wait until Element is located in the page
    Wait until Element passed is located on page        ${Error_Message_Login}


verify error message is correct
   ${result}=  Get Text     ${Error_Message_Login}
   Should Be Equal As Strings    ${result}     Incorrect username/password.   # builtin
   Element Text Should Be      ${Error_Message_Login}      Incorrect username/password.


Fill the login Details and form
    Input Text     id:username     rahulshettyacademy
    Input Password     id:password     learning
    Click Element      css:input[value='user']     #inform weblocator
    Wait Until Element Is Visible      css:.modal-body
    Click Element      okayBtn
    Click button      id:okayBtn
    Select From List By Value      css:select.form-control     teach   # from the dropdown
    Select Checkbox        terms
    Checkbox Should be Selected        terms