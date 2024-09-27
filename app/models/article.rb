class Article < ApplicationRecord
  include Visible

  # has_many :comments, dependent: :destroy
  has_one_attached :image
  belongs_to :user

  validates :title, presence: true
  validates :user, presence: true, 
  validates :body, presence: true, length: { minimum: 10 }
end
