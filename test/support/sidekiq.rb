require "sidekiq/testing"

module SidekiqMinitestSupport
  def after_teardown
    Sidekiq::Worker.clear_all
  end
end

class MiniTest::Spec
  include SidekiqMinitestSupport
end
