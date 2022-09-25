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
${forex}    //div[@class='sc-mcd__filter__item sc-mcd__filter__item--selected']
${aud_usd}    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ']
${contract_dropdown}    dt_contract_dropdown
${contract_lower}    dt_contract_high_low_item
${days}    //div[@class='duration-container']
${day_4}    //input[@name='duration']
${barrier}    //input[@name='barrier_1']
${payout_button}    dc_payout_toggle_item
${payout}    //input[@name='amount'] 
${lower_button}    //div[@class='btn-purchase__shadow-wrapper' and contains(.,'Lower')]
${disabled_lowerbutton}    //div[@class='btn-purchase__shadow-wrapper btn-purchase__shadow-wrapper--disabled']
${error}    //span[@data-tooltip='Contracts more than 24 hours in duration would need an absolute barrier.']

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
    Wait Until Page Contains Element    ${real_account}    10
Switch to Virtual Account
    Click Element    ${demo_tab}
    Wait Until Page Contains Element    ${demo_account}    10
    Click Element    ${demo_account}
    
Buy Lower Contract
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
Market Type    
    Click Element    ${market}
    Wait Until Page Contains Element    ${forex}    10
    Click Element    ${aud_usd}
Contract Type
    Wait Until Page Contains Element    ${contract_dropdown}    10
    Click Element    ${contract_dropdown} 
    Click Element    ${contract_lower}
Duration
    Wait Until Page Contains Element    ${days}    10
    Press Keys    ${day_4}    CTRL+a+BACKSPACE
    Input Text    ${day_4}    4

Barrier
    Press Keys    ${barrier}    CTRL+a+BACKSPACE
    Input Text    ${barrier}    +0.67051

Error Message
    Wait Until Page Contains Element    ${error}    10

Payout
    Click Element    ${payout_button}
    Press Keys    ${payout}    CTRL+a+BACKSPACE
    Input Text    ${payout}    10
    Wait Until Page Contains Element    ${disabled_lowerbutton}    10
      
    