class Message < ApplicationRecord
  belongs_to :user
  has_many :labels
end
