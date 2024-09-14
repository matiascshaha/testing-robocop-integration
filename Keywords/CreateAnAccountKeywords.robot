*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           DateTime
Library           String
Resource          ../Objects/Locators/CreateAnAccountLocators.robot
Resource          ../TestData/CreateAnAccountData.robot

*** Keywords ***
Enter Account Details
    [Arguments]    ${username}    ${email}    ${password}
    Input Text    //input[@name='username']    ${username}
    Input Text    //input[@name='email']    ${email}
    Input Text    //input[@name='password']    ${password}
    Log    Account details entered.

Enter Invalid Email
    [Arguments]    ${username}    ${email}    ${password}
    Input Text    //input[@name='username']    ${username}
    Input Text    //input[@name='email']    ${email}  # Assuming ${email} contains an invalid email format.
    Input Text    //input[@name='password']    ${password}
    Log    Invalid email entered.

Submit Account Creation
    Click Button    //button[@name='submit']
    Wait Until Element Is Visible    //div[@class='account-created']    10
    Log    Account creation submitted.

Verify Error Message Is Displayed
    Element Should Be Visible    //div[@class='error-message']    5
    Log    Error message displayed as expected.

