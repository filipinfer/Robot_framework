*** Settings ***
#Documentation    A ressource file with reusable keywords and variables.
#...
#...             The system specific keywords created here form our own
#...             domain specific language. They utilize keywords provided
#...             by the imported SeleniumLibrary.
Library         SeleniumLibrary
#Library    Collections


*** Variables ***
${url}               https://rahulshettyacademy.com/loginpagePractise/
${user_name}         rahulshettyacademy
${invalid_password}  12345
${valid_password}    learning


*** Keywords ***
open the browser with the Mortage payment url
    Create Webdriver    Chrome  executable_path=/Users/ferna/driver_robot/chromedriver.exe
    Go To   ${url}



Close Browser session
    #Capture Page Screenshot
    Close Browser Session




