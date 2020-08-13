class Comment < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many_attached :comment_images, dependent: :destroy 
end
