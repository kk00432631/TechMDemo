class CustomerAccountSummaryDetails < CslService
	include HTTParty
	extend MyWorld
	alias set_country set_client_context_country
	alias set_language set_client_context_language
	alias response response
	alias response_business response_business

		
	def initialize()
		super
		self.class.base_uri self.class.environment.account_summary_details_csl_url
		
		@body_request = {
			  
						'user' => {
						    'ctry' => '',
						    'chnl' => '',
						    'relId' => '',
						    'uaas2id' => '',
						    'language' => '',
						    'ipAddress' => '',
						    'clientRequestId' => '',
						    'userAgent' => ''						    
						  },
							'relationshipNumber' => ''
							
						}
		@transaction = Transaction.new

	end

	def	 set_clientRequestId(clientRequestId) 
		hash = @body_request
		hash['user']['clientRequestId'] = clientRequestId
		@body_request = hash
	end
	 
	def set_ctry(ctry) 
		hash = @body_request
		hash['user']['ctry'] = ctry
		@body_request = hash
	end
	 
	def set_chnl(chnl)
		hash = @body_request
		hash['user']['chnl'] = chnl
		@body_request = hash
	end
	
	def set_language(language)
		hash = @body_request
		hash['user']['language'] = language
		@body_request = hash
	end
	
	def set_userAgent(userAgent)
		hash = @body_request
		hash['user']['userAgent'] = userAgent
		@body_request = hash
	end
	
	def set_ipAddress(ipAddress) 
		hash = @body_request
		hash['user']['ipAddress'] = ipAddress
		@body_request = hash
	end
	 
	def set_relId(relId)
		hash = @body_request
		hash['user']['relId'] = relId
		@body_request = hash
	end
	
	def set_uaas2id(uaas2id)
		hash = @body_request
		hash['user']['uaas2id'] = uaas2id
		@body_request = hash
	end

	def set_relationshipNumber(relationshipNumber)
		hash = @body_request
		hash['relationshipNumber'] = relationshipNumber
		@body_request = hash
	end
	
									 	
	
	def get_customer_account_summary_details(param="")
		uri = URI(URI.escape self.class.environment.account_summary_details_csl_url + "/cxf/account/account/list" + param + "?query=" + @body_request.to_json)
		puts 'request from client for customer account summary is'
		puts @body_request.to_json
	
		@http_response = self.class.get(uri,
                                    		:headers => {
                                                                "Content-Type" => "application/json",
                                                                "Accept" => "application/json"
                                                                }
                                )
		
	end

	
	
	def http_response() 
		@http_response
	end
end