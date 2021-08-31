require "uri"
require "net/http"

class ChangeGoogleLabel

  def initialize(user)
    @email = user.email
    @bearer_token = user.google_token
  end


  def call
    url = URI("https://gmail.googleapis.com/gmail/v1/users/#{user.email}/messages/#{message_id}/modify?key=AIzaSyDen2EikLCReQegow6qnJDvIFUrtd1niXI")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Delete.new(url)
    request["Authorization"] = "Bearer #{@bearer_token}"
    request["Accept"] = "application/json"
    request.body = JSON.dump({
      "addLabelIds" =>[added_labels_id
      ],
      "removeLabelIds" =>[removed_labels_id
      ]
    })

  end
end
