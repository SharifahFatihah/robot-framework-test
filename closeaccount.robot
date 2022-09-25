*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']
${email_field}    //input[@type='email']
${password_field}    //input[@type='password'] 
${submit_button}    //button[@type='submit']
${close_account_info}    //div[@class='closing-account__information']
${cancel_button}    //*[@class='dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel']
${close_account_button}    //*[@class='dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account']
${back_button}
${security_link}    //a[@class='link']
${homepage}    //h1[@class='dc-text']
${profile_icon}    //a[@class='account-settings-toggle']
${close_account_menu}    dc_close-your-account_link
${close_account_reason}    //div[@class='closing-account-reasons']
${checkbox1}    //input[@name='financial-priorities']//parent::label
${checkbox2}    //input[@name='stop-trading']//parent::label
${checkbox3}    //input[@name='not-interested']//parent::label
${checkbox4}    //input[@name='another-website']//parent::label
${checkbox5}    //input[@name='not-user-friendly']//parent::label
${checkbox6}    //input[@name='difficult-transactions']//parent::label
${checkbox7}    //input[@name='lack-of-features']//parent::label
${checkbox8}    //input[@name='unsatisfactory-service']//parent::label
${checkbox9}    //input[@name='other-reasons']//parent::label
${textbox1}    //textarea[@name='other_trading_platforms']
${textbox2}    //textarea[@name='do_to_improve']
${disable_continue_button}    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large' and contains(.,'Continue')]   
${continue_button}    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large']
${close_account_confirmation}    //div[@class='account-closure-warning-modal']
${goback_button}    //*[@class='dc-btn dc-btn__effect dc-btn--secondary dc-btn__large' and contains(.,'Go')]

*** Test Cases ***
Login to Deriv
    Open Browser    https://app.deriv.com/account/closing-account    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${email_field}    10
    Input Text    ${email_field}    sharifah@besquare.com.my    
    Input Text    ${password_field}    Besquare_2022    
    Click Element    ${submit_button}

Validation TC01
    Wait Until Page Contains Element    ${close_account_info}    10
    Page Should Contain Element    ${close_account_info}
    Page Should Contain Element    ${cancel_button}
    Page Should Contain Element    ${close_account_button}

Security and Privacy Policy TC02
    Click Element    ${security_link}

Cancel TC03
    Click Element    ${cancel_button}
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Page Should Contain Element    ${homepage}

Back to Close Account TC13
    Click Element   ${profile_icon}
    Click Element   ${close_account_menu}
    Click Element   ${close_account_button}
    Click Element   ${back_button}

Close Account TC04, TC05
    Click Element   ${close_account_button}
    Page Should Contain Element    ${checkbox1}
    Page Should Contain Element    ${checkbox2}
    Page Should Contain Element    ${checkbox3}
    Page Should Contain Element    ${checkbox4}
    Page Should Contain Element    ${checkbox5}
    Page Should Contain Element    ${checkbox6}
    Page Should Contain Element    ${checkbox7}
    Page Should Contain Element    ${checkbox8}
    Page Should Contain Element    ${checkbox9}   
    Page Should Contain Element    ${textbox1}    
    Page Should Contain Element    ${textbox2}

No Checkbox Selected TC07
    Checkbox Should Not Be Selected    ${checkbox1}
    Checkbox Should Not Be Selected    ${checkbox2}
    Checkbox Should Not Be Selected    ${checkbox3}
    Checkbox Should Not Be Selected    ${checkbox4}
    Checkbox Should Not Be Selected    ${checkbox5}
    Checkbox Should Not Be Selected    ${checkbox6}
    Checkbox Should Not Be Selected    ${checkbox7}
    Checkbox Should Not Be Selected    ${checkbox8}
    Checkbox Should Not Be Selected    ${checkbox9}
    Element Should Be Disabled    ${disable_continue_button}

1 Checkbox Selected TC09
    Click Element    ${checkbox1}
    Click Element   ${continue_button}

Confirmation Message TC14 and Go Back TC16
    Wait Until Page Contains Element    ${close_account_confirmation}    30
    Page Should Contain Element    ${close_account_confirmation}
    Click Element   ${goback_button}

3 Checkboxes Selected TC06, TC08 - Other Checkboxes Disabled
    Click Element    ${checkbox1}
    Click Element    ${checkbox2}
    Click Element    ${checkbox3}
    Element Should Be Disabled    ${checkbox4}
    Element Should Be Disabled    ${checkbox5}
    Element Should Be Disabled    ${checkbox6}
    Element Should Be Disabled    ${checkbox7}
    Element Should Be Disabled    ${checkbox8}
    Element Should Be Disabled    ${checkbox9}
    Click Element   ${continue_button}




    

