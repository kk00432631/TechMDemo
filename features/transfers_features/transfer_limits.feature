 @transfer_limits_avail @component
 Feature:  Transfer Limits Validation
		In order to limit each type of transaction to meet each country regulatory
		As a iBanking system
		I want the limits validation feature

@wip @RDC361
Scenario Outline: Retrieve transaction limits available from ibanking
	Given I'm customer with customer id "<customer_id>" from country "<country>" with "<ebid>", "<customerIdType>", "<channel>", "<uaasId>", "<userId>"
	  And I'm customer with segment "<customer_segment>"
	  And I want to check my limits available for "<txn_type>"
	 When I retrieve transfer limits from ibanking
	 Then My remaining Overall Daily Limit should be greater than "<rem_amount>"
	 And My remaining Transfer Limit should be greater than "<rem_amount>"
	 
Examples:
	 | customer_id | customer_segment | country  | txn_type             | rem_amount | ebid  | customerIdType | channel | uaasId     | userId |
	 | S7965955Z   | INO 			  |   SG     | telegraphic_transfer |     0 	 | 12345 | 01             | IBKBMW  | 6597321761 | 123456 |
	 | 990000016   | PRIORITY 		  |   AE     | telegraphic_transfer |     0    	 | 12345 | 01             | IBKBMW  | 990000016  | 123456 |
	 #| S7965955Z    | INO 			  |   SG     | INFT     | SGD      |    20,000        | 12345 | 01             | IBKBMW  | 6597321761 | 123456 |
	 #| S7965955Z    | INO 			  |   SG     | INFT     | SGD      |    20,000 	      | 12345 | 01             | IBKBMW  | 6597321761 | 123456 |
	 #| S7965955Z    | INO 			  |   SG     | max_limit_per_day     | INFT     | SGD      |   100,000 	      | 12345 | 01             | IBKBMW  | 6597321761 | 123456 |
	 #| S7965955Z    | INO 			  |   SG     | max_limit_per_txn     | INFT     | SGD      |   100,000 	      | 12345 | 01             | IBKBMW  | 6597321761 | 123456 |
	 #| S7965955Z    | INO 			  |   SG     | overall_daily_limit   | INFT     | SGD      |   100,000 	      | 12345 | 01             | IBKBMW  | 6597321761 | 123456 |
	 # | 10000001    | NA 			  |   SG     | default_authorisation | 3rd_party_transfer   | SGD      |    20,000 	      |
	 # | 10000002    | NA 			  |   SG     | max_authorisation     | 3rd_party_transfer   | SGD      |   100,000        |
	 # | 10000003    | NA 			  |   SG     | max_limit_per_day     | 3rd_party_transfer   | SGD      |   100,000 	      |
	 # | 10000004    | NA 			  |   SG     | max_limit_per_txn     | 3rd_party_transfer   | SGD      |   100,000 	      |
	 # | 13000001    | MASS 			  |   UAE    | max_authorisation     | telegraphic_transfer | AED      |    20,000 	      |
	 # | 13000001    | MASS 			  |   UAE    | max_limit_per_day     | telegraphic_transfer | AED      |      9999 	      |
	 # | 13000001    | MASS 			  |   UAE    | max_limit_per_txn     | telegraphic_transfer | AED      |      4400 	      |
	 # | 13000002    | PRIORITY 		  |   UAE    | max_authorisation     | telegraphic_transfer | AED      |    50,000 	      |
	 # | 13000002    | PRIORITY		  |   UAE    | max_limit_per_day     | telegraphic_transfer | AED      |    50,000 	      |
	 # | 13000002    | PRIORITY 		  |   UAE    | max_limit_per_txn     | telegraphic_transfer | AED      |    25,000        |
	 # | 13000003    | SME 			  |   UAE    | max_authorisation     | telegraphic_transfer | AED      | 1,000,000        |
	 # | 13000003    | SME 			  |   UAE    | max_limit_per_day     | telegraphic_transfer | AED      | 1,000,000        |
	 # | 13000003    | SME 			  |   UAE    | max_limit_per_txn     | telegraphic_transfer | AED      | 1,000,000        |
	 # | 13000001    | MASS 			  |   UAE    | overall_daily_limit   | telegraphic_transfer | AED      |   100,000 	      |


@wip @RDC361_1
Scenario Outline: Checking limit cat type while Retrieve transaction limits available from ibanking
	Given I'm customer with customer id "<customer_id>" from country "<country>" with "<ebid>", "<customerIdType>", "<channel>", "<uaasId>", "<userId>"
	  And I'm customer with segment "<customer_segment>"
	  And I want to check my limits available for "<txn_type>"
	 When I retrieve transfer limits from ibanking
	 Then My transfer limits should contain "<limitCatType>"
Examples:
	 | customer_id | customer_segment | country  | txn_type             | limitCatType  | ebid  | customerIdType | channel | uaasId     | userId | 
	 | S7965955Z    | INO 			  |   SG     | telegraphic_transfer | ODL	        | 12345 | 01             | IBKBMW  | 6597321761 | 123456 |
	 | S7965955Z    | INO 			  |   SG     | telegraphic_transfer | TXL           | 12345 | 01             | IBKBMW  | 6597321761 | 123456 |
	 | 990000016    | PRIORITY 		  |   AE     | telegraphic_transfer | ODL    	    | 12345 | 01             | IBKBMW  | 990000016  | 123456 |
	 | 990000016    | PRIORITY 		  |   AE     | telegraphic_transfer | TXL    	    | 12345 | 01             | IBKBMW  | 990000016  | 123456 |


@wip @RDC361_2
Scenario Outline: Negative testing with txn type while retrieve transaction limits available from ibanking
	Given I'm customer with customer id "<customer_id>" from country "<country>" with "<ebid>", "<customerIdType>", "<channel>", "<uaasId>", "<userId>"
	  And I'm customer with segment "<customer_segment>"
	  And I want to check my limits available for invalid "<txn_type>"
	 When I retrieve transfer limits from ibanking
	 Then My transfer service should validate correct txn type with "<errorCode>"
Examples:
	 | customer_id | customer_segment | country  | txn_type | ebid  | customerIdType | channel | uaasId     | userId    | errorCode               |
	 | S7965955Z   | INO 			  |   SG     | ZAX1     | 12345 | 01             | IBKBMW  | 6597321761 | 123456    | SS_GENERAL_EXCEPTION    | 
	 | 990000016   | PRIORITY		  |   AE     | ZAX2     | 12345 | 01             | IBKBMW  | 6597321761 | 990000016 | ERR_TXN_LIMIT_NOT_FOUND |
	 





# @wip @RDC361_3
# Scenario Outline: To check the available limit is correct or not
# 	Given I'm customer with customer id "<customer_id>" from country "<country>" with "<ebid>", "<customerIdType>", "<channel>", "<uaasId>", "<userId>"
# 	And I'm customer with segment "<customer_segment>"
# 	And I want to check my available limit for txn_type "<txn_type>" and no transaction done 'today' for the txn_type
# 	When I retrieve transfer limits from ibanking
# 	Then My transfer limit amount available should be equal to "<limit_available>"
# Examples:
# 	| customer_id | customer_segment | country | txn_type | currency | limit_available | ebid  | customerIdType | channel | uaasId     | userId | 
# 	| S7965955Z   | INO 		     | SG      | INFT     | SGD      | 20000           | 12345 | 01             | IBKBMW  | 6597321761 | 123456 |


# @wip @RDC361_4
# Scenario Outline: Retrieve default limit from ibanking but not equal to default_limit
# 	Given I'm customer with customer id "<customer_id>" from country "<country>" with "<ebid>", "<customerIdType>", "<channel>", "<uaasId>", "<userId>"
# 	  And I'm customer with segment "<customer_segment>"
# 	  And I want to check my limits available for "<txn_type>" in "<limit_type>"
# 	 When I retrieve transfer limits from ibanking
# 	 Then My transfer default limit is not equal to amount "<default_limit>"
# Examples:
# 	| customer_id | customer_segment | country  | limit_type            | txn_type | currency | default_limit  | ebid  | customerIdType | channel | uaasId     | userId | 
# 	| S7965955Z   | EXBN             | SG       | overall_daily_limit   | INFT     | SGD      |   100000       | 12345 | 01             | IBKBMW  | 6597321761 | 123456 |
