require 'faker'

Message.destroy_all
User.destroy_all

user = User.create!(email: "toto@gmail.com",
                    password: "azerty"
)

100.times do
  Message.create!(
    sender_email: Faker::Internet.email,
    content: Faker::Lorem.paragraph,
    user: user
  )
end

10.times do
  Message.create!(
    sender_email: "contact@fnac.com",
    content: Faker::Lorem.paragraph,
    user: user
  )
end

8.times do
  Message.create!(
    sender_email: "contact@darty.com",
    content: Faker::Lorem.paragraph,
    user: user
  )
end

8.times do
  Message.create!(
    sender_email: "contact@figaro.com",
    content: Faker::Lorem.paragraph,
    user: user
  )
end

5.times do
  Message.create!(
    sender_email: "contact@carrefour.com",
    content: Faker::Lorem.paragraph,
    user: user
  )
end


puts "#{Message.count} messages are available !"
