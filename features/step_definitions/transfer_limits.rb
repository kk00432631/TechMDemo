World(CustomerDomain, GeneralCslServiceDomain, MyWorld)

Given(/^I'm customer with customer id "([^"]*)" from country "([^"]*)" with "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |customer_id, country, ebid, customerIdType, channel, uaasId, userId|
  customer.rel_id = customer_id
  customer.ebid = ebid
  customer.country = country
  transfer_limit.set_customerIdType(customerIdType)
  transfer_limit.set_channel(channel)
  transfer_limit.set_uaasId(uaasId)
  transfer_limit.set_userId(userId)
end

Given(/^I'm customer with segment "([^"]*)"$/) do |customer_segment|
  customer.segment = customer_segment
  transfer_limit.set_segCd(customer_segment)
end

Given(/^I want to check my limits available for "([^"]*)"$/) do |txn_type|
  transfer_limit.set_transaction_type(txn_type)
  #transfer_limit.set_limit_type(limit_type)
end

Given(/^I want to check my available limit for txn_type "([^"]*)" and no transaction done 'today' for the txn_type$/) do |txn_type|
  transfer_limit.set_transaction_type(txn_type)
end

Given(/^I want to check my limits available for invalid "([^"]*)"$/) do |txn_type|
  transfer_limit.set_invalid_transaction_type(txn_type)
end

When(/^I retrieve transfer limits from ibanking$/) do
  transfer_limit.set_customer(customer)
  transfer_limit.check_transfer_limits
  
  #puts "response = #{transfer_limit.response_business}"
end

Then(/^My remaining Overall Daily Limit should be greater than "([^"]*)"$/) do |rem_amount|
  limitCat = transfer_limit.response_business['limitCategories']
  my_limit = limitCat.find {|x| x['lmtCatTy'] == 'ODL'}
  expect(my_limit['amt'].to_i).to be > (rem_amount.to_i)
end

Then(/^My remaining Transfer Limit should be greater than "([^"]*)"$/) do |rem_amount|
  limitCat = transfer_limit.response_business['limitCategories']
  my_limit = limitCat.find {|x| x['lmtCatTy'] == 'TXL'}
  expect(my_limit['amt'].to_i).to be > (rem_amount.to_i)
end

Then(/^My transfer limits should contain "([^"]*)"$/) do |limitCatType|
  limitCat = transfer_limit.response_business['limitCategories']
  limit = limitCat.find {|x| x['lmtCatTy'] == limitCatType}
  expect(limit['lmtCatTy']).to eq(limitCatType)
end

Then(/^My transfer service should validate correct txn type with "([^"]*)"$/) do |errorCode|
  expect(transfer_limit.response_business['status']['errCd']).to eq(errorCode)
end






Then(/^My transfer default limit should be equal to "(#{CAPTURE_CASH_AMOUNT})"$/) do |default_limit|
   expect(transfer_limit.response_business['limitCategories']['lmtMaxAmt']).to eq (default_limit.to_i)
end

Given(/^I want to check my available limit for "([^"]*)" in "([^"]*)"$/) do |txn_type, limit_type|
   transfer_limit.set_transaction_type(txn_type)
  #transfer_limit.set_limit_type(limit_type)
end

Then(/^My transfer limit amount available should be equal to "([^"]*)"$/) do |limit_available|
  limitCat = transfer_limit.response_business['limitCategories'][0]['amt']
  my_limit = limitCat.find {|x| x['lmtUsage'] == 'ODL'}
  
  expect(my_limit['amt'].to_i).to eq(available_limit.to_i)
end

Then(/^My transfer default limit is not equal to amount "([^"]*)"$/) do |limit|
  limitCat = transfer_limit.response_business['limitCategories']
  my_limit = limitCat.find {|x| x['lmtUsage'] == 'ODL'}

  expect(my_limit['amt'].to_i).not_to eq(limit.to_i)
end

Then(/^I will receive an error message "([^"]*)" "([^"]*)"\.$/) do |err_msg, err_cd|
  expect(transfer_limit.response_business).to include('ssStatus' => err_cd)
  expect(transfer_limit.response_business).to include('statusDesc' => err_msg)
  expect(ss_limit_endpoint.response_business).to include('ssStatus' => err_cd)
  expect(ss_limit_endpoint.response_business).to include('statusDesc' => err_msg)  

end

Then(/^My available_limit is not equal to "([^"]*)"$/) do |limit|
  expect(transfer_limit.response_business['limitCategories']['amt']).to != (available_limit.to_i)
  userAmount = ss_limit_endpoint.response_business['usedAmt'].to_i
  maxLimitAmt = ss_limit_endpoint.response_business['maxLimitAmt'].to_i
  avlTxnAmt = maxLimitAmt - userAmount
  expect(avlTxnAmt).to be != limit.to_i
end

Then(/^Transaction limit not found for customer which should be equal to "([^"]*)"$/) do |limit|
  expect(transfer_limit.response_business['limitCategories'][0]['lmtAmt']).to eq nil
end

