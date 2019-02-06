class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tags_by_potins, dependent: :destroy
  has_many :tags, through: :tags_by_potins
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title,
  presence: true,
  uniqueness: true,
  length: { minimum: 4 , message: "Le titre n'est pas assez long"  }

  validates :content,
  presence: true,
  length: { minimum: 20 , message: "Le potin n'est pas assez long"  }
end
