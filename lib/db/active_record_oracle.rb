# require 'rubygems'
# require 'active_record'
# ActiveRecord::Base.establish_connection(:adapter => "oracle_enhanced", :database => "//10.206.66.45:1523/SCBKEADC",:username => "afropay",:password => "Welcome1234", :pool => "2")

# class MailBox < ActiveRecord::Base
# 	self.table_name = "notification.mailbox"

# 	private
# 		def mailbox_params
# 	      params.require(:mailbox).permit(:ctry_cd, :msg_to, :msg_status)
# 	    end
# end

# record = MailBox.where(ctry_cd: 'KE')
# puts record
