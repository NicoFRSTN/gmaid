class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
    search_big_senders
    @messages = Message.all
    @biggest_senders
  end

  private

  def search_big_senders
    query = <<~SQL
      SELECT
        (regexp_matches (messages.from, '(.+)\s<(.+)@(.+)>'))[3] as domain,
        COUNT(*) as number
      FROM messages
      GROUP BY domain
      ORDER BY number desc
    SQL
    @biggest_senders =  ActiveRecord::Base.connection.execute(query).to_a
  end
end
