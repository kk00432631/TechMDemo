CAPTURE_CASH_AMOUNT = Transform /^amount ([^"]*)$/ do |amount| 
	amount.gsub(/[,]/, '')
end
