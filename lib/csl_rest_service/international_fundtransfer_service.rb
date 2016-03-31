class InternationalFundTransferService < CslService
	include HTTParty
	extend MyWorld
	alias set_country set_client_context_country
	alias set_language set_client_context_language
	alias response response
	alias response_business response_business
	attr_accessor :amount

	def initialize()
		super
		self.class.base_uri self.class.environment.axway_csl_url
		@body_request = {
							  'request' => { 
											  'custId' => '',
											  'country' => '',
											  'accountnumber' => '',
											  'accountcurrency' => '',
											  'accountavailablebalance' => '',
											  'beneficiaryaccountnumber' => '',
											  'beneficiaryaccountcurrency' => '',
											  'beneficiarycountry' => '',
											  'beneficiaryaddress1' => '',
											  'beneficiaryaddress2' => '',
											  'beneficiaryaddress3' => '',
											  'beneficiarybankname' => '',
											  'beneficiarybankcountry' => '',
											  'beneficiarybankcode' => '',
											  'amount' => '',
											  'transactioncurrency' => '',
											  'transactiontype' => ''
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

	def set_country(country)
		hash = @body_request
		hash['request']['country'] = country
		@body_request = hash
	end

	def set_accountnumber(accountnumber)
		hash = @body_request
		hash['request']['accountnumber'] = accountnumber
		@body_request = hash
	end

	def set_accountcurrency(accountcurrency)
		hash = @body_request
		hash['request']['accountcurrency'] = accountcurrency
		@body_request = hash
	end

	def set_accountavailablebalance(accountavailablebalance)
		hash = @body_request
		hash['request']['accountavailablebalance'] = accountavailablebalance
		@body_request = hash
	end

	def set_beneficiaryaccountnumber(beneficiaryaccountnumber)
		hash = @body_request
		hash['request']['beneficiaryaccountnumber'] = beneficiaryaccountnumber
		@body_request = hash
	end

	def set_beneficiaryaccountcurrency(beneficiaryaccountcurrency)
		hash = @body_request
		hash['request']['beneficiaryaccountcurrency'] = beneficiaryaccountcurrency
		@body_request = hash
	end

	def set_beneficiarycountry(beneficiarycountry)
		hash = @body_request
		hash['request']['beneficiarycountry'] = beneficiarycountry
		@body_request = hash
	end

	def set_beneficiaryname(beneficiaryname)
		hash = @body_request
		hash['request']['beneficiaryname'] = beneficiaryname
		@body_request = hash
	end

	def set_beneficiaryaddress1(beneficiaryaddress1)
		hash = @body_request
		hash['request']['beneficiaryaddress1'] = beneficiaryaddress1
		@body_request = hash
	end

	def set_beneficiaryaddress2(beneficiaryaddress2)
		hash = @body_request
		hash['request']['beneficiaryaddress2'] = beneficiaryaddress2
		@body_request = hash
	end

	def set_beneficiaryaddress3(beneficiaryaddress3)
		hash = @body_request
		hash['request']['beneficiaryaddress3'] = beneficiaryaddress3
		@body_request = hash
	end

	def set_beneficiarybankname(beneficiarybankname)
		hash = @body_request
		hash['request']['beneficiarybankname'] = beneficiarybankname
		@body_request = hash
	end

	def set_beneficiarybankcountry(beneficiarybankcountry)
		hash = @body_request
		hash['request']['beneficiarybankcountry'] = beneficiarybankcountry
		@body_request = hash
	end

	def set_beneficiarybankcode(beneficiarybankcode)
		hash = @body_request
		hash['request']['beneficiarybankcode'] = beneficiarybankcode
		@body_request = hash
	end

	def set_amount(amount)
		@amount = amount
		hash = @body_request
		hash['request']['amount'] = amount
		@body_request = hash
	end

	def set_transactioncurrency(transactioncurrency)
		hash = @body_request
		hash['request']['transactioncurrency'] = transactioncurrency
		@body_request = hash
	end

	def set_transactiontype(transactiontype)
		hash = @body_request
		hash['request']['transactiontype'] = transactiontype
		@body_request = hash
	end

	def make_international_fund_transfer(param="")
		@http_response = self.class.post(	"/transfer/telegrafic_fund_transfer" + param,
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