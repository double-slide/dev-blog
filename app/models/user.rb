class User < ApplicationRecord
    has_secure_password

    def confirm!
      update_columns(confirmed_at: Time.current)
    end

    def confirmed?
      confirmed_at.present?
    end

    def unconfirmed?
      !confirmed?
    end

    def generate_confirmation_token
      signed_id expires_in: 15.minutes
    end

    validates :email, presence: true
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
