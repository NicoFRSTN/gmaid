class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  def self.from_omniauth(auth)
    p auth.info
    where(email: auth.info.email).first_or_initialize do |user|
      user.email = auth.info.email
      user.encrypted_password = SecureRandom.hex
    end
  end
end
