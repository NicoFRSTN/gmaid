require 'faker'

Message.destroy_all
User.destroy_all

user = User.create!(email: "toto@gmail.com",
                    password: "azerty"
                   )

  # t.string "from"
  #   t.string "subject"
  #   t.datetime "date_at"
  #   t.string "snippet"

30.times do
  Message.create!(
    google_id: 3,
    from: Faker::Internet.email,
    subject: 'pub',
    snippet: Faker::Lorem.paragraph,
    user: user
  )
end

10.times do
  Message.create!(
    google_id: 3,
    from: "contact@fnac.com",
    subject: 'newsletter fnac',
    snippet: Faker::Lorem.paragraph,
    user: user
  )
end

8.times do
  Message.create!(
    google_id: 3,
    from: "contact@darty.com",
    snippet: Faker::Lorem.paragraph,
    user: user
  )
end

8.times do
  Message.create!(
    google_id: 3,
    from: "contact@figaro.com",
    snippet: Faker::Lorem.paragraph,
    user: user
  )
end

5.times do
  Message.create!(
    google_id: 3,
    from: "contact@carrefour.com",
    snippet: Faker::Lorem.paragraph,
    user: user
  )
end
puts "#{Message.count} messages are available !"
