*** Settings ***
Documentation       To validate the login form
Library     SeleniumLibrary
Library     String
Test Setup      open the browser with the Mortage payment url
#Test Teardown       Close Browser
Library     Collections
Resource        resource.robot



*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***

Validate Child Window Functionality
    Select the link of child window     #test step
    Verify the user is Switched to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email


*** Keywords ***
Select the link of child window
    Click Element       css:.blinkingText
    Sleep       5

Verify the user is Switched to Child window
    Switch window       NEW
    Element Text Should Be      css:h1      DOCUMENTS REQUEST     #confirm that page was switched

Grab the Email id in the Child Window
    ${text}=        get text        css:.red     #all text will be stored in this variable
    @{words}=       Split String        ${text}     at
    #0 ->Please email u
    #1-> mentor@rahulshettyacademy.com with below template to receive response
    ${text_split}=      Get From List       ${words}        1
    @{words_2}=       Split String        ${text_split}
    #0->mentor@rahulshettyacademy.com
    ${Email}=      Get From List       ${words_2}        0
    Set Global Variable     ${Email}                #this variable can be used in any keyword

Switch to Parent window and enter the Email
    Switch window       MAIN
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input Text      id:username     ${Email}


















