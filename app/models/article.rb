class Article < ApplicationRecord
  include Visible

  # has_many :comments, dependent: :destroy
  has_one_attached :image
  belongs_to :user

  def current_user_is_author?(current_user)
    current_user == self.user
  end

  validates :title, presence: true
  validates :user, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
