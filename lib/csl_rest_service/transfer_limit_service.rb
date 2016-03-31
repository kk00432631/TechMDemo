class TransferLimitService < CslService
	attr_accessor :txn_type, :limit_type
	include HTTParty
	extend MyWorld
	alias set_country set_client_context_country
	alias set_language set_client_context_language
	alias response response
	alias response_business response_business

	def initialize()
		super
		self.class.base_uri self.class.environment.axway_csl_url
		
		@client_context = {  
		   'user'=>{  
			  'clientRequestId'=>'12234546566abcdef232300',
			  'uaasId'=>'123456',
			  'userId'=>'123456',
			  'customerId'=>'123456',
			  'country'=>'SG',
			  'channel'=>'IBKBMW',
			  'customerIdType'=>'01',
			  'segCd'=>'',
			  'akamaiIP'=>'20.20.20.20',
			  'webserverIP'=>'30.30.30.30',
			  'sessionId'=>'S-FhyK-JOlAYX3o6D3pVz12kyiv9Y1-Q',
			  'language'=>'en',
			  'ipAddress'=>'10.10.20.23',
			  'userAgent'=>'Windows7'
			}
		}

		@body_request = {
  			'ctry' => '',
  			'txnTy' => ''
  		}

		@transaction = Transaction.new
	end

	def my_own()
		puts "client_context #{@client_context}"
		puts "body_request #{@body_request}"
	end

	def set_customer(customer)
		@customer = customer
		set_rel_id(@customer.rel_id)
		#set_country(@customer.country)
		#
		# new schema : not finalise by CSL service yet
		hash = @client_context
		hash['user']['country'] = @customer.country
		@client_context = hash

		hash = @body_request
		hash['ctry'] = @customer.country
		@body_request = hash
	end

	def set_rel_id(rel_id)
		hash = @client_context
		hash['user']['customerId'] = rel_id
		@client_context = hash
	end

    def set_customerIdType(customerIdType)
    	hash = @client_context
		hash['user']['customerIdType'] = customerIdType
		@client_context = hash
    end

    def set_segCd(segCd)
    	hash = @client_context
		hash['user']['segCd'] = segCd
		@client_context = hash
    end

	def set_transaction_type(txn_type)
		@txn_type = txn_type
		hash = @body_request
		hash['txnTy'] = @transaction.txn_type_code[txn_type]
		@body_request = hash
	end

    def set_invalid_transaction_type(txn_type)
		@txn_type = txn_type
		hash = @body_request
		hash['txnTy'] = txn_type
		@body_request = hash
	end

	def set_channel(channel)
		hash = @client_context
		hash['user']['channel'] = channel
		@client_context = hash
	end

    def set_uaasId(uaasId)
		hash = @client_context
		hash['user']['uaasId'] = uaasId
		@client_context = hash
	end

	def set_userId(userId)
		hash = @client_context
		hash['user']['userId'] = userId
		@client_context = hash
	end

	# def set_limit_type(limit_type)
	# 	@limit_type = limit_type
	# 	hash = @body_request
	# 	hash['lmtCatTy'] = @transaction.limit_type_code[limit_type]
	# 	@body_request = hash
	# end

	def check_transfer_limits(param="")
		uri = URI(URI.escape self.class.environment.axway_csl_url + "/cxf/sc/csl/retail/v1/limits/" + @body_request['ctry'] + "/" + @body_request['txnTy'])
		puts "\n------------#{uri}"
		puts "\n-------#{@client_context.to_json}"
		@http_response = self.class.get(uri,
											:headers => {	
															"Content-Type" => "application/json", 
															"Accept" => "application/json", 
															"SC-CLIENT-CONTEXT" => @client_context.to_json
															#"operationName" => "getLimitUsage"
														}
										)
	end

	def response
		@http_response
	end

	def response_business
		hash = JSON.parse @http_response.body
		puts "\n--------hash ------- #{hash}"
		@http_response_business = hash
	end
end
