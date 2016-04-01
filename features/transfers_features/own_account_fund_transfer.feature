 @third_party_fund_transfer @component
 Feature: 
 		In order to achieve third party fund transfer
		transfer the amount from one own account to beneficiary account
		where the account should have sufficient amount
		and the transaction should be successful. 
		I want an thirdPartyFundTranfer Feature.		

@wip @country_spec
Scenario Outline: Transaction will be failed as the amount is less than the minimum amount required when beneficiary bank is same (SCB).
	Given I'm customer with customer id "<customer_id>" from country "<country>"
	And   I have accounts "<account>" and "<beneficiary_account >"  		  	  
  	And   minimum transfer amount is "<min_amt>"
  	When  I am performing third party fund transfer with an amount of "1".	
  	Then  I cant proceed  with the transaction as the amount is less than the minimum amount
  	And   I will receive an error message "Please reinput a valid amount." 
Examples:
	 |customer_id | country  |  from_account    | beneficiary_name | beneficiary_account   | currency_code  | min_amt | 
	 | 12455551   |   HK     |  112250079253    | 	Jessica		   |	112250079255	   |     HKD		|   10 	  |	
	 | 12455552   |   AE     |  112250079254    |   Jessica        |	112250079256 	   |     AED		|   10 	  |	
	 | 12455553   |   MY     |  112250079255    |   Jessica        |	112250079257 	   |     MYR		|   10 	  |	
	 | 12455554   |   CN     |  112250079256    |   Jessica        | 	112250079258	   |     CNY		|   10 	  |	
	 | 12455555   |   SG     |  112250079257    |   Jessica        | 	112250079259 	   |     SGD		|   10 	  |	
	 | 12455556   |   PK     |  112250079258    |   Jessica        | 	112250079260       |     PKR		|   10 	  |	
	 | 12455557   |   IN     |  112250079259    |   Jessica        | 	112250079261       |     INR		|   10	  |	  	


@wip @country_spec
Scenario Outline: Transaction will be failed as the third party fund transfer does not support recurring payment when beneficiary bank is same (SCB).
	Given I'm customer with customer id "<customer_id>" from country "<country>"
	And   I have accounts "<account>" and "<beneficiary_account >" 
  	When  I am performing an scheduled daily/monthly third party fund transfer with an amount of "1"
  	Then  I cant proceed  with the transaction as the transaction is scheduled daily/monthly.
  	And   I will receive an error message "Immediate transaction does not support recurring payment."

Examples:
	 |customer_id | country  |  from_account    | beneficiary_name | beneficiary_account   | currency_code  |
	 | 12455551   |   HK     |  112250079253    | 	Jessica		   |	112250079255	   |     HKD		|

@wip @country_spec
Scenario Outline: Transaction will be failed as the third party fund transfer does not support recurring payment when beneficiary bank is same (SCB).
	Given I'm customer with customer id "<customer_id>" from country "<country>"
	And   I have accounts "<account>" and "<beneficiary_account >" 
  	When  I am performing an scheduled daily/monthly third party fund transfer with an amount of "1"
  	Then  I cant proceed  with the transaction as the transaction is scheduled daily/monthly.
  	And   I will receive an error message "Immediate transaction does not support recurring payment."

Examples:
	 |customer_id | country  |  from_account    | beneficiary_name | beneficiary_account   | currency_code  |
	 | 12455551   |   HK     |  112250079253    | 	Jessica		   |	112250079255	   |     HKD		|	 

@wip
Scenario Outline: Transaction will be failed as the amount is less than the minimum amount required when beneficiary bank is other than SCB.
	Given I'm customer with customer id "<customer_id>" from country "<country>"
	And   I have accounts "<account>" and "<beneficiary_account >"  
  	And   minimum transfer amount is "<min_transfer_amt>"
  	When  I am performing third party fund transfer with an amount of "10".	
  	Then  I cant proceed  with the transaction as the amount is less than the minimum amount
  	And   I will receive an error message "The minimum transfer amount to other bank is HK$100. Please reinput amount and retry."

Examples:
	 |customer_id | country  |  from_account    | beneficiary_name | beneficiary_account   | currency_code  | min_transfer_amt | 
	 | 12455551   |   HK     |  112250079253    | 	Jessica		   |	112250079255	   |     HKD		|   100		       |
	 | 12455552   |   AE     |  112250079254    |   Jessica        |	112250079256 	   |     AED		|   10 	           |
	 | 12455553   |   MY     |  112250079255    |   Jessica        |	112250079257 	   |     MYR		|   10 	           |
	 | 12455554   |   CN     |  112250079256    |   Jessica        | 	112250079258	   |     CNY		|   10 	           |
	 | 12455555   |   SG     |  112250079257    |   Jessica        | 	112250079259 	   |     SGD		|   10 	           |
	 | 12455556   |   PK     |  112250079258    |   Jessica        | 	112250079260       |     PKR		|   10 	           |
	 | 12455557   |   IN     |  112250079259    |   Jessica        | 	112250079261       |     INR		|   10	           |

@wip
Scenario Outline: Transaction will be rejected by the host as the transfer amount is greater than the available amount in the account
    Given I'm customer with customer id "<customer_id>" from country "<country>"
	And   I have accounts "<account>" and "<beneficiary_account >"  
  	When  I transfer an amount of "1100" from account "<from_account>" to beneficiary account "<beneficiary_account>"
  	Then  I can proceed with the transaction
  	And   I will receive an message "Your transaction has been submitted."
  	But   The transaction is Rejected as transfer amount is greater than the available amount in the account, by the host
  	
 Examples:
	 |customer_id | country  |  from_account | Available_Balance |beneficiary_name | beneficiary_account   | currency_code  | 
	 | 12455551   |   HK     |  112250079253 | 	1000             | Jessica		   |	20281002800 	   |     HKD		|
	 | 12455552   |   MY     |  112250079254 |  1000			 | Jessica         |	20281002800 	   |     AED		|	

@wip
Scenario Outline: Transaction will be rejected by the host as the transfer amount is greater than the available amount in the account
    Given I'm customer with customer id "<customer_id>" from country "<country>"
	And   I have accounts "<account>" and "<beneficiary_account >"  
  	When  I transfer an amount of "1100" from account "<from_account>" to beneficiary account "<beneficiary_account>"
  	Then  I can't proceed with the transaction
  	And   I will receive an message "we are unable to perform your request. Please ensure the transaction amount does not exceed the available balance."
  	
 Examples:
	 |customer_id | country  |  from_account | Available_Balance |beneficiary_name | beneficiary_account   | currency_code  | 
	 | 12455551   |   SG     |  112250079253 | 	1000             | Jessica		   |	20281002800 	   |     SGD		|
	 | 12455552   |   AE     |  112250079254 |  1000			 | Jessica         |	20281002800 	   |     AED		|
	 | 12455552   |   CN     |  112250079254 |  1000			 | Jessica         |	20281002800 	   |     CNY		|	

@wip
Scenario Outline: Transaction which has been scheduled is failed because of insufficient funds.
	Given I'm customer with customer id "<customer_id>" from country "<country>"
	And   I have accounts "<account>"
	And   I have benificiary account "<beneficiary_account >" 
  	When  I am performing an scheduled "monthly" from start date "<start_date>" to end date "<end_date>" with an amount of "1"
  	Then  I cant proceed  with the transaction.
  	And   I will receive a message "Your Transaction has been scheduled."  
  	But   The scheduled transaction is rejected/failed because of insufficient fund
  	
Examples:
	 |customer_id | country  |  from_account | beneficiary_name | beneficiary_account | currency_code| start_date | end_date  |
	 | 12455551   |   SG     |  112250079253 | 	Jessica		   |	221150079255	  |     SGD      | 01/02/2016 |01/06/2026 |
	 | 12455551   |   CN     |  112250079253 | 	Jessica		   |	221150079255	  |     CNY      | 01/02/2016 |01/06/2026 |
	 | 12455551   |   AE     |  112250079253 | 	Jessica		   |	221150079255	  |     AED      | 01/02/2016 |01/06/2026 |	 

@wip
Scenario: Transaction will be SuccessFull as all the validations are passed.
	Given I have accounts
		  | accounts   	    | balance   | currency_code |
  		  | 112250079253    | 100000    | HKD           |
  		  
  	And   I have Beneficiary account
  		  | beneficiary_name  | beneficiary_account |
  		  | Jessica           | 20281002800         |	  	
	When I transfer an amount of "1000", from AccountNumber "112250079253" to Beneficiary account "20281002800"  
	Then I will receive a successful message "Your tansaction is successfull"

@wip
Scenario Outline: Transaction which has been scheduled for interbank is successful
	Given I'm customer with customer id "<customer_id>" from country "<country>"
	And   I have accounts "<account>"
	And   I have benificiary account "<beneficiary_account >" 
  	When  I am performing an scheduled "monthly" from start date "<start_date>" to end date "<end_date>"
  	And   third party fund transfer with an amount of "1" 
  	Then  I know my transaction is successful by checking the transaction status as well as through  SMS/eMail.
  	
Examples:
	 |customer_id | country  |  from_account | beneficiary_name | beneficiary_account | currency_code| start_date | end_date  |
	 | 12455551   |   HK     |  112250079253 | 	Jessica		   |	221150079255	  |     HKD      | 01/02/2016 |01/06/2016 |
	 | 12455551   |   SG     |  112250079253 | 	Jessica		   |	221150079255	  |     SGD      | 01/02/2016 |01/06/2016 |
	 | 12455551   |   CN     |  112250079253 | 	Jessica		   |	221150079255	  |     CNY      | 01/02/2016 |01/06/2016 |
	 | 12455551   |   AE     |  112250079253 | 	Jessica		   |	221150079255	  |     AED      | 01/02/2016 |01/06/2016 |

@wip @country_spec
Scenario Outline: Transaction which has been scheduled for third party SCB is successful
	Given I'm customer with customer id "<customer_id>" from country "<country>"
	And   I have accounts "<account>"
	And   I have benificiary account "<beneficiary_account >" 
  	When  I am performing an scheduled "monthly" from start date "<start_date>" to end date "<end_date>"
  	And   third party fund transfer with an amount of "1" 
  	Then  I know my transaction is successful by checking the transaction status as well as through  SMS/eMail.
  	
Examples:
	 |customer_id | country  |  from_account | beneficiary_name | beneficiary_account | currency_code| start_date | end_date  |
	 | 12455551   |   SG     |  112250079253 | 	Jessica		   |	221150079255	  |     SGD      | 01/02/2016 |01/06/2016 |
	 | 12455551   |   CN     |  112250079253 | 	Jessica		   |	221150079255	  |     CNY      | 01/02/2016 |01/06/2016 |
	 | 12455551   |   AE     |  112250079253 | 	Jessica		   |	221150079255	  |     AED      | 01/02/2016 |01/06/2016 |

@wip @country_spec @transfer_limits
Scenario Outline: Transaction will be failed as the Third Party Fund Transfer Limit Exceeed.
	Given I'm customer with customer id "<customer_id>" from country "<country>"
	And   I have accounts "<from_account>" and "<beneficiary_account >"
    And  My third party fund transfer limit is "<3rd_party_limit>"
	When I am performing third party fund transfer with an amount of "100002"
	Then I cant proceed with the transaction as the transaction limit exceeded
	And  I will receive an error message "Your Third Party Fund Transfer Limit Exceeded."

Examples:
	 |customer_id | country  |  from_account    | beneficiary_name | beneficiary_account   | currency_code  | 3rd_party_limit | 
	 | 12455551   |   HK     |  112250079253    | 	Jessica		   |	112250079255	   |     HKD		|   100000	  |	
	 | 12455552   |   AE     |  112250079254    |   Jessica        |	112250079256 	   |     AED		|   100000    |	
	 | 12455553   |   MY     |  112250079255    |   Jessica        |	112250079257 	   |     MYR		|   100000	  |	
	 | 12455554   |   CN     |  112250079256    |   Jessica        | 	112250079258	   |     CNY		|   100000	  |	
	 | 12455555   |   SG     |  112250079257    |   Jessica        | 	112250079259 	   |     SGD		|   100000	  |	
	 | 12455556   |   PK     |  112250079258    |   Jessica        | 	112250079260       |     PKR		|   100000	  |	
	 | 12455557   |   IN     |  112250079259    |   Jessica        | 	112250079261       |     INR		|   100000	  |	
	 | 12455554   |   KE     |  112250079256    |   Jessica        | 	112250079258	   |     KES		|   5000000	  |	
	 | 12455555   |   UG     |  112250079257    |   Jessica        | 	112250079259 	   |     UGX		|   50000000  |	
	 | 12455556   |   TZ     |  112250079258    |   Jessica        | 	112250079260       |     TZS		|   30000000  |	
	 | 12455557   |   BW     |  112250079259    |   Jessica        | 	112250079261       |     BWP		|   5000	  |
	 | 12455555   |   ZB     |  112250079257    |   Jessica        | 	112250079259 	   |     USD		|   10000     |	
	 | 12455556   |   GH     |  112250079258    |   Jessica        | 	112250079260       |     GHS		|   30000     |	
	 | 12455557   |   NG     |  112250079259    |   Jessica        | 	112250079261       |     NGN		|   8000000	  |		

@wip @country_spec @transfer_limits
Scenario Outline: Transaction will be failed as the Third Party Fund Transfer Limit Exceeed for the account segment type PB,PV and EX.
	Given I'm customer with customer id "<customer_id>" from country "<country>"
	And   I have accounts "<from_account>" and "<beneficiary_account >"
    And  My third party fund transfer limit is "<3rd_party_limit>"
	When I am performing third party fund transfer with an amount of "200001"
	Then I cant proceed with the transaction as the transaction limit exceeded
	And  I will receive an error message "Your Third Party Fund Transfer Limit Exceeded."

Examples:
	 |customer_id | country  |  from_account    | beneficiary_name | beneficiary_account   | currency_code  | 3rd_party_limit | 
	 | 12455551   |   HK     |  112250079253    | 	Jessica		   |	112250079255	   |     HKD		|   200000	      |		 		

@wip @country_spec @transfer_limits
Scenario Outline: Transaction will be failed as the Over All Daily Transfer Limit Exceeed.
	Given I'm customer with customer id "<customer_id>" from country "<country>"
	And   I have accounts "<account>" and "<beneficiary_account >"
    And   My Over All Daily transfer limit is "<daily_limit>"
	When I am performing third party fund transfer with an amount of "<daily_limit>"
	Then I cant proceed with the transaction as the Over All Daily Transaction limit exceeded
	And  I will receive an error message "Over All Daily Fund Transfer Limit Exceeded."	
 Examples:
	 |customer_id | country  |  account         | beneficiary_name | beneficiary_account   | currency_code  | daily_limit | 
	 | 12455551   |   HK     |  112250079253    | 	Jessica		   |	112250079255	   |     HKD		|   1000000 |	
	 | 12455552   |   AE     |  112250079254    |   Jessica        |	112250079256 	   |     AED		|   1000000 |	
	 | 12455553   |   MY     |  112250079255    |   Jessica        |	112250079257 	   |     MYR		|   1000000 |	
	 | 12455554   |   CN     |  112250079256    |   Jessica        | 	112250079258	   |     CNY		|   1000000 |	
	 | 12455555   |   SG     |  112250079257    |   Jessica        | 	112250079259 	   |     SGD		|   1000000 |	
	 | 12455556   |   PK     |  112250079258    |   Jessica        | 	112250079260       |     PKR		|   1000000 |	
	 | 12455557   |   IN     |  112250079259    |   Jessica        | 	112250079261       |     INR		|   1000000 |

  @wip @own_account_fund_transfer @notification
  Scenario: Own account transfer receive notification for successful transaction
	Given I'm customer "123456" from country "africa"
	  And I have accounts
	  	  | accounts   	    | balance   | currency_code |
  		  | 112250079253    | 100000    | HKD           |
  		  | 222250020000    | 100000    | HKD           |
	 When I make a own account fund transfer from account "112250079253" to account "222250020000" with amount "50"
	 Then I will receive status successful
	  And I will receive notification message with one of the contents
	  """
      Your funds transfer between own accounts with the following details is successful.
	  """

  @wip @own_account_fund_transfer @notification
  Scenario: Own account transfer receive notification for failed transaction
	Given I'm customer "123456" from country "africa"
	  And I have accounts
	  	  | accounts   	    | balance   | currency_code |
  		  | 112250079253    | 100000    | HKD           |
  		  | 222250020000    | 100000    | HKD           |
	 When I scheduled a own account fund transfer "next day" from account "112250079253" to account "222250020000" with amount "20"
	  And I wait until the "next day"
	 Then My own account fund transfer transaction will be "failure"
	  And I will receive notification "inbox" message with one of the contents
	  """
      Your funds transfer between own accounts with the following details is failed.
	  """