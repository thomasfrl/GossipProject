class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :tags_by_potins
  has_many :tags, through: :tags_by_potins
  has_many :comments, as: :commentable
  has_many :likes
end
