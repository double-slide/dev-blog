class Article < ApplicationRecord
  include Visible

  # has_many :comments, dependent: :destroy
  has_one_attached :image
  belongs_to :user

  def current_user_is_author?(current_user)
    current_user == self.user
  end

  validates :title, presence: true, length: { maximum: 40 }
  validates :user, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validate :user_post_level_must_be_sufficient

  private

  def user_post_level_must_be_sufficient
    if user.post_level < 3
      errors.add(:base, "Current user is not allowed to post")
    end
  end
end
