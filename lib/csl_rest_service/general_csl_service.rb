class CslService

	def initialize()
		@client_context = {
							        'msgId '=>'12234546566abcdef232300', 
									'ctry'=>'CN',
									'chnl'=>'IBKBMW',
									'language'=>'en',
									'ipAddress'=>'10.10.20.23',
									'userAgent'=>' Windows 7|Chrome|2015-10-06|19=>47=>01.365|+0800||| NotAvailable|settings_maintenance|1412|', 
									'uaasId'=>'123456',
									'ebid'=>'123456',
									'userId'=>'123456',
									'relId'=> '123456',
									'customerId'=>'123456',
									'customerIdType'=>'01',
									'customerSegment'=>'EXBN',
									'sessionId'=>'S-FhyK-JOlAYX3o6D3pVz12kyiv9Y1-Q'
							}
	end

	def client_context
		@client_context
	end

	def set_client_context_without_field(field)
		hash = @client_context
		hash[field.camelcase(:lower)] = ""
		@client_context = hash
	end

	def set_client_context_country(text)
		hash = @client_context
		hash['country'] = text
		@client_context = hash
	end

	def set_customerId(customerId)
		hash = @client_context
		hash['customerId'] = customerId
		hash['relId'] = customerId
		@client_context = hash
	end

	def set_client_context_language(text)
		hash = @client_context
		hash['language'] = text
		@client_context = hash
	end

	def post(url, text)
		@http_response = HTTParty.post(	url, 
										:body => JSON.parse(text).to_json,
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

module GeneralCslServiceDomain

	def csl_service
		@csl_service ||= CslService.new
	end

	def own_account_trasnfer
		@own_account_transfer ||= OwnAccountTransferService.new
	end

	def transfer_limit
		@transfer_limit ||= TransferLimitService.new
	end

	def international_fund_transfer
		@international_fund_transfer ||= InternationalFundTransferService.new
	end

	def ss_limit_endpoint
		@ss_limit_endpoint ||= SharedServicesLimitsEndPoint.new
	end

end
