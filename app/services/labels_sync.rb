# frozen_string_literal: true

class LabelsSync
  def initialize(message)
    @message = message
    @message_google_id = message.google_id
  end

  def call
    destroy_labels
    fetch_labels
    create_label
  end

  private

  def destroy_labels
    @message.message_labels.delete_all
  end

  def fetch_labels
    email = @message.user.email
    google_token = @message.user.google_token
    message_google_id = @message.google_id

    google_message = FetchGoogleMessage.new(email, google_token, message_google_id).call
    @google_labels = google_message["labelIds"]
  end

  def create_label
    @message.labels << Label.where(google_id: @google_labels)
  end
end
