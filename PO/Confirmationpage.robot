*** Settings ***
#Documentation    all the page objects and keywords of landing pages

Library         SeleniumLibrary
Library    Collections



*** Variables ***

${Shop_page_load}       css:.nav-link
${country_location}     //a[text()='India']


*** Keywords ***

Enter the country and select the terms
   [Arguments]      ${country_name}
   Input Text       country      ${country_name}
   sleep        4
   Wait until Element passed is located on page     //a[text()='${country_name}']
   #wait until element is visible     //a[text()='${country_name}']
   Sleep        5
   Click element        //a[text()='${country_name}']
   #Sleep        3
   Click element        css:.checkbox label

Puchase the product and Confirm the purchase
  Click Button     css:.btn-success
  Page should contain       Success!




