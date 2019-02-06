class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :multi_pms, dependent: :destroy
  has_many :users, through: :multi_pms
end
