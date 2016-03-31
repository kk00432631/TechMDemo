@customer_account_details @component
Feature: 
                To fetch the customer account details (system use case)
                refer http://gmwiki.uk.standardchartered.com:8080/display/RDC/Technical+Specification+-+Account+Service

    
        

            @RDC-326
            Scenario Outline: fetch the customer account details from EBBS
                
                Given the system has customer account details ctry "<ctry>",  chnl "<chnl>", language "<language>", clientRequestId "<clientRequestId>", ipAddress "<ipAddress>", userAgent "<userAgent>", accountNumber "<accountNumber>", relId "<relId>", uaasId "<uaasid>" and currencyCode "<currencyCode>"

                When the system requests for customer account details from application service url 

        
                Then I should be able to see the customer account details
                And have customer account attributes "<currencyCode>", "<accountNumber>", "<currentBalance>", "<availableBalance>", "<productCode>", "<productDescription>", "<accountName>", "<updatedDate>", "<statusCode>", "<statusDesc>"
               
               Examples:
    | ctry | chnl | language  | clientRequestId | ipAddress | userAgent    | accountNumber | relId | uaasId    | currencyCode | currentBalance | availableBalance | productCode  | productDescription             | accountName | updatedDate | statusCode | statusDesc | 

    | KE          | IBNK  | en        | 201510270011    | 10.10.10.10 | mobileApp | 0151823721700 |              |    | KE     | 52728.40           | 52728.40            | 002               | ONE FEE TARIFF CURRENT ACCOUNT          |  |    |  200         |  Success     |          
                @RDC-326_1
            Scenario Outline: fetch the customer account details from EBBS using invalid account number for negative scenario
                
                Given the system has customer account details ctry "<ctry>",  chnl "<chnl>", language "<language>", clientRequestId "<clientRequestId>", ipAddress "<ipAddress>", userAgent "<userAgent>", accountNumber "<accountNumber>", relId "<relId>", uaasId "<uaasid>" and currencyCode "<currencyCode>"


                When the system requests for customer account details from application service url 

                Then I should not be able to see the customer account details
                And have customer account attributes "<statusCode>", "<statusDesc>"
               
               Examples:
    | ctry | chnl | language  | clientRequestId | ipAddress | userAgent    | accountNumber | relId | uaasid    | currencyCode | statusCode | statusDesc | 

    | KE          | IBNK  | en        | 201510270000    | 10.10.10.10 | mobileApp | 0151823721700 |              |    | KES      | 200         |  Account Number provided is not correct. Please provide a valid Account number     |
