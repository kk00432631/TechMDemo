World(CustomerDomain, GeneralCslServiceDomain, MyWorld)

$isTimedOut
customerAccountSummaryDetails = CustomerAccountSummaryDetails.new

Given(/^the system has customer summary profile ctry "([^"]*)",  chnl "([^"]*)", language "([^"]*)", clientRequestId "([^"]*)", ipAddress "([^"]*)", userAgent "([^"]*)", relationshipNumber "([^"]*)", relId "([^"]*)" and uaasId "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9|

  customerAccountSummaryDetails.set_ctry(arg1)
  customerAccountSummaryDetails.set_chnl(arg2)
  customerAccountSummaryDetails.set_language(arg3)
  customerAccountSummaryDetails.set_clientRequestId(arg4)
  customerAccountSummaryDetails.set_ipAddress(arg5)
  customerAccountSummaryDetails.set_userAgent(arg6)
  customerAccountSummaryDetails.set_relationshipNumber(arg7)
  customerAccountSummaryDetails.set_relId(arg8)
  customerAccountSummaryDetails.set_uaas2id(arg9) 
end

When(/^the system requests for customer account summary details from application service url$/) do
 
end

Then(/^I should be able to see the customer account summary details$/) do
  
  customerAccountSummaryDetails.get_customer_account_summary_details
  expect(customerAccountSummaryDetails.http_response.code).to eq(200)
  begin
    jsonResp = customerAccountSummaryDetails.http_response.body
    puts "server response for customer account summary is"
    puts jsonResp
    
    JSON.parse(customerAccountSummaryDetails.http_response.body)  
  rescue JSON::ParserError => e  
    raise e
  rescue Timeout::Error  
    $isTimedOut = true
  end
end

Then(/^have account summary attributes "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15|
  
  jsonResp = JSON.parse(customerAccountSummaryDetails.http_response.body)
#expect(jsonResp['accounts'][0]['currencyCode']).not_to eq(nil)
  expect(arg13).to eq(jsonResp['status']['statusCode'])
  expect(arg3).to eq(jsonResp['accounts'][0]['currencyCode'])
  expect(arg1).to eq(jsonResp['accounts'][0]['accountNumber'])
  expect(arg2).to eq(jsonResp['accounts'][0]['relationshipNumber'])
  expect(arg5).to eq(jsonResp['accounts'][0]['currentBalance'])
  expect(arg6).to eq(jsonResp['accounts'][0]['availableBalance'])
  

end

Then(/^I should not be able to see the customer account summary details$/) do
  
customerAccountSummaryDetails.get_customer_account_summary_details
  expect(customerAccountSummaryDetails.http_response.code).to eq(200)
  begin
    jsonResp = customerAccountSummaryDetails.http_response.body
    puts "server response for customer account summary is"
    puts jsonResp
    
    JSON.parse(customerAccountSummaryDetails.http_response.body)  
  end

end

Then(/^have account summary attributes "([^"]*)", "([^"]*)"$/) do |arg1, arg2|
  
  jsonResp = JSON.parse(customerAccountSummaryDetails.http_response.body)
  expect(arg1).to eq(jsonResp['status']['statusCode'])
end
