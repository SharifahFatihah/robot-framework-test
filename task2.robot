*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']
${email_field}    //input[@type='email']
${password_field}    //input[@type='password'] 
${submit_button}    //button[@type='submit']
${rise_button}    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]
${drop_down}    dt_core_account-info_acc-info
${demo_tab}    dt_core_account-switcher_demo-tab
${real_account}    dt_CR4470643
${demo_account}    dt_VRTC6202203
${market}    //div[@class='cq-symbol-select-btn']
${votality_10}    //div[@class='sc-mcd__item sc-mcd__item--1HZ10V ']
${contract_dropdown}    dt_contract_dropdown
${contract_rise}    dt_contract_rise_fall_item
${tick_5}    //span[@data-testid='tick_step_5']
${stake_10}    //input[@type='tel']
${synthetic_indices}    //div[@class='sc-mcd__filter__item sc-mcd__filter__item--selected']
${rise_button2}    //div[@class='btn-purchase__shadow-wrapper']

*** Test Cases ***
Login to Deriv
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${rise_button}    30
    Click Element    ${login_button}
    Wait Until Page Contains Element    ${email_field}    10
    Input Text    ${email_field}    
    Input Text    ${password_field}    
    Click Element    ${submit_button}
    Wait Until Page Contains Element    ${drop_down}    30

Check Current Account
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Click Element    ${drop_down}
    Wait Until Page Contains Element   ${real_account}    10
Switch to Virtual Account
    Click Element    ${demo_tab}
    Wait Until Page Contains Element    ${demo_account}    10
    Click Element   ${demo_account} 
    
Buy Rise Contract
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
Market Type    
    Click Element    ${market}
    Wait Until Page Contains Element    ${synthetic_indices}    10
    Click Element    ${votality_10}
Contract Type
    Wait Until Page Contains Element    ${contract_dropdown}    10
    Click Element    ${contract_dropdown} 
    Click Element    ${contract_rise}
Duration
    Wait Until Page Contains Element    ${tick_5}    10
    Click Element    ${tick_5}
  
Stake
    Press Keys    ${stake_10}    CTRL+a+BACKSPACE
    Input Text    ${stake_10}    10
    Wait Until Page Contains Element    ${rise_button2}    10
    Click Element    ${rise_button2}