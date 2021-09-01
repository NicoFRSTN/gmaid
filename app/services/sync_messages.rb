# frozen_string_literal: true

class SyncMessages
  def initialize(user)
    @user = user
  end

  def call
    update_labels
    fetch_messages
    save_in_db
  end

  private

  def update_labels
    google_labels = FetchGoogleLabels.new(@user).call
    google_labels.each do |google_label|
      label = @user.labels.find_by(google_id: google_label[:google_id])
      if label
        label.update(google_label)
      else
        @user.labels.create!(google_label)
      end
    end
  end

  def fetch_messages
    @messages = FetchGoogleMessages.new(@user).call
  end

  def save_in_db
    message_data = @messages.map do |message|
      {
        from: header_from_message(message, "From"),
        subject: header_from_message(message, "Subject"),
        date_at: header_from_message(message, "Date"),
        snippet: message["snippet"],
        google_id: message["id"],
        user: @user,
        labels: Label.where(google_id: message["labelIds"])
      }
    end

    google_ids = Message.pluck(:google_id)

    ap "google_ids:"
    ap google_ids

    message_data.reject! {|message_data| message_data[:google_id].in? google_ids }

    ap "message_data:"
    ap message_data

    Message.create!(message_data)
  end

  def header_from_message(message, header)
    message["payload"]["headers"].find { |h| h["name"] == header }["value"]
  end
end
