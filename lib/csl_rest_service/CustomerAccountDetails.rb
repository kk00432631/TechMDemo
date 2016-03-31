class CustomerAccountDetails < CslService
	include HTTParty
	extend MyWorld
	alias set_country set_client_context_country
	alias set_language set_client_context_language
	alias response response
	alias response_business response_business

		
	def initialize()
		super
		self.class.base_uri self.class.environment.account_details_csl_url
		
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
							'currencyCode' => '',
							'accountNumber' => ''
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

	def set_currencyCode(currencyCode)
		hash = @body_request
		hash['currencyCode'] = currencyCode
		@body_request = hash
	end
	
	def set_accountNumber(accountNumber)
		hash = @body_request
		hash['accountNumber'] = accountNumber
		@body_request = hash
	end 
									 	
	
	def get_customer_account_details(param="")
		uri = URI(URI.escape self.class.environment.account_details_csl_url + "/cxf/account/account/detail" + param + "?query=" + @body_request.to_json)
		puts 'request from client for customer account detail is'
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