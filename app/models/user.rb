class User < ApplicationRecord
    has_secure_password
    has_many :articles

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

    def send_confirmation_email!
      confirmation_token = generate_confirmation_token
      UserMailer.confirmation(self, confirmation_token).deliver_now
    end

    validates :email, presence: true
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
