class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites

  validates :titel, presence: true
  validates :diary_text, presence: true
end
