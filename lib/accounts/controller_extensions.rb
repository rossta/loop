module Accounts
  module ControllerExtensions
    extend ActiveSupport::Concern

    included do
      helper_method :current_user
      helper_method :user_signed_in?
    end

    def warden
      request.env['warden']
    end

    def current_user
      @current_user ||= warden_user || anonymous_user
    end

    def warden_user
      warden.authenticate(scope: :account)
    end

    def current_user?
      @user && @user == current_user
    end

    def user_signed_in?
      current_user.registered?
    end

    def auth_provider_path
      "/auth/twitter"
    end

    def authenticate_user!
      return true if user_signed_in?

      redirect_to after_sign_out_url, alert: 'You need to sign in for access to this page.'
    end

    def authenticate_user?
      true
    end

    def sign_out
      return unless user_signed_in?

      warden.logout(:account)
      @current_user = anonymous_user
    end

    def after_sign_in_url
      return_to_url || root_url
    end

    # ensure path only endpoint retrieved from session to protect offsite redirect
    def return_to_url
      URI.parse(session.delete(:return_to)).path rescue nil
    end

    def after_sign_out_url
      root_url
    end

    def anonymous_user
      @anonymous_user ||= AnonymousUser.new
    end
  end
end
