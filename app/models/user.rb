class User < ApplicationRecord
  belongs_to :city
  has_many :gossips, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage", dependent: :destroy
  
  has_many :multi_pms, dependent: :destroy
  has_many :private_messages, through: :multi_pms
  def name
    "#{self.first_name} #{last_name}"
  end

  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :first_name, presence: true
  validates :last_name, presence: true

end
