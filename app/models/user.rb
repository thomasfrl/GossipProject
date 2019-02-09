class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :gossips, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage", dependent: :destroy
  has_many :likes
  has_many :conversations, foreign_key: 'participant1', dependent: :destroy
  has_many :conversations, foreign_key: 'participant2', dependent: :destroy

  def name
    "#{self.first_name} #{last_name}"
  end

  def conversations
    conversations = []
    Conversation.all.each do |conversation|
      if conversation.participants.include?(self)
        conversations << conversation
      end
    end
    return conversations
  end

  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :first_name, presence: true
  validates :last_name, presence: true

end
