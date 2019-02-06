class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
