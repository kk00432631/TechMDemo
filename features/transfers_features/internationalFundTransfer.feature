@international_fund_transfer @component
 Feature: 
 		In order to achieve international fund transfer
		transfer the amount from one own account to beneficiary account
		where the account should have sufficient amount
		and the transaction should be successful. 
		I want an internationalFundTranfer Feature.		

@wip @Submitted
Scenario Outline:  I performed an International Fund transfer where my transaction status is submitted.
	Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  My transaction is completed
	But   The transaction status is Submitted
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 | ben_add2 | ben_add3 | ben_bank_name            | ben_bank_country     | ben_bank_code | transaction_type |
        | 12455551   | 812365343 | EXBN|  SG     | 112250079253 |    GBP   | 1000000000     | 722250079253        |     GBP      |    GB    |  Anne    |  1     |    GBP       | add1     | add2     | add3     | Standard Chanrtered Bank | Singapore            | SG1122        |       19         |
#	 |customer_id | country  | acct_num     | acct_cry | acct_avail_bal | ben_acct_num | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency |
#	 | 12455551   |   SG     | 112250079253 |    GBP   | 1000000000     | 722250079253 |     GBP      |    GB    |  Anne    |  123   |    GBP        |
#	 | 12455552   |   AE     | 112250079456 |    GBP   | 1000000000     | 722250079253 |     GBP      |    GB    |  Anne    |  123   |    GBP        |


@wip @validations
Scenario Outline: Transaction cant be processed as the amount is less than the min amount based up on the transaction currency type.  
	Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  I cant proceed with the transaction as the transfer amount is less than the minimum amount.
	And   I will receive an error message "BAU Error Message".
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 | ben_add2 | ben_add3 | ben_bank_name            | ben_bank_country     | ben_bank_code | transaction_type |
        | 12455551   | 812365343 | EXBN|   SG     | 112250079253 |    GBP   | 1000000000     | 722250079253        |     GBP      |    GB    |  Anne    |  1     |    GBP       | add1     | add2     | add3     | Standard Chanrtered Bank | Singapore            | SG1122        |       19         |

@wip @validations
Scenario Outline: Transaction cant be processed as the decimal points are not allowed in the amount based up on the transaction currency type.
	Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  I cant proceed with the transaction as the transfer amount format is not correct.
	And   I will receive an error message "BAU Error Message".
	
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 | ben_add2 | ben_add3 | ben_bank_name            | ben_bank_country     | ben_bank_code | transaction_type |
        | 12455551   | 812365343 | EXBN|   SG     | 112250079253 |    GBP   | 1000000000     | 722250079253        |     GBP      |    GB    |  Anne    |  1     |    GBP       | add1     | add2     | add3     | Standard Chanrtered Bank | Singapore            | SG1122        |       19         |	

@wip @validations
Scenario Outline: Transaction cant be processed as the amount is less than the minimum amount.
	Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  I cant proceed with the transaction as the transfer amount format is not correct.
	And   I will receive an error message "BAU Error Message".
	
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 | ben_add2 | ben_add3 | ben_bank_name            | ben_bank_country     | ben_bank_code | min_amt | transaction_type |
        | 12455551   | 812365343 | EXBN|   SG     | 112250079253 |    GBP   | 1000000000     | 722250079253        |     GBP      |    GB    |  Anne    |  1     |    GBP       | add1     | add2     | add3     | Standard Chanrtered Bank | Singapore            | SG1122        |	10     |       19         |	

@wip @validations
Scenario Outline: Transaction cant be processed as the amount is greater than the maximum allocated amount.
	Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  I cant proceed with the transaction as the transfer amount is greater than the "<max_amt>".
	And   I will receive an error message "BAU Error Message".
	
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 | ben_add2 | ben_add3 | ben_bank_name            | ben_bank_country     | ben_bank_code | max_amt 			| transaction_type |
        | 12455551   | 812365343 | EXBN|   SG     | 112250079253 |    GBP   | 1000000000     | 722250079253        |     GBP      |    GB    |  Anne    |  1     |    GBP       | add1     | add2     | add3     | Standard Chanrtered Bank | Singapore            | SG1122        | 9999999999999.99 |       19         |		

@wip @validations
Scenario Outline: Transaction cant be processed as the beneficiary address (ben_add1 + ben_add2 + ben_add3 + ben_ctry = 105) is greater than 105 charecters.
    Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  I cant proceed with the transaction as the length of the address which is a concatinated with beneficiary country is greater than "<max_length_add>" charecters.
	And   I will receive an error message "BAU Error Message"
	
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 							 | ben_add2 						  | ben_add3 						   | ben_bank_name            | ben_bank_country     | ben_bank_code | max_length_add | transaction_type |
        | 12455551   | 812365343 | EXBN|   SG     | 112250079253 |    GBP   | 1000000000     | 722250079253        |     GBP      |    GB    |  Anne    |  1     |    GBP       | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa   | bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb | cccccccccccccccccccccccccccccccccc | Standard Chanrtered Bank | Singapore            | SG1122        |      105       |       19         |		
 
  
@wip @validations    	
Scenario Outline: Transaction cant be processed as the benificiary bank code is not correct.
	Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  I cant proceed with the transaction as the benificiary bank code is not valid.
	And   I will receive an error message "BAU Error Message"
	
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 							 | ben_add2 						  | ben_add3 						   | ben_bank_name            | ben_bank_country     | ben_bank_code |  transaction_type |
        | 12455551   | 812365343 | EXBN|   SG     | 112250079253 |    GBP   | 1000000000     | 722250079253        |     GBP      |    GB    |  Anne    |  1     |    GBP       | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa   | bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb | cccccccccccccccccccccccccccccccccc | Standard Chanrtered Bank | Singapore            | SG1122        |       19          |

@wip @validations    	
Scenario Outline: Transaction cant be processed as the transfer amount is greater than the available amount in the account.
	Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  I cant proceed with the transaction as the transfer amount is greater than the available amount.
	And   I will receive an error message "BAU Error Message"
	
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 							 | ben_add2 						  | ben_add3 						   | ben_bank_name            | ben_bank_country     | ben_bank_code | transaction_type |
        | 12455551   | 812365343 | EXBN|   SG     | 112250079253 |    GBP   |       8765     | 722250079253        |     GBP      |    GB    |  Anne    |  10000 |    GBP       | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa   | bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb | cccccccccccccccccccccccccccccccccc | Standard Chanrtered Bank | Singapore            | SG1122        |       19         |

@wip @validations
Scenario Outline: Transaction cant be processed as the mandatory field is empty.
	Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  I cant proceed with the transaction as one of the mandatory field is empty.
	And   I will receive an error message "BAU Error Message".
	
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 | ben_add2 | ben_add3 | ben_bank_name            | ben_bank_country     | ben_bank_code | max_amt 			| transaction_type |
        | 12455551   | 812365343 | EXBN|   SG     | 112250079253 |    GBP   | 1000000000     | 722250079253        |     GBP      |    GB    |  Anne    |        |    GBP       | add1     | add2     | add3     | Standard Chanrtered Bank | Singapore            | SG1122        | 9999999999999.99 |       19         |		

@wip @chargesAmount
Scenario Outline: Transaction cant be processed as the charges amount is empty, when performing TT there will be minimum charges imposed.
	Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  I cant proceed with the transaction as the charges amount is empty/null.
	And   I will receive an error message "BAU Error Message".
	
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 | ben_add2 | ben_add3 | ben_bank_name            | ben_bank_country     | ben_bank_code | max_amt 			| transaction_type |
        | 12455551   | 812365343 | EXBN|   SG     | 112250079253 |    GBP   | 1000000000     | 722250079253        |     GBP      |    GB    |  Anne    |        |    GBP       | add1     | add2     | add3     | Standard Chanrtered Bank | Singapore            | SG1122        | 9999999999999.99 |       19         |		

@wip @limit
Scenario Outline: Transaction cant be processed as the transaction limit exceeded.
	Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  I cant proceed with the transaction as the transaction limit "<transaction_limit>" exceeded.
	And   I will receive an error message "BAU Error Message".
	
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 | ben_add2 | ben_add3 | ben_bank_name            | ben_bank_country     | ben_bank_code | transaction_type | transaction_limit |
        | 12455551   | 812365343 |       EXBN      |   SG     | 112250079253 |    GBP   | 1000000        | 722250079253        |     GBP      |    GB    |  Anne    |    10000 |    GBP       | add1     | add2     | add3     | Standard Chanrtered Bank | Singapore            | SG1122        |       19         |		1000000 |

@wip @limit
Scenario Outline: Transaction cant be processed as the over all daily transaction limit exceeded.
	Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  I cant proceed with the transaction as the over all daily transaction limit "<over_all_tran_limit>" exceeded.
	And   I will receive an error message "BAU Error Message".
	
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 | ben_add2 | ben_add3 | ben_bank_name            | ben_bank_country     | ben_bank_code | transaction_type | over_all_tran_limit |
        | 12455551   | 812365343 | EXBN|   SG     | 112250079253 |    GBP   | 1000000000     | 722250079253        |     GBP      |    GB    |  Anne    |   10000     |    GBP       | add1     | add2     | add3     | Standard Chanrtered Bank | Singapore            | SG1122        |       19         |		1000000 |        

@wip @status
Scenario Outline: I performed a transaction where the transaction status in submitted need to check transaction is sucessful or rejected.
	Given I'm customer with customer details "<customer_id>", "<ebid>","<customer_segment>" from country "<country>"
	And   I have accounts "<acct_num>", "<acct_avail_bal>" with account currency "<acct_cry>" 
	And   I have beneficiary details "<beneficiary_account >", "<ben_acct_cry>", "<ben_ctry>","<ben_name>", "<ben_add1>", "<ben_add2>", "<ben_add3>", "<ben_bank_name>", "<ben_bank_country>" and "<ben_bank_code>"
	When  I am performing  the international fund transfer where transaction type "<transaction_type>" with an amount of "<amount>" with TXN currency type "<txn_currency>"
	Then  My transaction is completed
	But   need to check the transaction is sucessful/rejected,expected status "<over_all_txn_status>"
	Examples: 

		|customer_id | ebid      | customer_segment| country  | acct_num     | acct_cry | acct_avail_bal | beneficiary_account | ben_acct_cry | ben_ctry | ben_name | amount | txn_currency | ben_add1 | ben_add2 | ben_add3 | ben_bank_name            | ben_bank_country     | ben_bank_code | transaction_type | over_all_txn_status |
		| 12455551   | 812365343 | EXBN|  SG     | 112250079253 |    GBP   | 1000000000     | 722250079253        |     GBP      |    GB    |  Anne    |  1     |    GBP       | add1     | add2     | add3     | Standard Chanrtered Bank | Singapore            | SG1122        |       19         |   success     |