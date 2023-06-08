*** Settings ***
#Documentation   To validate the login form
Library    SeleniumLibrary
Test Setup      open the browser with the Mortage payment url
#Test Teardown    Close Browser
Resource        resource.robot

#Documentation       To validate the login form
Library     SeleniumLibrary
Library    Collections
#Test Teardown       Close Browser Session
#Selenium


*** Variables ***
${Error_Message_Login}  css:.alert-danger
${Shop_page_load}       css:.nav-link

*** Test Cases ***

#Validate UnSuccesful Login

   # Fill the login form  ${user_name}    ${invalid_password}
    #Wait Until Element Is Located In The Page   ${Error_Message_Login}
    #verify error message is correct


Validate cards display in the shopping page

    Fill The Login Form  ${user_name}    ${valid_password}
    Wait Until Element Is Located In The Page     ${Shop_page_load}
    Verify Card titles in the shop page
    Select the Card     BlackBerry

*** Keywords ***

Fill the login form
    [arguments]     ${username}     ${password}
    Input Text      id:username   ${username}
    Input Password  id:password   ${password}
    Click Button    signInBtn
    #Sleep    5 seconds



Wait Until Element Is located in the page
    [arguments]     ${element}
    wait until element is visible       ${element}




verify error message is correct
   # ${result}=  Get Text     ${Error_Message_Login}
    #Should Be Equal As Strings    ${result}     Incorrect username/password.   # builtin
    Element Text Should Be      ${Error_Message_Login}      Incorrect username/password.

Verify Card titles in the shop page
    @{expectedList} =   Create List     iphone X        Samsung Note 8      Nokia Edge      Blackberry
    @{elements} =       Get WebElements     css:.card-title
    @{actualList} =     Create List

    FOR     ${element}      IN      @{elements}
        log     ${element.text}
        Append To List      ${actualList}       ${element.text}

    END
    Lists Should Be Equal    ${expectedList}        ${actualList}



Select the Card
    [Arguments]     ${cardName}
    ${elements} =       Get WebElements     css:.card-title
    ${index} =      Set Variable  

    FOR     ${element}      IN      @{elements}
            Exit For Loop If        '${cardName}' == '${element.text}'
            ${index} =      Evaluate        ${index} + 1


    END
    Click Button        xpath:(//*[@class='card-footer'])[${index}]/button












