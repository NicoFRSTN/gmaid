require "uri"
require "net/http"

class FetchGoogleMessages
  BATCH_SIZE = ENV['BATCH_SIZE_GOOGLE_MESSAGE'].to_i

  def initialize(user)
    @email = user.email
    @bearer_token = user.google_token
  end


  def call
    endpoint = "https://gmail.googleapis.com/gmail/v1/users/#{@email}/messages?maxResults=1000&key=AIzaSyDen2EikLCReQegow6qnJDvIFUrtd1niXI"
    headers = {}
    headers["Authorization"] = "Bearer #{@bearer_token}"
    headers["Accept"] = "application/json"

    uri = URI.parse(endpoint)
    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true
    result = JSON.parse(http.get(uri.request_uri, headers).body)
    # result['messages'].each do |message|
    # details = get_details_for(message['id'])
    # user.messages.create(object: details[:Subject], sender_email: details[:From], date: details[:Date], content: details[:snippet])
    # end

    result["messages"].map {|m| m["id"]}.first(BATCH_SIZE).each_with_index.map do |message_id, index|
      puts "#{index + 1} ..."
      get_details_for(message_id)
    end
  end

  private

  def get_details_for(message_id)
    url = URI("https://gmail.googleapis.com/gmail/v1/users/#{@email}/messages/#{message_id}?format=metadata&key=AIzaSyDen2EikLCReQegow6qnJDvIFUrtd1niXI")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer #{@bearer_token}"
    request["Accept"] = "application/json"

    response = https.request(request)
    JSON.parse(response.read_body)
  end
end

