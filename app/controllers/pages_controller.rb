class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    search_big_senders
    @messages = Message.all
    @biggest_senders
  end

  private

  def search_big_senders
    query = "SELECT messages.from, COUNT(*) AS number FROM messages GROUP BY messages.from ORDER BY number DESC LIMIT 10"

    @biggest_senders = ActiveRecord::Base.connection.execute(query).to_a
  end
end
