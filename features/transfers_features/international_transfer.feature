@own_account_international_transfer @component
Feature: 
  	In order to make fund transfer in Own International Account
  	transfer the funds from own account to own international account
  	where account should have sufficient funds to transfer
  	and this transaction should be successful only with proper validation 
  	customer want to transfer to his own international account on click of Next which leads to confirmation page

  @wip @inter_country
  Scenario Outline: Transaction will be failed if customer enter any format other than that is specified in field “Transfer Amount Equivalent of”
    Given I am customer with customer id "<customer_id>" from country "<country>"
    And I have accounts "<transfer_from>" and international own account "<beneficiary_account>"
    And Format of Amount to be entered is n,nnn,nnn.nn and no character or special characters are allowed
    When I am performing own account international fund transfer with invalid input in "<transfer_amount_euivalant>"
    And I click on Next button
    Then I cant proceed  with the transaction as the amount entered is not in proper format as specified
    And I will receive an error message "Invalid Amount (Error Code: xxxx)"

    Examples: 
      | customer_id | country | transfer_from | beneficiary_name | beneficiary_account | beneficiery_country | currency_code | transfer_amount_euivalant_of | charges | transfer_ref  |
      | 12455551    | HK      | 112250079253  | Jessicaa         | 112250079255        | MY                  | HKD           | 10.00                        | OUR     | asdf dfgh asd |
      | 12455552    | AE      | 112250079254  | Jessicab         | 112250079256        | IN                  | AED           | 100.00                       | BEN     | asdf dfgh asd |
      | 12455553    | MY      | 112250079255  | Jessicac         | 112250079257        | CN                  | MYR           | 1,000.00                     | SHA     | asdf dfgh asd |
      | 12455554    | CN      | 112250079256  | Jessicad         | 112250079258        | AE                  | CNY           | 1,000,000.00                 | OUR     | asdf dfgh asd |
      | 12455555    | SG      | 112250079257  | Jessicae         | 112250079259        | PK                  | SGD           | 1,000,000.00                 | BEN     | asdf dfgh asd |
      | 12455556    | PK      | 112250079258  | Jessicaf         | 112250079260        | SG                  | PKR           | 1,000,000.00                 | SHA     | asdf dfgh asd |
      | 12455557    | IN      | 112250079259  | Jessicag         | 112250079261        | HK                  | INR           | 1,000,000.00                 | OUR     | asdf dfgh asd |

  @wip @inter_country
  Scenario Outline: Transaction will be failed if customer does not provide input in DDL field transfer_from
    Given I am customer with customer id "<customer_id>" from country "<country>"
    And I have accounts "<transfer_from>" and international own account "<beneficiary_account>"
    And the DDL field "<transfer_from>" should Not be empty
    When I am performing own account international fund transfer with an empty input in DDL "<transfer_from>"
    And I click on Next button
    Then I cant proceed  with the transaction as there is no input in DDL "<transfer_from>"
    And I will receive an error message "BAU Error Message"

    Examples: 
      | customer_id | country | transfer_from | beneficiary_name | beneficiary_account | beneficiery_country | currency_code | transfer_amount_euivalant_of | charges | transfer_ref  |
      | 12455551    | HK      | 112250079253  | Jessicaa         | 112250079255        | MY                  | HKD           | 10.00                        | OUR     | asdf dfgh asd |
      | 12455552    | AE      | 112250079254  | Jessicab         | 112250079256        | IN                  | AED           | 100.00                       | BEN     | asdf dfgh asd |
      | 12455553    | MY      | 112250079255  | Jessicac         | 112250079257        | CN                  | MYR           | 1,000.00                     | SHA     | asdf dfgh asd |
      | 12455554    | CN      | 112250079256  | Jessicad         | 112250079258        | AE                  | CNY           | 1,000,000.00                 | OUR     | asdf dfgh asd |
      | 12455555    | SG      | 112250079257  | Jessicae         | 112250079259        | PK                  | SGD           | 1,000,000.00                 | BEN     | asdf dfgh asd |
      | 12455556    | PK      | 112250079258  | Jessicaf         | 112250079260        | SG                  | PKR           | 1,000,000.00                 | SHA     | asdf dfgh asd |
      | 12455557    | IN      | 112250079259  | Jessicag         | 112250079261        | HK                  | INR           | 1,000,000.00                 | OUR     | asdf dfgh asd |

  @wip @inter_country
  Scenario Outline: Transaction will be failed if customer does not provide input in Textbox transfer_amount_euivalant_of
    Given I am customer with customer id "<customer_id>" from country "<country>"
    And I have accounts "<transfer_from>" and international own account "<beneficiary_account>"
    And the Textbox field "<transfer_amount_euivalant_of>" should Not be empty
    When I am performing own account international fund transfer with an empty input in "<transfer_amount_euivalant_of>"
    And I click on Next button
    Then I cant proceed  with the transaction as there is no input in Textbox "<transfer_amount_euivalant_of>"
    And I will receive an error message "BAU Error Message"

    Examples: 
      | customer_id | country | transfer_from | beneficiary_name | beneficiary_account | beneficiery_country | currency_code | transfer_amount_euivalant_of | charges | transfer_ref  |
      | 12455551    | HK      | 112250079253  | Jessicaa         | 112250079255        | MY                  | HKD           | 10.00                        | OUR     | asdf dfgh asd |
      | 12455552    | AE      | 112250079254  | Jessicab         | 112250079256        | IN                  | AED           | 100.00                       | BEN     | asdf dfgh asd |
      | 12455553    | MY      | 112250079255  | Jessicac         | 112250079257        | CN                  | MYR           | 1,000.00                     | SHA     | asdf dfgh asd |
      | 12455554    | CN      | 112250079256  | Jessicad         | 112250079258        | AE                  | CNY           | 1,000,000.00                 | OUR     | asdf dfgh asd |
      | 12455555    | SG      | 112250079257  | Jessicae         | 112250079259        | PK                  | SGD           | 1,000,000.00                 | BEN     | asdf dfgh asd |
      | 12455556    | PK      | 112250079258  | Jessicaf         | 112250079260        | SG                  | PKR           | 1,000,000.00                 | SHA     | asdf dfgh asd |
      | 12455557    | IN      | 112250079259  | Jessicag         | 112250079261        | HK                  | INR           | 1,000,000.00                 | OUR     | asdf dfgh asd |

  @wip @inter_country
  Scenario Outline: Transaction will be failed if customer does not provide input in first line of Textbox transfer_reference
    Given I am customer with customer id "<customer_id>" from country "<country>"
    And I have accounts "<transfer_from>" and international own account "<beneficiary_account>"
    And the Textbox field "<transfer_ref>" should Not have first line as empty
    When I am performing own account international fund transfer with an empty input in first line of "<transfer_ref>"
    And I click on Next button
    Then I cant proceed  with the transaction as there is no input in first line of "<transfer_ref>"
    And I will receive an error message "Please enter transfer reference starting from first textbox"

    Examples: 
      | customer_id | country | transfer_from | beneficiary_name | beneficiary_account | beneficiery_country | currency_code | transfer_amount_euivalant_of | charges | transfer_ref  |
      | 12455551    | HK      | 112250079253  | Jessicaa         | 112250079255        | MY                  | HKD           | 10.00                        | OUR     | asdf dfgh asd |
      | 12455552    | AE      | 112250079254  | Jessicab         | 112250079256        | IN                  | AED           | 100.00                       | BEN     | asdf dfgh asd |
      | 12455553    | MY      | 112250079255  | Jessicac         | 112250079257        | CN                  | MYR           | 1,000.00                     | SHA     | asdf dfgh asd |
      | 12455554    | CN      | 112250079256  | Jessicad         | 112250079258        | AE                  | CNY           | 1,000,000.00                 | OUR     | asdf dfgh asd |
      | 12455555    | SG      | 112250079257  | Jessicae         | 112250079259        | PK                  | SGD           | 1,000,000.00                 | BEN     | asdf dfgh asd |
      | 12455556    | PK      | 112250079258  | Jessicaf         | 112250079260        | SG                  | PKR           | 1,000,000.00                 | SHA     | asdf dfgh asd |
      | 12455557    | IN      | 112250079259  | Jessicag         | 112250079261        | HK                  | INR           | 1,000,000.00                 | OUR     | asdf dfgh asd |
