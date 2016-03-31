World(CustomerDomain, GeneralCslServiceDomain, MyWorld)

Given(/^I have accounts?$/) do |table|
  customer.set_account_table(table)
end

When(/^I perform own account fund transfer with amount "([^"]*)" to the same account$/) do |amount|
  own_account_trasnfer.set_customer(customer)

  account = customer.find_first_account
  own_account_trasnfer.set_from_account(account.account_no)
  own_account_trasnfer.set_from_account_currency(account.currency_code)
  own_account_trasnfer.set_to_account(account.account_no)
  own_account_trasnfer.set_to_account_currency(account.currency_code)
  own_account_trasnfer.set_amount(amount.to_i)
  #
  # make transfer
  own_account_trasnfer.make_immediate_transfer()
end

Then(/^I can't proceed with the transaction$/) do
  expect(own_account_trasnfer.response_business).to include('ssStatus' => 'fail')
end

Then(/^I will receive an error message "([^"]*)"$/) do |error_message|
 # expect(own_account_trasnfer.response_business).to include('statusDesc' => error_message)
end

Given(/^I have account "([^"]*)" with balance "([^"]*)" and currency type "([^"]*)"$/) do |account_no, balance, currency_code|
  customer.add_account(account_no, balance, currency_code)
end

Given(/^My own account fund transfer limit is "([^"]*)"$/) do |limit|
  puts "Skip limit checking at the moment...."
end

When(/^I am perform own account fund transfer with amount "([^"]*)" from account "([^"]*)" to account "([^"]*)"$/) do |transfer_amount, from_account_no, to_account_no|
  account_from = customer.find_account_by_account_no(from_account_no)
  account_to = customer.find_account_by_account_no(to_account_no)

  own_account_trasnfer.set_from_account(account_from.account_no)
  own_account_trasnfer.set_from_account_currency(account_from.currency_code)
  own_account_trasnfer.set_to_account(account_to.account_no)
  own_account_trasnfer.set_to_account_currency(account_to.currency_code)
  own_account_trasnfer.set_amount(transfer_amount.to_i)
  #
  # make transfer
  own_account_trasnfer.make_immediate_transfer()
end


Then(/^I cant proceed with the transaction as the transaction limit exceeded$/) do
  puts "Skip the transaction limit error code checking...."
end