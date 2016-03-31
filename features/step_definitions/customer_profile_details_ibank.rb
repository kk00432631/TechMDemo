World(CustomerDomain, GeneralCslServiceDomain, MyWorld)

$isTimedOut
customerProfileDetailsIbank = CustomerProfileDetailsIbank.new

Given(/^the system has customer details ctry "([^"]*)",  chnl "([^"]*)", language "([^"]*)", clientRequestId "([^"]*)", ipAddress "([^"]*)", userAgent "([^"]*)", customerId "([^"]*)", relId "([^"]*)", uaasId "([^"]*)", customerIdType "([^"]*)" and ebId "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11|
               
  customerProfileDetailsIbank.set_ctry(arg1)
  customerProfileDetailsIbank.set_chnl(arg2)
  customerProfileDetailsIbank.set_language(arg3)
  customerProfileDetailsIbank.set_clientRequestId(arg4)
  customerProfileDetailsIbank.set_ipAddress(arg5)
  customerProfileDetailsIbank.set_userAgent(arg6)
  customerProfileDetailsIbank.set_customerId(arg7)
  customerProfileDetailsIbank.set_relId(arg8)
  customerProfileDetailsIbank.set_uaas2id(arg9)
  customerProfileDetailsIbank.set_customerIdType(arg10)
  customerProfileDetailsIbank.set_ebId(arg11)
end


When(/^the system requests for customer details from application service url$/) do 
end
   
Then(/^I should be able to see the customer details$/) do
  # Write code here that turns the phrase above into concrete actions
  customerProfileDetailsIbank.get_customer_profile_details_ibank
  expect(customerProfileDetailsIbank.http_response.code).to eq(200)
  begin
    jsonResp = customerProfileDetailsIbank.http_response.body
    puts "server response for customer profile iBank is"
    puts jsonResp
    
    JSON.parse(customerProfileDetailsIbank.http_response.body)  
  rescue JSON::ParserError => e  
    raise e
  rescue Timeout::Error  
    $isTimedOut = true
  end
end


Then(/^I should not be able to see the customer details$/) do
  # Write code here that turns the phrase above into concrete actions
  customerProfileDetailsIbank.get_customer_profile_details_ibank
  expect(customerProfileDetailsIbank.http_response.code).to eq(200)
  begin
    jsonResp = customerProfileDetailsIbank.http_response.body
    puts "server response for customer profile iBank is :"
    puts jsonResp
    
    JSON.parse(customerProfileDetailsIbank.http_response.body)  
  end
end


  
Then(/^have customer ibank attributes "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25, arg26, arg27, arg28, arg29, arg30, arg31, arg32, arg33|
  # Write code here that turns the phrase above into concrete actions
  jsonResp = JSON.parse(customerProfileDetailsIbank.http_response.body)

  expect(arg2).to eq(jsonResp['customerId'])
  expect(arg9).to eq(jsonResp['firstName'])
  expect(arg11).to eq(jsonResp['lastName'])
  expect(arg15).to eq(jsonResp['mobilePhone'])
  expect(arg18).to eq(jsonResp['mailingAddress1'])
  expect(arg25).to eq(jsonResp['mailingCountry'])
  expect(arg27).to eq(jsonResp['emailAddress'])
  expect(arg30).to eq(jsonResp['status']['statusCode'])
  expect(jsonResp['updatedDate']).not_to eq(nil)
  
end

Then(/^have customer ibank attributes "([^"]*)", "([^"]*)"$/) do |arg1, arg2|
  jsonResp = JSON.parse(customerProfileDetailsIbank.http_response.body)
  expect(arg1).to eq(jsonResp['status']['statusCode'])
  
end

