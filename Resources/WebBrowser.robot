*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Open Chrome Browser
    [Arguments]  ${url}
    Open Browser   ${url}  Chrome
    Maximize Browser Window
    Set Selenium Speed  2 seconds

Close Chrome Browser
    Close Browser