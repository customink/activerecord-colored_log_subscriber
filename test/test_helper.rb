require 'bundler' ; Bundler.require :development, :test
require 'activerecord-colored_log_subscriber'
require 'test_helper/log_helpers'
require 'test_helper/active_record'
require 'minitest/autorun'

class CLSTestCase < Minitest::Spec

  include TestHelper::ActiveRecord
  include TestHelper::LogHelpers

  before do
    setup_schema
    User.connection
    clear_logs
  end


  private

  def color(name)
    eval "ActiveSupport::LogSubscriber::#{name.to_s.upcase}"
  end

end

