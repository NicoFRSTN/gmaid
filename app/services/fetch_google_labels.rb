require "uri"
require "net/http"

class FetchGoogleLabels

  def initialize(user)
    @email = user.email
    @bearer_token = user.google_token
  end

  def call
    endpoint = "https://gmail.googleapis.com/gmail/v1/users/#{@email}/labels?key=AIzaSyDen2EikLCReQegow6qnJDvIFUrtd1niXI"

    ap endpoint
    headers = {}
    headers["Authorization"] = "Bearer #{@bearer_token}"
    headers["Accept"] = "application/json"

    uri = URI.parse(endpoint)
    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true
    result = JSON.parse(http.get(uri.request_uri, headers).body)

    result["labels"].map do |label|
      format_label(label)
    end
  end

  private

  def format_label(label)
    {
      name: label["name"],
      google_id: label["id"],
      text_color: label["color"] && label["color"]["textColor"],
      background_color: label["color"] && label["color"]["backgroundColor"]
    }
  end
end
