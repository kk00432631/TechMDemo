class OwnAccountTransferService < CslService
	include HTTParty
	extend MyWorld
	alias set_country set_client_context_country
	alias set_language set_client_context_language
	alias response response
	alias response_business response_business

	def initialize()
		super
		self.class.base_uri self.class.environment.axway_csl_url
		@body_request = {
							  'request' => { 
											  'custId' => '',
											  'fromAccountNumber' => '',
											  'toAccountNumber' => '',
											  'fromAccountCurrency' => '',
											  'toAccountCurrency' => '',
											  'transferAmount' => '0',
											  'transaction_currency' => '',
											  'transaction_type' => ''

											}
		}
		
	end

	def set_customer(customer)
		@customer = customer
		set_rel_id(@customer.rel_id)
		set_country(@customer.country)
	end

	def set_rel_id(rel_id)
		hash = @body_request
		hash['request']['custId'] = rel_id
		@body_request = hash
	end

	def set_from_account(from_account)
		hash = @body_request
		hash['request']['fromAccountNumber'] = from_account
		@body_request = hash
	end

	def set_from_account_currency(from_account_currency)
		hash = @body_request
		hash['request']['fromAccountCurrency'] = from_account_currency
		@body_request = hash
	end

	def set_to_account(to_account)
		hash = @body_request
		hash['request']['toAccountNumber'] = to_account
		@body_request = hash
	end

	def set_to_account_currency(to_account_currency)
		hash = @body_request
		hash['request']['toAccountCurrency'] = to_account_currency
		@body_request = hash
	end

	def set_amount(amount)
		hash = @body_request
		hash['request']['transferAmount'] = amount
		@body_request = hash
	end

	def set_transaction_currency(transaction_currency)
		hash = @body_request
		hash['request']['transaction_currency'] = transaction_currency
		@body_request = hash
	end

	def set_transaction_type(transaction_type)
		hash = @body_request
		hash['request']['transaction_type'] = transaction_type
		@body_request = hash
	end

	def make_immediate_transfer(param="")
		@http_response = self.class.post(	"/transfer/own_account_transfer" + param,
											:body => @body_request.to_json,
											:headers => {	
															"Content-Type" => "application/json", 
															"Accept" => "application/json", 
															"SC_CLIENT_CONTEXT" => @client_context.to_json
														}
										)
	end

	def response
		@http_response
	end

	def response_business
		hash = JSON.parse @http_response.body
		@http_response_business = hash['response']
	end
end