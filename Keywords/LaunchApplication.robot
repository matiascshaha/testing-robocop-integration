*** Settings ***
Resource    ../TestData/TestConfig.robot
Library     SeleniumLibrary


*** Keywords ***
Launch Application
    [Documentation]    Launch the application and verify that it is loaded successfully.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    //input[@name='username']    10
    Log    Application launched successfully.

Clear SUT To Initial State
    Close Browser
