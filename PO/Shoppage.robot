*** Settings ***
#Documentation    all the page objects and keywords of landing pages

Library         SeleniumLibrary
Library    Collections



*** Variables ***

${Shop_page_load}       css:.nav-link



*** Keywords ***

Wait Until Element Is located in the page
    Wait until Element passed is located on page        ${Shop_page_load}


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
    ${index} =      Set Variable        1

    FOR     ${element}      IN      @{elements}
            Exit For Loop If        '${cardName}' == '${element.text}'
            ${index} =      Evaluate        ${index} + 1
    END
    Click Button        xpath:(//*[@class='card-footer'])[${index}]/button