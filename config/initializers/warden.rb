Rails.application.middleware.use Warden::Manager do |warden|
  warden.default_strategies :account
  warden.default_scope = :account
  warden.failure_app = Accounts::SessionsController.action(:failure)
end
