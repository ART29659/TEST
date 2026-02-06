*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${YOUTUBE_URL}     https://www.youtube.com
${BROWSER}         chrome
${SEARCH_TERM}     Maroon 5 - Maps (Lyric Video)
${LOOP_COUNT}      3

*** Test Cases ***
Repeat YouTube Video Play 3 Times
    FOR    ${index}    IN RANGE    ${LOOP_COUNT}
        Log    --- Loop ${index + 1} ---
        Open And Play YouTube Video
        Sleep    2s    # พักก่อนวนรอบถัดไป
    END

*** Keywords ***
Open And Play YouTube Video
    Open Browser    ${YOUTUBE_URL}    ${BROWSER}
    Maximize Browser Window

    Wait Until Element Is Visible    name=search_query    10s
    Input Text    name=search_query    ${SEARCH_TERM}
    Press Keys    name=search_query    ENTER

    Wait Until Element Is Visible    xpath=(//a[@id='video-title'])[1]    10s
    Click Element    xpath=(//a[@id='video-title'])[1]

    Wait Until Element Is Visible    xpath=//video | //ytd-player    15s

    Sleep    11s
    reload page
    Wait Until Element Is Visible    xpath=//video | //ytd-player    15s
    Sleep    10s

    Capture Page Screenshot
    Close Browser