World(GeneralCslServiceDomain, MyWorld)

Given(/^I have a http header client context without "(.*?)" value$/) do |field|
	csl_service.set_client_context_without_field(field)
end

When(/^I send a POST request to "([^"]*)" with http body below:$/) do |url, requestBody|
	csl_service.post(url, requestBody)
end

Then(/^I will receive http response status "([^"]*)"$/) do |status|
  expect(csl_service.response.code).to eq(status.to_i)
end

Then(/^I will get status code "([^"]*)" from JSON response$/) do |status_code|
  expect(csl_service.response_business).to include('statusCode' => status_code)
end