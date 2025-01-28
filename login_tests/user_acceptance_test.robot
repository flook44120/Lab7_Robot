*** Settings ***
Library    SeleniumLibrary
Library    selenium.webdriver.chrome.service

*** Variables ***
${SERVER}         localhost:7272
${URL}    http://${SERVER}/Form.html
${BROWSER}    Chrome
${CHROMEDRIVER}    C:/WebDriver/chromedriver.exe  

*** Keywords ***
Open Chrome Browser
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service('${CHROMEDRIVER}')    sys, selenium.webdriver.chrome.service
    Create Webdriver    Chrome    service=${service}
    Go To    ${URL}

*** Test Cases ***

✅ Test Case: กรอกข้อมูลครบถ้วน
    [Setup]    Open Chrome Browser
    Input Text    id=firstname    Somsong
    Input Text    id=lastname    Sandee
    Input Text    id=destination    Europe
    Input Text    id=contactperson    Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=email    somsong@kkumail.com
    Input Text    id=phone    081-111-1234
    Click Button    id=submitButton
    Wait Until Page Contains    Our agent will contact you shortly.
    Capture Page Screenshot    result_กรอกข้อมูลครบถ้วน.png
    [Teardown]    Close Browser
