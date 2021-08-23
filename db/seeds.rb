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

puts "#{Message.count} messages are available !"
