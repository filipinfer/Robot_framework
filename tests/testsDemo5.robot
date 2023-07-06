*** Settings ***
#Documentation   To validate the login form
Library    SeleniumLibrary
Library     Collections
Library     ../customLibraries/Shop.py
Test Setup      open the browser with the Mortage payment url
#Test Teardown    Close Browser Session
Resource        ../PO/Generic.robot
Resource        ../PO/Landingpage.robot
Resource        ../PO/Shoppage.robot
Resource        ../PO/Checkoutpage.robot
Resource        ../PO/Confirmationpage.robot


*** Variables ***
@{listofProducts}       Blackberry      Nokia Edge
${country_name}     India



*** Test Cases ***


#Validate UnSuccesful Login

   #Landingpage.Fill The Login Form  ${user_name}    ${invalid_password}
   #Landingpage.Wait Until Element Is Located In The Page
   #Landingpage.verify error message is correct


Validate cards display in the shopping page
    Landingpage.Fill The Login Form  ${user_name}    ${valid_password}
    Shoppage.Wait Until Element Is Located In The Page
    Shoppage.Verify Card titles in the shop page
    Add Items To Cart And Checkout      ${listofProducts}
    Checkoutpage.verify items in the checkout page and proceed
    Confirmationpage.Enter the country and select the terms     ${country_name}
    Confirmationpage.Puchase the product and Confirm the purchase




    #Select the Card     BlackBerry





#Select the form and navigate to child window
   # Landingpage.Fill the login Details and form


#


























