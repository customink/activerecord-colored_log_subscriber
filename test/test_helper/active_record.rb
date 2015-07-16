require 'logger'
require 'active_record/base'

module TestHelper
  module ActiveRecord


    private

    def setup_schema
      ::ActiveRecord::Base.class_eval do
        connection.instance_eval do
          create_table :users, :force => true do |t|
            t.string :name
            t.string :email
            t.timestamps null: false
          end
        end
      end
    end

    class User < ::ActiveRecord::Base ; end

  end
end

ActiveRecord::Base.logger = Logger.new(TestHelper::LogHelpers::LOG)
ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
