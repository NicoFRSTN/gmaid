class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    search_big_senders
    @messages = Message.all
  end

  private

  def search_big_senders
    query = "SELECT from, COUNT(*) AS number FROM messages GROUP BY from ORDER BY number DESC LIMIT 10"

    @biggest_senders = ActiveRecord::Base.connection.execute(query).to_a
  end
end
