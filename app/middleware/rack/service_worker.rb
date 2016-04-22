module Rack
  class ServiceWorker
    def initialize(app, *args)
      @app, @args = app, args
    end

    def call(env)
      "#{self.class}::Handler".constantize.new(@app, *@args).call(env)
    end

    class Handler
      def initialize(app)
        @app = app
      end

      def match?(path)
        path == '/serviceworker.js'
      end

      def call(env)
        case env['REQUEST_METHOD']
        when 'GET', 'HEAD'
          path = env['PATH_INFO'].chomp('/')
          return respond_with(path, env) if match?(path)
        end

        @app.call(env)
      end

      def respond_with(path, env)
        Rails.logger.info "Rack::ServiceWorker #{path}"

        if config.compile
          sprockets_environment.call(env.merge('PATH_INFO' => path))
        else
          raise "Add support for precompiled serviceworker"
        end
      end

      def sprockets_environment
        Rails.application.assets
      end

      def config
        Rails.application.config.assets
      end
    end
  end
end
