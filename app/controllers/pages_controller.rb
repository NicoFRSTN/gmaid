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
      COUNT(messages.id ) as total,
      COUNT(case when message_labels.id IS NULL then messages.id end) as total_read,
      COUNT(case when message_labels.id IS NOT NULL then messages.id end) as total_no_read,
      COUNT(case when message_labels.id IS NOT NULL then messages.id end)::float / COUNT(messages.id ) as ratio

      FROM messages
      LEFT JOIN message_labels ON message_labels.message_id = messages.id AND message_labels.label_id IN (SELECT id FROM labels WHERE labels.name = 'UNREAD')
      GROUP BY domain
      ORDER BY total_no_read desc, total desc, ratio desc
    SQL
    @biggest_senders =  ActiveRecord::Base.connection.execute(query).to_a
  end
end
