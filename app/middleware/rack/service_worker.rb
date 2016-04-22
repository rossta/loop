module Rack
  class ServiceWorker
    def initialize(app, *args)
      @app, @args = app, args
    end

    def call(env)
      case env['REQUEST_METHOD']
      when 'GET', 'HEAD'
        path = env['PATH_INFO'].chomp('/')
        return respond_to(path, env) if match?(path)
      end

      @app.call(env)
    end

    def match?(path)
      path == '/serviceworker.js'
    end

    private

    def respond_to(path_info, env)
      if config.compile
        log "Compiling #{path_info} from Sprockets"
        sprockets_server.call(env)
      else
        file_path = asset_path(path_info)
        log "Proxing #{path_info} from #{file_path}"
        file_server.call(env.merge('PATH_INFO' => file_path))
      end
    end

    def log(msg)
      logger.info "[Rack::ServiceWorker] - #{msg}"
    end

    def logger
      Rails.logger
    end

    def sprockets_server
      Rails.application.assets
    end

    def file_server
      @file_server ||= Rack::File.new(Rails.root.join("public"))
    end

    def config
      Rails.application.config.assets
    end

    def asset_path(path)
      ActionController::Base.helpers.asset_path(path.gsub(/^\//, ''))
    end
  end
end
