# query = "SELECT sender_email, COUNT(*) AS number FROM messages GROUP BY sender_email ORDER BY number DESC LIMIT 10"

# results =  ActiveRecord::Base.connection.execute(query)

# results.each do |result|
#   puts result
# end


ap "je suis la"

user =  User.last


Message.destroy_all

SyncMessages.new(user).call

Message.all.each do |message|
  ap "--------------"
  ap message.snippet
  ap message.labels.pluck(:name)
end
