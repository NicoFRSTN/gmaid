domain = "github.com"

# query = <<~SQL
#   SELECT
# 	(regexp_matches (messages.from, '(.+)\s<(.+)@(.+)>'))[1] as NAME,
# 	(regexp_matches (messages.from, '(.+)\s<(.+)@(.+)>'))[2] as sender,
#     COUNT(*)
#   FROM messages
#   WHERE messages.from ILIKE '%@#{domain}>%'
#   GROUP BY NAME, sender
# SQL


# query = <<~SQL
#   SELECT
#     (regexp_matches (messages.from, '(.+)\s<(.+)@(.+)>'))[3] as domain,
#     COUNT(*) as number
#   FROM messages
#   GROUP BY domain
#   ORDER BY number desc
# SQL


   select_query = <<~SQL
      messages.*,
      (regexp_matches (messages.from, '(.+)\s<(.+)@(.+)>'))[1] as name,
      (regexp_matches (messages.from, '(.+)\s<(.+)@(.+)>'))[2] as sender,
      (regexp_matches (messages.from, '(.+)\s<(.+)@(.+)>'))[3] as sender_domain
    SQL
    messages = Message.select(select_query)
    if domain.present?
      messages = messages.where("messages.from ILIKE ?", "%#{domain}%")
    end


data = messages.group_by do |m|
  m.sender_domain
end.transform_values! do |messages|
  messages.group_by do |m|
    m.sender
  end.transform_values! do |messages|
    messages.group_by do |m|
      m.name
    end
  end
end

ap data
