World(CustomerDomain, GeneralCslServiceDomain, MyWorld)

Given(/^I'm customer with customer details$/) do |table|
	table.hashes.each do |x| 
	customer.rel_id =  x['customer_id']
	customer.ebid   =  x['ebid']
	customer.segment = x['customer_segment']
	customer.country = x['country']
	customer.channel = x['channel'] 
    end
 end

Given(/^I have accounts$/) do |table|
	customer.set_account_table(table)
end

Given(/^I have telegraphic transfer payee$/) do |table|
end

When(/^I perform telegraphic transfer with details of Debit Currency "([^"]*)", Credit Currency "([^"]*)", Debit Account Number "([^"]*)", Transfer Amount "([^"]*)", Transfer Currency "([^"]*)", Charge Type "([^"]*)"$/) do |debtCCY, creditCCY, debitAccNum, transferAmount, transferCurrency, chargeType|
     get_transaction_fee.set_debitaccountcurrency(debtCCY)
     get_transaction_fee.set_creditaccountcurrency(creditCCY)
     get_transaction_fee.set_amount(transferAmount)
     get_transaction_fee.set_debitaccountnumber(debitAccNum)
     get_transaction_fee.set_amount(transferAmount)
     get_transaction_fee.set_chargetype(chargeType)
end

Then(/^I able to view charges and details with Charge Amount "([^"]*)", Charge Currency "([^"]*)"$/) do |charges_amount, charges_currency|
     #puts "Response-----> #{get_transaction_fee.response_business}"
     expect(get_transaction_fee.response_business['responseBody']['charges']['chargeAmount'].to_s).to eq(charges_amount)
     expect(get_transaction_fee.response_business['responseBody']['charges']['chargeCCY'].to_s).to eq(charges_currency)
end