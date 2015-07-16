module TestHelper
  module LogHelpers

    LOG = StringIO.new


    private

    def log
      LOG
    end

    def read_log
      log.rewind
      log.read
    end

    def log_lines
      read_log.each_line.map { |line| line.tr("\u0000", '').squish }
    end

    def log_lines_matching(pattern)
      log_lines.select { |line| line =~ pattern }
    end

    def clear_logs
      log.truncate 0
    end

  end
end
