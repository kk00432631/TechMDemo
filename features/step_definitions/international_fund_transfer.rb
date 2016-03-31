World(CustomerDomain, GeneralCslServiceDomain, MyWorld)

Given(/^I'm customer with customer details "([^"]*)", "([^"]*)","([^"]*)" from country "([^"]*)"$/) do |customer_id, ebid, customer_segment, country|
  customer.rel_id = customer_id
  puts customer_id
  customer.ebid = ebid
  customer.segment = customer_segment
  customer.country = country
  international_fund_transfer.set_customer(customer)
end

Given(/^I have accounts "([^"]*)", "([^"]*)" with account currency "([^"]*)"$/) do |acct_num, acct_avail_bal, acct_cry|
  international_fund_transfer.set_accountnumber(acct_num)
   international_fund_transfer.set_accountcurrency(acct_cry)
   international_fund_transfer.set_accountavailablebalance(acct_avail_bal)
end

Given(/^I have beneficiary details "([^"]*)", "([^"]*)", "([^"]*)","([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" and "([^"]*)"$/) do |beneficiary_account, ben_acct_cry, ben_ctry, ben_name, ben_add1,ben_add2, ben_add3, ben_bank_name, ben_bank_country, ben_bank_code|
  international_fund_transfer.set_beneficiaryaccountnumber(beneficiary_account)
  international_fund_transfer.set_beneficiaryaccountcurrency(ben_acct_cry)
  international_fund_transfer.set_beneficiarycountry(ben_ctry)
  international_fund_transfer.set_beneficiaryname(ben_name)
  international_fund_transfer.set_beneficiaryaddress1(ben_add1)
  international_fund_transfer.set_beneficiaryaddress1(ben_add2)
  international_fund_transfer.set_beneficiaryaddress1(ben_add3)
  international_fund_transfer.set_beneficiarybankname(ben_bank_name)
  international_fund_transfer.set_beneficiarybankcountry(ben_bank_country)
  international_fund_transfer.set_beneficiarybankcode(ben_bank_code)
  international_fund_transfer.set_customerId(@customer.rel_id)
  international_fund_transfer.set_client_context_country(@customer.country)
end

When(/^I am performing  the international fund transfer where transaction type "([^"]*)" with an amount of "([^"]*)" with TXN currency type "([^"]*)"$/) do |transaction_type, amount, txn_currency|
  international_fund_transfer.set_amount(amount)
  international_fund_transfer.set_transactioncurrency(txn_currency)
  international_fund_transfer.set_transactiontype(transaction_type)
  international_fund_transfer.make_international_fund_transfer()
end

Then(/^My transaction is completed$/) do
  
end

Then(/^The transaction status is Submitted$/) do
 expect(international_fund_transfer.response_business).to include('ssStatus' => 'submitted')
  puts "response = #{international_fund_transfer.response_business}"
  hostStatusCode = international_fund_transfer.response_business['hostStatusCode'].to_s
  expect(hostStatusCode).to be == "00100" 
 
end

Then(/^I cant proceed with the transaction as the transfer amount is less than the minimum amount\.$/) do
  puts "response = #{international_fund_transfer.response_business}"
  expect(international_fund_transfer.response_business).to include('ssStatus' => 'validationError')
end

Then(/^I will receive an error message "([^"]*)"\.$/) do |error_message|
  expect(international_fund_transfer.response_business).to include('statusDesc' => error_message)
end

Then(/^I cant proceed with the transaction as the transfer amount format is not correct\.$/) do
  expect(international_fund_transfer.response_business).to include('ssStatus' => 'validationError')
end

# Then(/^I will receive an error message "([^"]*)" "([^"]*)"\.$/) do |error_message, arg2|
#   expect(international_fund_transfer.response_business).to include('statusDesc' => error_message)
# end

Then(/^I cant proceed with the transaction as the transfer amount is greater than the "([^"]*)"\.$/) do |amount|
  puts amount
  expect(international_fund_transfer.response_business).to include('ssStatus' => 'validationError')
end

Then(/^I cant proceed with the transaction as the length of the address which is a concatinated with beneficiary country is greater than "([^"]*)" charecters\.$/) do |arg1|
 expect(international_fund_transfer.response_business).to include('ssStatus' => 'validationError')
end

Then(/^I cant proceed with the transaction as the benificiary bank code is not valid\.$/) do
 expect(international_fund_transfer.response_business).to include('ssStatus' => 'validationError')
end

Then(/^I cant proceed with the transaction as the transfer amount is greater than the available amount\.$/) do
  expect(international_fund_transfer.response_business).to include('ssStatus' => 'validationError')
end

Then(/^I cant proceed with the transaction as one of the mandatory field is empty\.$/) do
  expect(international_fund_transfer.response_business).to include('ssStatus' => 'validationError')
end


Then(/^I cant proceed with the transaction as the transaction limit "([^"]*)" exceeded\.$/) do |transaction_limit|
  expect(international_fund_transfer.response_business).to include('ssStatus' => 'validationError')
  #puts "response = #{international_fund_transfer.response_business}"
  ss_limit_endpoint.set_customer(customer)
  ss_limit_endpoint.set_txnty(19)
  ss_limit_endpoint.hit_ss_limit_endpoint()
  puts "responseFromSharedServices = #{ss_limit_endpoint.response_business}"
  userAmount = ss_limit_endpoint.response_business['usedAmt'].to_i
  maxLimitAmt = ss_limit_endpoint.response_business['maxLimitAmt'].to_i
  avlTxnAmt = maxLimitAmt - userAmount
  expect(avlTxnAmt).to be < international_fund_transfer.amount.to_i
end

Then(/^I cant proceed with the transaction as the over all daily transaction limit "([^"]*)" exceeded\.$/) do |arg1|
  expect(international_fund_transfer.response_business).to include('ssStatus' => 'validationError')
  ss_limit_endpoint.set_customer(customer)
  ss_limit_endpoint.set_txnty(19)
  ss_limit_endpoint.hit_ss_limit_endpoint()
  puts "responseFromSharedServices = #{ss_limit_endpoint.response_business}"
  userAmount = ss_limit_endpoint.response_business['usedAmt'].to_i
  maxLimitAmt = ss_limit_endpoint.response_business['maxLimitAmt'].to_i
  avlTxnAmt = maxLimitAmt - userAmount
  expect(avlTxnAmt).to be < international_fund_transfer.amount.to_i
end

Then(/^need to check the transaction is sucessful\/rejected,expected status "([^"]*)"$/) do |status|
  expect(international_fund_transfer.response_business).to include('ssStatus' => status)
  hostStatusCode = international_fund_transfer.response_business['hostStatusCode'].to_s
  expect(hostStatusCode).to be == "00000"
end

Then(/^I cant proceed with the transaction as the charges amount is empty\/null\.$/) do
  expect(international_fund_transfer.response_business).to include('ssStatus' => 'success')
    chargesAmount = international_fund_transfer.response_business['chrgAmt']
    expect(chargesAmount.to_i != nil) 
    expect(chargesAmount.to_i != "" )
    expect(chargesAmount.to_i != 0)
end