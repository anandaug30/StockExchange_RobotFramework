*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/WebBrowser.robot
Resource  ../TestCases/FinanceHomePage.robot
Documentation   This test suite is to verify the yahoo finance
Suite Setup  Open Chrome Browser  ${url}
Suite Teardown  Close Chrome Browser
*** Variables ***
${url}   https://in.finance.yahoo.com/
${browser}   Chrome

*** Test Cases ***
TS001 Verify Finance Home Page
    [Tags]  Smoketest  Regression  Release1.1
   # [Setup]  Open Chrome Browser  ${url}
   # [Teardown]  Close Chrome Browser
    Verify Yahoo Finance
    Print Adds On Page

TS002 Verify BSE Sensex
    [Tags]  Smoketest  Regression  Release1.2  BSE
    Goto BSE SENSEX
    Search BSE Stock

TS003 Print BSE Summary
    [Tags]  BSE
    Get LSummary

TS004 Print Stock Summary
    [Tags]  Smoketest  Regression  Release1.3  BSE1
    Print Left Summary Details
    Print Right Summary Details