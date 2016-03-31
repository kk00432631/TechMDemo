class RetailService < CslService
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

	def request_customer_profile(param="")
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