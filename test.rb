query = "SELECT sender_email, COUNT(*) AS number FROM messages GROUP BY sender_email ORDER BY number DESC LIMIT 10"

results =  ActiveRecord::Base.connection.execute(query)

results.each do |result|
  puts result
end
