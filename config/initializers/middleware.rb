Rails.application.config.middleware.insert_after Rack::Sendfile, "Rack::ServiceWorker"

