require "warden"

module Accounts
  class WardenStrategy < Warden::Strategies::Base
    def valid?
      env['omniauth.auth']
    end

    def authenticate!
      user = User.find_or_create_with_omniauth(env['omniauth.auth'])
      if valid_session?(user)
        success! user
      else
        Rails.logger.info "Warden failure!!! #{env['omniauth.auth'].inspect}" if defined?(Rails)
        fail!("Could not log in")
      end
    end
  end
end

Warden::Strategies.add(:account, Accounts::WardenStrategy)

Warden::Manager.serialize_into_session do |user|
  [user.class.name, user.id]
end

Warden::Manager.serialize_from_session do |serialized|
  class_name, id = serialized
end
