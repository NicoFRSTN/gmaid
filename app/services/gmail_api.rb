
class GmailApi

  def self.all_messages_for(user)
    endpoint = "https://gmail.googleapis.com/gmail/v1/users/nicolas.feuerstein%40gmail.com/messages?maxResults=50&key=AIzaSyDen2EikLCReQegow6qnJDvIFUrtd1niXI"
    headers = {}
    headers["Authorization"] = "Bearer #{user.google_token}"
    headers["Accept"] = "application/json"
    puts headers

    uri = URI.parse(endpoint)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    puts http.get(uri.request_uri, headers).body
    binding.pry
    # puts JSON.parse(Net::HTTP.get(URI(uri), headers))
  end

end

#GmailApi.all_messages_from('fnac.com')
