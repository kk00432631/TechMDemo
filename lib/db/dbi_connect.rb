# require 'dbi'

# dbh = DBI.connect('DBI:OCI8://10.206.66.45:1523/SCBKEADC', 'afropay', 'Welcome1234')
# rs = dbh.prepare('SELECT * FROM notification.mailbox')
# rs.execute
# while rsRow = rs.fetch do
#    p rsRow
#    #Alternative output: puts rsRow
#    #Alternative output: pp rsRow
# end
# rs.finish
# dbh.disconnect 
