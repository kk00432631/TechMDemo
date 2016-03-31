@customer_profile_details @component
Feature: 
                To fetch the customer profile details (system use case)
                refer http://gmwiki.uk.standardchartered.com:8080/display/RDC/Technical+Specification+-+Customer+Profile

    
        

            @RDC-324
            Scenario Outline: fetch the customer profile details from EBBS
                
                Given the system has customer profile details ctry "<ctry>",  chnl "<chnl>", language "<language>", clientRequestId "<clientRequestId>", ipAddress "<ipAddress>", userAgent "<userAgent>", customerId "<customerId>", relId "<relId>", uaasId "<uaasId>", customerIdType "<customerIdType>" and ebId "<ebId>"

                When the system requests for customer profile details from application service url 

        
                Then I should be able to see the customer profile details
                And have customer attributes "<ebId>", "<customerId>", "<customerIdType>", "<customerStatus>", "<customerStatusDesc>", "<gender>", "<dateOfBirth>", "<maritalStatusCode>", "<firstName>", "<middleName>", "<lastName>", "<fullName>", "<customerNickName>", "<personalPhone>", "<mobilePhone>", "<nationalityCode>", "<residenceCode>", "<mailingAddress1>", "<mailingAddress2>", "<mailingAddress3>", "<mailingAddress4>", "<mailingDistrict>", "<mailingArea>", "<mailingPostalCode>", "<mailingCountry>", "<scbIndicator>", "<emailAddr>", "<segmentCode>", "<notifyType>", "<statusCode>", "<statusDesc>", "<salutationCode>", "<updatedDate>" 
               
               Examples:
                | ctry | chnl | language  | clientRequestId | ipAddress | userAgent    | customerId | relId | uaasId    | customerIdType | ebId | customerStatus | customerStatusDesc | gender | dateOfBirth | maritalStatusCode | firstName | middleName | lastName | fullName | customerNickName | personalPhone | mobilePhone | nationalityCode | residenceCode | mailingAddress1 | mailingAddress2 | mailingAddress3 | mailingAddress4 | mailingDistrict | mailingArea | mailingPostalCode | mailingCountry | scbIndicator |  emailAddr | segmentCode | notifyType | statusCode | statusDesc | salutationCode | updatedDate |

                | KE          | IBNK  | en        | 201510270011    | 10.10.10.10 | mobileApp | 000144340 |              |    |     |         | A | Active | M | 08-05-1993 | S | XXX | Matthew | XXX | Steve Matthew Waugh | Stevie | +61989753720 | XXX | XXX | XXX | XXX | XXX | XXX | Singapore | Chang | KE | 098765 | KE | N | XXX | 999 | SMS | 200 | success | Mr. |    |

                @RDC-324_1
            Scenario Outline: fetch the customer profile details from EBBS using invalid customer Id for negative scenario
                
                Given the system has customer profile details ctry "<ctry>",  chnl "<chnl>", language "<language>", clientRequestId "<clientRequestId>", ipAddress "<ipAddress>", userAgent "<userAgent>", customerId "<customerId>", relId "<relId>", uaasId "<uaasId>", customerIdType "<customerIdType>" and ebId "<ebId>"

                When the system requests for customer profile details from application service url 

        
                Then I should not be able to see the customer profile details
                And have customer attributes "<statusCode>", "<statusDesc>"
               
               Examples:
                | ctry | chnl | language  | clientRequestId | ipAddress | userAgent    | customerId | relId | uaasId    | customerIdType | ebId | statusCode | statusDesc | 

                | KE          | IBNK  | en        | 201510270011    | 10.10.10.10 | mobileApp | 0151823721700 |              |    |     |         | 90000         |  Relationship Number provided is not correct. Please provide a valid relationship number    |
