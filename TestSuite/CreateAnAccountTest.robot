*** Settings ***
Library             BuiltIn
Library             SeleniumLibrary
Library             AllureLibrary
Resource            ../Keywords/LaunchApplication.robot
Resource            ../Keywords/CreateAnAccountKeywords.robot

Suite Setup         Setup Suite
Suite Teardown      Teardown Suite
Test Setup          Setup Test
Test Teardown       Teardown Test


*** Variables ***
${URL}          https://example.com
${BROWSER}      Chrome


*** Test Cases ***
Create A New Account With Valid Details
    [Documentation]    Verify that a user can create an account with valid details.
    [Tags]    hello
    Launch Application
    Enter Account Details    username    user@example.com    Password123
    Submit Account Creation
    Capture Page Screenshot
    [Teardown]    Clear SUT To Initial State

Create An Account With Invalid Email
    [Documentation]    Verify that the system rejects account creation with an invalid email address.
    [Tags]    hello2
    Launch Application
    Enter Account Details    username    invalid-email    Password123
    Submit Account Creation
    Capture Page Screenshot
    Verify Error Message Is Displayed
    [Teardown]    Clear SUT To Initial State


*** Keywords ***
Setup Suite
    [Documentation]    Suite-level setup steps, e.g., start logging.
    Log    Starting the test suite...

Teardown Suite
    [Documentation]    Suite-level teardown steps, e.g., stop logging.
    Log    Test suite completed.

Setup Test
    [Documentation]    Test-level setup steps, e.g., open browser.
    Open Browser    ${URL}    ${BROWSER}

Teardown Test
    [Documentation]    Test-level teardown steps, e.g., close browser.
    Capture few
    Close Browser

Capture few
    ${filename}=    Get Timestamp
    Capture Page Screenshot    ../resources/screenshots/screenshot_${filename}.png
    Log    Screenshot captured: ../resources/screenshots/screenshot_${filename}.png

Clear SUT To Initial State
    [Documentation]    Reset the system to its initial state, ready for the next test.
    Log    Clearing system state...
    # Include steps to reset the application or clear any test data if needed.

Launch Application
    [Documentation]    Launch the application and verify that it is loaded successfully.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    //input[@name='username']    10
    Log    Application launched successfully.

Enter Account Details
    [Arguments]    ${username}    ${email}    ${password}
    Input Text    //input[@name='username']    ${username}
    Input Text    //input[@name='email']    ${email}
    Input Text    //input[@name='password']    ${password}
    Log    Account details entered.

Submit Account Creation
    Click Button    //button[@name='submit']
    Wait Until Element Is Visible    //div[@class='account-created']    10
    Log    Account creation submitted.

Verify Error Message Is Displayed
    Element Should Be Visible    //div[@class='error-message']    5
    Log    Error message displayed as expected.
