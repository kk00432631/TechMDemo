@beneficiary @component
Feature:

	In order to make a transaction in 
		1. 3rd party fund transfer
		2. Interbank transfer
		3. Telegraphic transfer

	Customer is require to add beneficiary payee unless an beneficiary payee is already existed. Once customer is added the beneficiary payee, an payee record will be save permenantly and customer can make their transaction to an beneficiary payee

	It depends on the countries, some countries beneficiary payee records will be save to host directly and when the end of the day batch from the host will be send back to ibanking. For the rest of the country, it will save in ibanking database directly.

	Exisitng beneficiary payee can be delete when customer feel transfer to an existing beneficiary payee is no longer needed or due to whatever reason.

	Finally sometime update eixisting beneficiary payee will be enforce to all the customer when ibanking feel is necessary. Usually happen when there is some back-end structure is changed.

Scenario: Add beneficiary Payee
	Given I have a beneficiary payee "payee"
	 When I add the beneficiary payee
	 Then I'm able to add the beneficiary payee
	  And I'll receive message "Add beneficiary payee successful"
