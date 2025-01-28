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

❌ Test Case: ไม่กรอกประเทศ
    [Setup]    Open Chrome Browser
    Input Text    id=firstname    Somsong
    Input Text    id=lastname    Sandee
    Input Text    id=contactperson    Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=email    somsong@kkumail.com
    Input Text    id=phone    081-111-1234
    Click Button    id=submitButton
    Wait Until Page Contains    *Please enter your destination!!
    Capture Page Screenshot    result_ไม่กรอกประเทศ.png
    [Teardown]    Close Browser

❌ Test Case: ใส่ Email ไม่ถูกต้อง
    [Setup]    Open Chrome Browser
    Input Text    id=firstname    Somsong
    Input Text    id=lastname    Sandee
    Input Text    id=destination    Europe
    Input Text    id=contactperson    Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=phone    081-111-1234
    Click Button    id=submitButton
    Wait Until Page Contains    Please enter a valid email!!
    Capture Page Screenshot    result_ไม่ใส่Email.png
    [Teardown]    Close Browser

❌ Test Case: ใส่ Email ไม่ถูกต้อง
    [Setup]    Open Chrome Browser
    Input Text    id=firstname    Somsong
    Input Text    id=lastname    Sandee
    Input Text    id=destination    Europe
    Input Text    id=contactperson    Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=email    somsong@
    Input Text    id=phone    081-111-1234
    Click Button    id=submitButton
    Wait Until Page Contains    Please enter a valid email!!
    Capture Page Screenshot    result_ใส่Emailไม่ถูกต้อง.png
    [Teardown]    Close Browser

❌ Test Case: ใส่เบอร์โทรไม่ถูกต้อง
    [Setup]    Open Chrome Browser
    Input Text    id=firstname    Somsong
    Input Text    id=lastname    Sandee
    Input Text    id=destination    Europe
    Input Text    id=contactperson    Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=email    somsong@kkumail.com
    Input Text    id=phone    191
    Click Button    id=submitButton
    Wait Until Page Contains    Please enter a valid phone number!!
    Capture Page Screenshot    result_ใส่เบอร์โทรไม่ถูกต้อง.png
    [Teardown]    Close Browser

❌ Test Case: ใส่เบอร์โทรไม่ถูกต้อง
    [Setup]    Open Chrome Browser
    Input Text    id=firstname    Somsong
    Input Text    id=lastname    Sandee
    Input Text    id=destination    Europe
    Input Text    id=contactperson    Sodsai Sandee
    Input Text    id=relationship    Mother
    Input Text    id=email    somsong@kkumail.com
    Input Text    id=phone    191
    Click Button    id=submitButton
    Wait Until Page Contains    Please enter a valid phone number!!
    Capture Page Screenshot    result_ใส่เบอร์โทรไม่ถูกต้อง.png
    [Teardown]    Close Browser