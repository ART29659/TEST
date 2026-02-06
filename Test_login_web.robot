*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}     https://www.saucedemo.com/
${BROWSER}         chrome

*** Test Cases ***
Login Button Click Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@placeholder='Username']    10s
    Input Text    xpath=//input[@placeholder='Username']    standard_user
    Input Text    xpath=//input[@placeholder='Password']    secret_sauce
    Click Button  xpath=//input[@id='login-button']
    Wait Until Page Contains Element    xpath=//h6[text()='Products']    10s
    Close Browser
