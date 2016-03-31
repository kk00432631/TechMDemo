 @notification12 @component
 Feature: Notification feature
		As a customer
		I want to receive notification for successful and failed transfer.

  @wip
  Scenario Outline: Receive succesful or failure telegraphic transfer notification
	Given I'm customer with customer details
		  | customer_id | ebid      | customer_segment | country  |
		  | 12455551    | 812365343 | EXBN             | SG       |
	  And I have accounts
		  | accounts   	 | balance   | currency_code |
  		  | 112250079253 | 100000    | SGD           |
      And I have telegraphic transfer payee 
		  | name    | account_no | account_currency | bank_name | bank_addr | bank_country |
		  | Jelly 	| 0012344    | SGD 		        | SCB  	    | xxx 		| xxx          |
	 When I try to perform "<success_or_failure>" telegraphic transfer with amount "10", currency "SGD", charge "OUR" and transfer reference "Mortgage"
	 Then my telegraphic transfer transaction is "<success_or_failure>" 
	  And I can see notification message in my inbox

Examples:
    | success_or_failure |
    | successful         |
    | failure            |


  @wip
  Scenario Outline: Receive notifcation based on my language preference
  	Given I'm customer with customer details
		  | customer_id | ebid      | customer_segment | country  |
		  | 12455551    | 812365343 | EXBN             | SG       |
	  And my language preference as "<language>" 
	  And I have accounts
		  | accounts   	 | balance   | currency_code |
  		  | 112250079253 | 100000    | SGD           |
      And I have telegraphic transfer payee 
		  | name    | account_no | account_currency | bank_name | bank_addr | bank_country |
		  | Jelly 	| 0012344    | SGD 		        | SCB  	    | xxx 		| xxx          |
	 When I try to perform telegraphic transfer with amount "10", currency "SGD", charge "OUR" and transfer reference "Mortgage"
	 Then my telegraphic transfer transaction is 'sucessful' 
	  And I can see notification message in my inbox
	  And my notification message are in language "<language>"

	Examples:
    |	language |
    |	en 		 |
    |	zh_CN	 |
    |	zh_HK	 |
