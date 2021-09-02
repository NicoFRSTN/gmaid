class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :messages
  has_many :labels

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)

    data = access_token.info
    ap data
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    user ||= User.create(email: data['email'], password: Devise.friendly_token[0, 20], avatar: data['image'])
    user.update(google_token: (access_token.credentials['token']))
    user
  end

  def toto
    puts "tata"
  end
end
