require "uri"
require "net/http"

class BatchDeleteGoogleMessages
  def initialize(user, google_message_ids)
    @email = user.email
    @bearer_token = user.google_token
    @google_message_ids = google_message_ids
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

    ap @google_message_ids

    request.body = JSON.dump({
  "ids" => @google_message_ids
  })

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    ap response.body
  end
end
