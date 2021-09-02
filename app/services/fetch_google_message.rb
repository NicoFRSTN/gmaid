require "uri"
require "net/http"

class FetchGoogleMessage
  def initialize(email, google_token, message_google_id)
    @email = email
    @bearer_token = google_token
    @message_google_id = message_google_id
  end

  def call
    url = URI("https://gmail.googleapis.com/gmail/v1/users/#{@email}/messages/#{@message_google_id}?format=metadata&key=AIzaSyDen2EikLCReQegow6qnJDvIFUrtd1niXI")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer #{@bearer_token}"
    request["Accept"] = "application/json"

    response = https.request(request)
    JSON.parse(response.read_body)
  end
end
