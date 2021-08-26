class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    search_big_senders
    @messages = Message.all
  end

  private

  def search_big_senders
    query = "SELECT sender_email, COUNT(*) AS number FROM messages GROUP BY sender_email ORDER BY number DESC LIMIT 10"

    @biggest_senders = ActiveRecord::Base.connection.execute(query).to_a
  end
end
