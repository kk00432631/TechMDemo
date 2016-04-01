@technical @component
Feature:
	In order to make request to Axway CSL services successfully
	As an API consumer
	I need to send a correct http header client context

	The header it allows Axway CSL services recognize client from which:
		1. Country
		2. Channel Type
		3. Language
		4. ClientRequestId

@http_header
Scenario Outline: Getting mandatory field error from Axway CSL services
	Given I have a http header client context without "<field>" value
	 When I send a POST request to "http://localhost:8080/hw/post" with http body below:
	 """
	 {
	 	"request":{
	 				"userId":"206135685",
	 				"sessionTicket":"Gp2gpPzAcDPr96Yc",
	 				"requestType":"CTRYLIST"
	 			  }
	 }
	 """
	 Then I will receive http response status "200"
	  And I will get status code "ERR_MANDATORY_FIELD" from JSON response

	Examples:
	| field           |
	| country         |
	| channelType     |
	| language        |
	| clientRequestId |

