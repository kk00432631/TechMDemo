class SharedServicesLimitsEndPoint < CslService
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
											'uaasId'=>'123456',
			                                'ebid'=>'123456',
											'userId'=>'123456',
											'customerId'=>'',
											'customerIdType'=>'01',
			                                'customerSegment'=>'',
			                                'sessionId'=>'235265656',
			                                'txnTy'=>'',
                                			'lmtCatTy'=>'CDTL',
                                			'country' => ''
											}
		}
		
	end

	def set_customer(customer)
		@customer = customer
		set_rel_id(@customer.rel_id)
		set_country(@customer.country)
		set_ebid(@customer.ebid)
		set_country(@customer.country)
		set_segment(@customer.segment)
	end

	def set_rel_id(rel_id)
		hash = @body_request
		hash['request']['customerId'] = rel_id
		@body_request = hash
	end

	def set_ebid(ebid)
		hash = @body_request
		hash['request']['ebid'] = ebid
		@body_request = hash
	end

	def set_txnty(txnty)
		hash = @body_request
		hash['request']['txnty'] = txnty
		@body_request = hash
	end

	def set_country(country)
		hash = @body_request
		hash['request']['country'] = country
		@body_request = hash
	end
	
	def set_segment(segment)
		hash = @body_request
		hash['request']['customerSegment'] = segment
		@body_request = hash
	end	

	def hit_ss_limit_endpoint(param="")
		@http_response = self.class.post(	"/sharedService/transfer/limit" + param,
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
		@http_response_business = hash['ssLimitResponse']
	end
end