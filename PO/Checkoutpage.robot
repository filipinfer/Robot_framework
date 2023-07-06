*** Settings ***
#Documentation    all the page objects and keywords of landing pages

Library         SeleniumLibrary
Library    Collections



*** Variables ***

${Shop_page_load}       css:.nav-link



*** Keywords ***

Verify items in the Checkout page and proceed
   click element        css:.btn-success