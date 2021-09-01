require "uri"
require "net/http"

class DeleteGoogleMessage
  def initialize(user, message_id)
    @email = user.email
    @bearer_token = user.google_token
    @message_id = message_id
  end


  def call
    uri = URI("https://gmail.googleapis.com/gmail/v1/users/#{@email}/messages/batchDelete?key=AIzaSyDen2EikLCReQegow6qnJDvIFUrtd1niXI")

    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Authorization"] = "Bearer #{@bearer_token}"
    request["Accept"] = "application/json"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    request.body = JSON.dump({
  "ids" =>
    ]
  })

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end
end
