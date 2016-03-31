class Customer
attr_accessor :rel_id, :ebid, :country, :account, :segment

	def initialize
		@account = []
	end

	def add_account(account_no, balance, currency_code)
		@account.push(Account.new(account_no, balance, currency_code))
	end

	def set_account_table(account_table)
		account_table.hashes.each do | list |
			account.push(Account.new(list['account'], list['balance'], list['currency_code']))
		end
	end

	def find_all_account
		@account
	end

	def find_first_account
		@account[0]
	end

	def find_account_by_account_no(account_no)
		@account.each do | acc |
			if acc.account_no == account_no
				return acc
			end
		end
	end
end

class Account
	attr_accessor :account_no, :balance, :currency_code

	def initialize(account_no, balance, currency_code)
		@account_no = account_no
		@balance = balance
		@currency_code = currency_code
	end
end

class Transaction
	attr_accessor :txn_type_code, :limit_type_code

	def initialize
				@txn_type_code = {
							  'own_acc_transfer' => 'OWN',
							  '3rd_party_transfer' => '16',
							  'interbank_transfer' => '18',
							  'telegraphic_transfer' => 'INFT'
							}
				@limit_type_code = {
							'default_authorisation' => 'NDTL',
							'max_authorisation' => 'DDTL',
							'max_limit_per_day' => 'OIDL',
							'max_limit_per_txn' => 'PTL',
							'overall_daily_limit' => 'ODL'
				}
	end

end

module CustomerDomain
	def customer
		@customer ||= Customer.new
	end

	def transaction
		@transaction ||= Transaction.new
	end
end