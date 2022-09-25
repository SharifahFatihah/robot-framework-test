*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']
${email_field}    //input[@type='email']
${password_field}    //input[@type='password'] 
${submit_button}    //button[@type='submit']
${read}    //input[@name='read']    
${check_read}    //input[@name='read']//parent::label
${trade}    //input[@name='trade']
${check_trade}    //input[@name='trade']//parent::label
${payments}    //input[@name='payments']  
${check_payments}    //input[@name='payments']//parent::label 
${t_info}    //input[@name='trading_information']
${check_t_info}    //input[@name='trading_information']//parent::label
${admin}    //input[@name='admin'] 
${check_admin}    //input[@name='admin']//parent::label 
${token_name}    //input[@name='token_name']
${disable_createbutton}    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and contains(.,'Create')]
${create_button}    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button' and contains(.,'Create')]
${list_tokenname}    //*[@class='da-api-token__table-cell da-api-token__table-cell--name']
${list_tokencode}    //*[@class='da-api-token__pass-dot-container']
${list_copyicon}    //*[@class='dc-icon dc-clipboard']
${list_visibiityicon}    //*[@class='dc-icon da-api-token__visibility-icon']
${list_scopes}    //*[@class='da-api-token__table-scopes-cell-block']
${list_lastused}    //*[@class='dc-text' and contains(.,'Never')]
${list_deleteicon}    //*[@class='dc-icon dc-clipboard da-api-token__delete-icon']
${token_exist}    //span[@class='dc-text' and contains(.,'TokenTC04')]
${scope_admin}    //*[@class='da-api-token__table-scope-cell da-api-token__table-scope-cell-admin']
${scope_trade}    //*[@class='da-api-token__table-scope-cell' and contains(.,'Trade')] 
${list_copyicon2}    //tr[contains(.,'TokenTC09')]//td[2]/div/div[2]
${copy_message}    //div[@class='dc-modal-body']
${okay_buttton}    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']
${eye_icon}    //tr[contains(.,'TokenTC04')]//td[2]/div/div[3]
${delete_icon}    //tr[contains(.,'TokenTC04')]//td[5]/div/div/div
${delete_message}    //div[@class='dc-modal-body']
${cancel_buttton}    //*[@class='dc-btn dc-btn__effect dc-btn--secondary dc-btn__large dc-dialog__button']
${delete_buttton}    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']

*** Test Cases ***
Login to Deriv
    Open Browser    https://app.deriv.com/account/api-token    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${email_field}    10
    Input Text    ${email_field}    sharifah@besquare.com.my    
    Input Text    ${password_field}    Besquare_2022    
    Click Element    ${submit_button}

Validation TC01 - Empty Checkbox Empty Token Name
    Wait Until Page Contains Element    ${read}    10
    Checkbox Should Not Be Selected    ${read}
    Checkbox Should Not Be Selected    ${trade}
    Checkbox Should Not Be Selected    ${payments}
    Checkbox Should Not Be Selected    ${t_info}
    Checkbox Should Not Be Selected    ${admin}
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Wait Until Page Contains Element    ${disable_createbutton}    10
    Element Should Be Disabled    ${disable_createbutton}

Validation TC02 - Empty Checkbox Valid Token Name 
    Wait Until Page Contains Element    ${read}    10
    Checkbox Should Not Be Selected    ${read}
    Checkbox Should Not Be Selected    ${trade}
    Checkbox Should Not Be Selected    ${payments}
    Checkbox Should Not Be Selected    ${t_info}
    Checkbox Should Not Be Selected    ${admin}
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Input Text    ${token_name}    TokenTC02
    Wait Until Page Contains Element    ${disable_createbutton}    10
    Element Should Be Disabled    ${disable_createbutton}

Validation TC03 - Select Checkbox Empty Token Name
    Wait Until Page Contains Element    ${read}    10
    Click Element    ${check_read}
    Click Element    ${check_trade}
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Wait Until Page Contains Element    ${disable_createbutton}    10
    Element Should Be Disabled    ${disable_createbutton}

Validation TC05 - Select Checkbox Invalid Token Name
    Wait Until Page Contains Element    ${read}    10
    Click Element    ${check_read}
    Click Element    ${check_trade}
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Input Text    ${token_name}    T
    Wait Until Page Contains Element    ${disable_createbutton}    10
    Element Should Be Disabled    ${disable_createbutton}

Create Token TC04 - Select One Checkbox Valid Token Name
    Wait Until Page Contains Element    ${read}    10
    Click Element    ${check_read}
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Input Text    ${token_name}    TokenTC04
    Wait Until Page Contains Element    ${create_button}    10
    Click Element    ${create_button}

Validation TC06 - Display content in table after create token
    Wait Until Page Contains Element    ${list_tokenname}    10
    Page Should Contain Element    ${list_tokenname}
    Page Should Contain Element    ${list_tokencode}
    Page Should Contain Element    ${list_copyicon}
    Page Should Contain Element    ${list_visibiityicon}
    Page Should Contain Element    ${list_scopes}
    Page Should Contain Element    ${list_lastused}
    Page Should Contain Element    ${list_deleteicon}

Validation TC07 - Token Name = User Input
    Page Should Contain Element    ${token_exist}    

Copy Token TC08 - without warning message and no admin
    Click Element    ${list_copyicon}

Copy Token TC09 - with warning message and admin
    Wait Until Page Contains Element    ${admin}    10
    Click Element    ${check_trade}
    Click Element    ${check_admin}
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Input Text    ${token_name}    TokenTC09
    Wait Until Page Contains Element    ${create_button}    10
    Click Element    ${create_button}
    Wait Until Page Contains Element    ${scope_admin}    10
    Page Should Contain Element    ${scope_admin}    
    Click Element    ${list_copyicon2}
    Page Should Contain Element    ${copy_message}
    Click Element    ${okay_buttton}

Token Visibility TC10 
    Click Element    ${eye_icon}

Scope Validation TC11 - Scope = User input
    Page Should Contain Element    ${scope_trade}
    Page Should Contain Element    ${scope_admin}

Cancel Delete Token TC12 - Confirmation Message, TC14 - Back to Previous Page
    Click Element    ${delete_icon}
    Page Should Contain Element    ${delete_message}
    Click Element    ${cancel_buttton}
    Page Should Contain Element    ${token_exist}  

Delete Token TC13
    Click Element    ${delete_icon}
    Page Should Contain Element    ${delete_message}
    Click Element    ${delete_buttton}
    Wait Until Page Does Not Contain Element    ${token_exist}    10
    Page Should Not Contain Element    ${token_exist}