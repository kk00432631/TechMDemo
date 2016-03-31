#This is one of the sample request which we will send to csl(End Point)
class GetTransactionFeeTTService < CslService
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
			               'requestBody' =>{
							 				 'user' => { 
											 				 'custId' => '',
															  'custIdType' => '',
															  'country' => '',
															  'channel' => ''
														  },	  
	
											'transaction' => {	
						                  					   'debitCCY' => '',
														   	  'creditCCY' => '',
															  'debitAccNum' => '',
															  'debitProCode' => '',
															  'transferAmount' => '',
															  'transferCCY' => '',
															  'chargeType' => '',
									   						 }
					       				     }
					      } 				     
		@body_response = {
							'responseHeader' => { 
														'status' => { 
											 					       'statusCode' => '00000',
																       'statusDesc' => 'SUCCESSFUL'
																  }
												},	  
	
							'responseBody' => {	
						                  				'charges' => { 
											 				 	       'chargeAmount' => '50.00',
																       'chargeCCY' => 'SGD'
															         }
											 }
			            }	

					@transaction = Transaction.new		
    	end
    	
    
	def set_customer(customer)
		@customer = customer
		set_rel_id(@customer.rel_id)
		set_custIdType(@customer.customertype)
		set_country(@customer.country)
		set_channel(@customer.channel)

	end

	def set_rel_id(rel_id)
		hash = @body_request
		hash['requestBody']['user']['custId'] = rel_id
		@body_request = hash
	end

	def set_custIdType(custIdType)
		hash = @body_request
		hash['requestBody']['user']['custIdType'] = custIdType
		@body_request = hash
	end

	def set_country(country)
		hash = @body_request
		hash['requestBody']['user']['country'] = country
		@body_request = hash
	end
    
    def set_channel(channel)
		hash = @body_request
		hash['requestBody']['user']['channel'] = channel
		@body_request = hash
	end
	
	def set_debitaccountnumber(debitAccNum)
		hash = @body_request
		hash['requestBody']['transaction']['debitCCY'] = debitAccNum
		@body_request = hash
	end

	def set_debitaccountcurrency(debitCCY)
		hash = @body_request
		hash['requestBody']['transaction']['debitCCY'] = debitCCY
		@body_request = hash
	end

    
	def set_creditaccountcurrency(creditCCY)
		hash = @body_request
		hash['requestBody']['transaction']['creditCCY'] = creditCCY
		@body_request = hash
	end		

	def set_amount(transferAmount)
		hash = @body_request
		hash['requestBody']['transaction']['transferAmount'] = transferAmount
		@body_request = hash
	end

	def set_transactioncurrency(transferCCY)
		hash = @body_request
		hash['requestBody']['transaction']['transferCCY'] = transferCCY
		@body_request = hash
	end

	def set_chargetype(chargeType)
		hash = @body_request
		hash['requestBody']['transaction']['chargeType'] = chargeType
		@body_request = hash
	end

	
	def check_transfer_limits(param="")
		uri = URI(URI.escape self.class.environment.axway_csl_url + "/sc/csl/retail/v1/charges" + param + "?query=" + @body_request.to_json)
		@http_response = self.class.get(uri,
											:headers => {	
															"Content-Type" => "application/json", 
															"Accept" => "application/json", 
															# "SC_CLIENT_CONTEXT" => @client_context.to_json,
															#{}"operationName" => "getLimitUsage"
														}
												
						)
	end

	def response
		@http_response
	end

	def response_business
		hash = JSON.parse @body_response.to_json
		@http_response_business = hash
	end
end