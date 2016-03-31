World(CustomerDomain, GeneralCslServiceDomain, MyWorld)

$isTimedOut
customerAccountDetails = CustomerAccountDetails.new

Given(/^the system has customer account details ctry "([^"]*)",  chnl "([^"]*)", language "([^"]*)", clientRequestId "([^"]*)", ipAddress "([^"]*)", userAgent "([^"]*)", accountNumber "([^"]*)", relId "([^"]*)", uaasId "([^"]*)" and currencyCode "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10|
               
  customerAccountDetails.set_ctry(arg1)
  customerAccountDetails.set_chnl(arg2)
  customerAccountDetails.set_language(arg3)
  customerAccountDetails.set_clientRequestId(arg4)
  customerAccountDetails.set_ipAddress(arg5)
  customerAccountDetails.set_userAgent(arg6)
  customerAccountDetails.set_accountNumber(arg7)
  customerAccountDetails.set_relId(arg8)
  customerAccountDetails.set_uaas2id(arg9)
  customerAccountDetails.set_currencyCode(arg10)
end


When(/^the system requests for customer account details from application service url$/) do 
end
   
Then(/^I should be able to see the customer account details$/) do
  # Write code here that turns the phrase above into concrete actions
  customerAccountDetails.get_customer_account_details
  expect(customerAccountDetails.http_response.code).to eq(200)
  begin
    jsonResp = customerAccountDetails.http_response.body
    puts "server response for customer account detail is"
    puts jsonResp
    
    JSON.parse(customerAccountDetails.http_response.body)  
  rescue JSON::ParserError => e  
    raise e
  rescue Timeout::Error  
    $isTimedOut = true
  end
end


Then(/^I should not be able to see the customer account details$/) do
  # Write code here that turns the phrase above into concrete actions
  customerAccountDetails.get_customer_account_details
  expect(customerAccountDetails.http_response.code).to eq(200)
  begin
    jsonResp = customerAccountDetails.http_response.body
    puts "server response for customer account detail is"
    puts jsonResp
    
    JSON.parse(customerAccountDetails.http_response.body)  
  end
end


  
Then(/^have customer account attributes "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10|
  # Write code here that turns the phrase above into concrete actions
  jsonResp = JSON.parse(customerAccountDetails.http_response.body)

  expect(arg9).to eq(jsonResp['status']['statusCode'])
  expect(arg1).to eq(jsonResp['currencyCode'])
  expect(arg2).to eq(jsonResp['accountNumber'])
  expect(arg3).to eq(jsonResp['currentBalance'])
  expect(arg4).to eq(jsonResp['availableBalance'])
  
end

Then(/^have customer account attributes "([^"]*)", "([^"]*)"$/) do |arg1, arg2|
  jsonResp = JSON.parse(customerAccountDetails.http_response.body)
  expect(arg1).to eq(jsonResp['status']['statusCode'])
  
end

