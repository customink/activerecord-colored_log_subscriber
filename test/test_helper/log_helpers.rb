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

    def log_lines_matching!(pattern)
      lines = log_lines_matching(pattern)
      flunk "Found no log lines matching #{pattern.inspect} in #{log_lines.inspect}." if lines.empty?
      lines
    end

    def assert_lines_colored(lines, color_name)
      lines.each { |line| line.must_include color(color_name) }
    end

    def clear_logs
      log.truncate 0
    end

  end
end
