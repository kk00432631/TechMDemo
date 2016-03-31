@customer_account_summary_details @component
Feature: 
  	To fecth the customer account summary details (system use case)
	refer http://gmwiki.uk.standardchartered.com:8080/display/RDC/Technical+Specification+-+Account+Service

	

	@RDC-302
	Scenario Outline: fetch the customer account summary details from EBBS
	Given the system has customer summary profile ctry "<ctry>",  chnl "<chnl>", language "<language>", clientRequestId "<clientRequestId>", ipAddress "<ipAddress>", userAgent "<userAgent>", relationshipNumber "<relationshipNumber>", relId "<relId>" and uaasId "<uaasId>"
	
	When the system requests for customer account summary details from application service url 
	
	Then I should be able to see the customer account summary details
	And have account summary attributes "<accountNumber>", "<relationshipNumber>", "<currencyCode>", "<segmentCode>", "<currentBalance>", "<availableBalance>", "<productCode>", "<productDescription>", "<accountStatus>", "<accountName>", "<operatingInstruction>", "<riskCode>", "<statusCode>", "<statusDesc>", "<updatedDate>"

	Examples:
	| ctry | chnl | language  | clientRequestId | ipAddress | userAgent    | relationshipNumber | relId | uaasId    | accountNumber | currencyCode | segmentCode | currentBalance | availableBalance | productCode  | productDescription             | accountStatus | accountName | operatingInstruction | riskCode | statusCode | statusDesc | updatedDate |

	| KE          | IBNK  | en        | 201510270011    | 10.10.10.10 | mobileApp | 000015000 | 	         | 	  | 0101804333200     | KES           |             | 0.000               | 0.00 | 002 | ONE FEE TARIFF CURRENT ACCOUNT          | O | 	|  |  |  200         |  Success     |  |

	
	@RDC-302_1
	Scenario Outline: fetch the customer account summary details from EBBS using invalid relationship number - negative scenario

	Given the system has customer summary profile ctry "<ctry>",  chnl "<chnl>", language "<language>", clientRequestId "<clientRequestId>", ipAddress "<ipAddress>", userAgent "<userAgent>", relationshipNumber "<relationshipNumber>", relId "<relId>" and uaasId "<uaasId>"
	
	When the system requests for customer account summary details from application service url 
	
	Then I should not be able to see the customer account summary details
	And have account summary attributes "<statusCode>", "<statusDesc>"

	Examples:
	| ctry | chnl | language  | clientRequestId | ipAddress | userAgent    | relationshipNumber | relId | uaasId    | statusCode | statusDesc | 

	| KE          | IBNK  | en        | 201510270011    | 10.10.10.10 | mobileApp | 0000000 | 	         | 	  |  90000         |  Relationship Number provided is not correct. Please provide a valid relationship number     |