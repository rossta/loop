module Accounts
  class SessionsController < ApplicationController
    protect_from_forgery except: :create

    def new
      redirect_to "/auth/twitter"
    end

    def create
      warden.authenticate!(scope: :loop)
      redirect_to after_sign_in_url, only_path: true
    end

    def destroy
      reset_session
      redirect_to after_sign_out_url, notice: 'Signed out!'
    end

    def failure
    end

    private

    def log_omniauth
      Rails.logger.info "Omniauth Request: request.env['omniauth.auth']"
      Rails.logger.info request.env['omniauth.auth'].inspect
    end

    def log_failure
      Rails.logger.info ["Authentication error", params[:message].to_s.humanize].join(". ")
      Rails.logger.info "Current user: #{current_user.inspect}"
    end

    # def redirect_to_provider_root_url
    #   return true unless Satellite.configuration.provider_root_url
    #
    #   redirect_to Satellite.configuration.provider_root_url
    # end

    # def require_no_authentication
    #   @skip_satellite_authentication = true
    # end
  end
end
