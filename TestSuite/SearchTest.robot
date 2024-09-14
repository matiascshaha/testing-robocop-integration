*** Settings ***
Resource            ../Keywords/LaunchApplication.robot
Resource            ../Keywords/SearchKeywords.robot

Test Teardown       Clear SUT To Initial State


*** Test Cases ***
SearchTestffeeg
    Launch Application
    Search a Keyword
    Verify Search Result Page is shown
    # [Teardown]    Clear SUT To Initial State
