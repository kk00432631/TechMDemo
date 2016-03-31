 @sample
 Feature: Sample
 		In order to <meet some goal>
		As a <type of stakeholder>
		I want <a feature>

  
  
  Scenario: Sample - Transfer same account
	Given I have an account "a1234" with amount "20"
	 When I transfer fund from to same account
	 Then I will unable to to process the request
	 And  I will get error message "Not allow to transfer within same account"
