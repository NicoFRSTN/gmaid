
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
    result = JSON.parse(http.get(uri.request_uri, headers).body)
    result['messages'].each do |message|
      details = get_details_for(message['id'])
      user.messages.create(object: details[:Subject], sender_email: details[:From], date: details[:Date], content: details[:snippet])
    end
    binding.pry
  end

  def self.get_details_for(message_id)
    # ici on tape l'API de nouveau
    endpoint = "https://gmail.googleapis.com/gmail/v1/users/nicolas.feuerstein%40gmail.com/messages/#{message_id}/trash?key=AIzaSyDen2EikLCReQegow6qnJDvIFUrtd1niXI"
    headers = {}
    headers["Authorization"] = "Bearer #{user.google_token}"
    headers["Accept"] = "application/json"
    puts headers
    uri = URI.parse(endpoint)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    result = JSON.parse(http.get(uri.request_uri, headers).body)
  end

end

#GmailApi.all_messages_from('fnac.com')
