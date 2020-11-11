class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :diary

  validates :comment_text, presence: true
end
