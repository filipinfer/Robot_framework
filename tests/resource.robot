*** Settings ***
Documentation    A ressource file with reusable keywords and variables.
...
...             The system specific keywords created here form our own
...             domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary.
Library         SeleniumLibrary


*** Variables ***
${user_name}         rahulshettyacademy
${invalid_password}  12345
${url}               https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***
open the browser with the Mortage payment url
    Create Webdriver    Chrome  executable_path=/Users/ferna/Documents/chromedriver.exe
    Go To   ${url}

Close Browser session
    Close Browser Session




