*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/ 
${BROWSER}        CHROME

*** Test Cases ***
Login Button Click Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@placeholder='Username']    10s
    Input Text    xpath=//input[@placeholder='Username']    Admin
    Input Text    xpath=//input[@placeholder='Password']    admin123
    Click Button  xpath=//button[@type='submit']
    Wait Until Page Contains Element    xpath=//h6[text()='Dashboard']    10s
    Close Browser
Create And View Leave Request
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@placeholder='Username']    10s
    Input Text    xpath=//input[@placeholder='Username']    Admin
    Input Text    xpath=//input[@placeholder='Password']    admin123
    Click Button  xpath=//button[@type='submit']
    Wait Until Page Contains Element    xpath=//h6[text()='Dashboard']    10s

    Go To    https://opensource-demo.orangehrmlive.com/web/index.php/leave/applyLeave

    Wait Until Element Is Visible    xpath=(//div[contains(@class,'oxd-select-text')])[1]    10s
    Click Element    xpath=(//div[contains(@class,'oxd-select-text')])[1]
    Wait Until Element Is Visible    xpath=//span[text()='US - Vacation']    5s
    Click Element    xpath=//span[text()='US - Vacation']

    Wait Until Element Is Visible    xpath=(//input[@placeholder='yyyy-mm-dd'])[1]    10s
    Input Text    xpath=(//input[@placeholder='yyyy-mm-dd'])[1]    2025-08-04
    Input Text    xpath=(//input[@placeholder='yyyy-mm-dd'])[2]    2025-08-09

    Input Text    xpath=//textarea    Test +1

    Click Button    xpath=//button[normalize-space()='Apply']

    Wait Until Page Contains    Successfully Submitted    15s

    Close Browser

View My Leave Requests
    [Documentation]    Log in and view list of previously submitted leave requests
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@placeholder='Username']    10s
    Input Text    xpath=//input[@placeholder='Username']    Admin
    Input Text    xpath=//input[@placeholder='Password']    admin123
    Click Button  xpath=//button[@type='submit']
    Wait Until Page Contains Element    xpath=//h6[text()='Dashboard']    20s
    Go To    https://opensource-demo.orangehrmlive.com/web/index.php/leave/viewMyLeaveList
    Wait Until Page Contains Element    xpath=//h5[text()='My Leave List']    20s
    Page Should Contain Element         xpath=//h5[text()='My Leave List']    20s