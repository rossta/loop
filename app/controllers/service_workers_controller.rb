class ServiceWorkersController < ActionController::Metal
  include AbstractController::Rendering

  def index
    self.headers['Cache-Control'] = 'private, max-age-0, no-cache'
    self.content_type = 'application/javascript'
    self.response_body = Rails.application.assets['serviceworker.js']
  end
end
