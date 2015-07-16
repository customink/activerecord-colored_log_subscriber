module ActiveRecord
  module ColoredLogSubscriber
    module LogSubscriber

      module Base

        def odd?
          false
        end

        def sql_color(sql)
          case sql
            when /\s*\Ainsert/i      then ActiveSupport::LogSubscriber::GREEN
            when /\s*\Aselect/i      then ActiveSupport::LogSubscriber::BLUE
            when /\s*\Aupdate/i      then ActiveSupport::LogSubscriber::YELLOW
            when /\s*\Adelete/i      then ActiveSupport::LogSubscriber::RED
            when /transaction\s*\Z/i then ActiveSupport::LogSubscriber::CYAN
            else ActiveSupport::LogSubscriber::MAGENTA
          end
        end

      end

      module ThreeTwo

        def sql(event)
          self.class.runtime += event.duration
          return unless logger.debug?
          payload = event.payload
          return if 'SCHEMA' == payload[:name]
          name  = '%s (%.1fms)' % [payload[:name], event.duration]
          sql   = payload[:sql].squeeze(' ')
          binds = nil
          unless (payload[:binds] || []).empty?
            binds = "  " + payload[:binds].map { |col,v|
              if col
                [col.name, v]
              else
                [nil, v]
              end
            }.inspect
          end
          name = color(name, nil, true)
          sql  = color(sql, sql_color(sql), true)
          debug "  #{name}  #{sql}#{binds}"
        end

      end

      module FourZero

        def sql(event)
          self.class.runtime += event.duration
          return unless logger.debug?
          payload = event.payload
          return if ActiveRecord::LogSubscriber::IGNORE_PAYLOAD_NAMES.include?(payload[:name])
          name  = "#{payload[:name]} (#{event.duration.round(1)}ms)"
          sql   = payload[:sql].squeeze(' ')
          binds = nil
          unless (payload[:binds] || []).empty?
            binds = "  " + payload[:binds].map { |col,v|
              render_bind(col, v)
            }.inspect
          end
          name = color(name, nil, true)
          sql  = color(sql, sql_color(sql), true)
          debug "  #{name}  #{sql}#{binds}"
        end

      end

      module FourOneAndTwo

        def sql(event)
          self.class.runtime += event.duration
          return unless logger.debug?
          payload = event.payload
          return if ActiveRecord::LogSubscriber::IGNORE_PAYLOAD_NAMES.include?(payload[:name])
          name  = "#{payload[:name]} (#{event.duration.round(1)}ms)"
          sql   = payload[:sql]
          binds = nil
          unless (payload[:binds] || []).empty?
            binds = "  " + payload[:binds].map { |col,v|
              render_bind(col, v)
            }.inspect
          end
          name = color(name, nil, true)
          sql  = color(sql, sql_color(sql), true)
          debug "  #{name}  #{sql}#{binds}"
        end

      end

      ActiveSupport::Notifications.notifier.listeners_for('sql.active_record').each { |listener|
        next unless listener.inspect =~ /ActiveRecord::LogSubscriber/
        delegate =  listener.instance_variable_get :@delegate
        delegate.extend Base
        case ActiveRecord::VERSION::STRING
        when /\A3.2/    then delegate.extend ThreeTwo
        when /\A4.0/    then delegate.extend FourZero
        when /\A4.[12]/ then delegate.extend FourOneAndTwo
        end
      }

    end
  end
end
