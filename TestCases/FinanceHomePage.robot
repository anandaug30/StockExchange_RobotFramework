*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verify Yahoo Finance
    [Tags]  smoketest  regression  release1.1
    Page Should Contain  BSE SENSEX
    Log  BSE SENSEX is visiable
    ${title}   Get Title
    Log  ${title}

Print Adds On Page
    @{webelements}  Get WebElements  xpath://ul/li/a
    ${count}  Get Element Count  xpath://ul/li/a
    Log To Console   ${count}
    #Log  ${webelements}
    : FOR   ${element}  IN  @{webelements}
    \   Log To Console  ${element.text}

Goto BSE SENSEX
    [Tags]  Smoketest
    Click Link  link:BSE SENSEX
    ${title}  Get Title
    Log   ${title}
    Set Selenium Speed  5 seconds
    Page Should Contain Element  xpath://input[@placeholder="Quote lookup"]
    Set Selenium Speed  5 seconds
   # Get Text  xpath://div[@id="quote-market-notice"]/span[contains(text(),"Market")]
    ${market_close_in}  Get Text  xpath://span[contains(text(),'India Markets')]
    Log Many  Indian Markets Close in  ${market_close_in}

Search BSE Stock
    Page Should Contain Element   xpath://input[@placeholder="Quote lookup"]
    Clear Element Text  xpath://input[@placeholder="Quote lookup"]
    Input Text  xpath://input[@placeholder="Quote lookup"]  INFY
    Click Button  xpath://button[@type='submit']
    Click Element  xpath://div//strong[contains(text(),"INFY")]
    Set Selenium Speed  5 seconds
    Page Should Contain Element   xpath://input[@placeholder="Quote lookup"]
   # Wait Until Element Contains  xpath://div/h1[contains(text(),'INFY')]   loading stock details   10 seconds    error=None
    ${closing}  Get Text    xpath://div[@class="D(ib) Mend(20px)"]/span[1]
    Log  ${closing}
    ${at}  Get Text    xpath://div[@class="D(ib) Mend(20px)"]/span[2]
    Log  ${at}

Print Left Summary Details
    Get Previous Close Value
    Get Open Value
    Get Bid Value
    Get Ask
    Get Days Range
    Get 52 Week Range
    Get Volume
    Get Volume

Print Right Summary Details
    Get Market Cap
    Get Beta 3Y
    Get PE Ration
    GET EPS
    Get Earnings Date
    Get Forward Divident and Yield
    Get Ex-Dividend Date
    Get 1Y Target EST




Get Previous Close Value
    ${value}  Get Text  xpath://div/table//td[@data-test='PREV_CLOSE-value']/span
    Log To Console  ${value}

Get Open Value
    ${value}  Get Text  xpath://div/table//td[@data-test='OPEN-value']/span
    Log To Console  ${value}

Get Bid Value
	${value}  Get Text  xpath://div/table//td[@data-test='BID-value']/span
	Log To Console  ${value}

Get Ask
	${value}  Get Text  xpath://div/table//td[@data-test='ASK-value']/span
	Log To Console  ${value}

Get Days Range
	${value}  Get Text  xpath://div/table//td[@data-test='DAYS_RANGE-value']/span
	Log To Console  ${value}

Get 52 Week Range
	${value}  Get Text  xpath://div/table//td[@data-test='FIFTY_TWO_WK_RANGE-value']/span
	Log To Console  ${value}

Get Volume
	${value}  Get Text  xpath://div/table//td[@data-test='TD_VOLUME-value']/span
	Log To Console  ${value}

Get Avg Volume
	${value}  Get Text  xpath://div/table//td[@data-test='AVERAGE_VOLOUME_3MONTH-value']/span
	Log To Console  ${value}

Get Market Cap
	${value}  Get Text  xpath://div/table//td[@data-test='MARKET_CAP-value']/span
	Log To Console  ${value}

Get Beta 3Y
	${value}  Get Text  xpath://div/table//td[@data-test='BETA_3Y-value']/span
	Log To Console  ${value}

Get PE Ration
	${value}  Get Text  xpath://div/table//td[@data-test='PE_RATIO-value']/span
	Log To Console  ${value}

GET EPS
	${value}  Get Text  xpath://div/table//td[@data-test='EPS_RATIO-value']/span
	Log To Console  ${value}

Get Earnings Date
	${value}  Get Text  xpath://div/table//td[@data-test='EARNINGS_DATE-value']/span
	Log To Console  ${value}

Get Forward Divident and Yield
	${value}  Get Text  xpath://div/table//td[@data-test='DIVIDEND_AND_YIELD-value']/span
	Log To Console  ${value}

Get Ex-Dividend Date
	${value}  Get Text  xpath://div/table//td[@data-test='EX_DIVIDEND_AND_DATE-value']/span
	Log To Console  ${value}

Get 1Y Target EST
	Get Text  xpath://div/table//td[@data-test='ONE_YEAR_TARGET_PRICE-value']/span
	Log To Console  ${value}

Get LSummary
    Get Table Cell  xpath://div/table/  1  2

Goto NIFTY50
   ${value}   Click Link  link:Nifty 50