# encoding: utf-8
class Account
  def set(account, amount)
    @account = account
    @amount = amount
  end

  def balance
    @amount
  end

  def account_number
    @account
  end
end

# class CslManager
#   def initialize(account)
#     @account
#   end

#    def transfer(from_acc, to_acc)
#       # Call csl api and save the json respond


#    end

#    def respond

# end

# class jsonGenerator
#   def header
#     @header = config_property['client_context_valid_ctrylist']
#   end

#   def body()
#     @body "{\"request\":{\"userId\":\"XL8JBS8K6\",\"sessionTicket\":\"Gp2gpPzAcDPr96Yc\",\"requestType\":\"CTRYLIST\"}}'"
#   end

#   def config_property
#     fname = "config/csl_header.yml"
#     raise "Environment configuration #{fname} does not exist" unless File.exists?(fname)
#     YAML.load_file(fname)
#   end

# end

module Domain
  def my_account
    @my_account ||= Account.new
  end

  # def csl_manager
  #   @csl_manager ||= CslManager.new(my_account)
  # end
end

World(Domain)

Given(/^I have an account "(.*?)" with amount "(.*?)"$/) do |account_no, amount|
  my_account.set(account_no, amount)
end

When(/^I transfer fund from to same account$/) do 
  pending("Generate json request and send to csl own account transfer API...")
end

Then(/^I will unable to to process the request$/) do
  pending("CLS API should response expected status/error code")
end

Then(/^I will get error message "(.*?)"$/) do |err_msg|
  pending("CLS API should reponse expected error msg")
end