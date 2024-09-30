module Authenticated
    extend ActiveSupport::Concern

    included do
        before_action :current_user
        helper_method :current_user
        helper_method :user_signed_in?
        helper_method :user_able_to_post?
    end

    def current_user
        if session[:current_user_id]
            current_user ||= User.find_by(id: session[:current_user_id])
        end
    end

    def user_signed_in?
        current_user.present?
    end

    def user_able_to_post?
        current_user.post_level >= 3
    end
end