class Message < ApplicationRecord
  belongs_to :user
  has_many :message_labels, dependent: :destroy
  has_many :labels, through: :message_labels


  def sync
    SyncMessages.new(current_user).call
  end

end
