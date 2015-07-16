require 'test_helper'

class ColoredLogSubscriberTest < CLSTestCase

  before { User.create }

  it 'colors TRANSACTION lines cyan' do
    lines = log_lines_matching!(/transaction/)
    assert_lines_colored lines, :cyan
  end

  it 'colors INSERT lines green' do
    lines = log_lines_matching!(/INSERT/)
    assert_lines_colored lines, :green
  end

  it 'colors SELECT lines blue' do
    User.first
    lines = log_lines_matching!(/SELECT/)
    assert_lines_colored lines, :blue
  end

  it 'colors UPDATE lines yellow' do
    User.first.update_attributes name: 'Ken Collins'
    lines = log_lines_matching!(/UPDATE/)
    assert_lines_colored lines, :yellow
  end

  it 'colors DELETE lines red' do
    User.first.destroy
    lines = log_lines_matching!(/DELETE/)
    assert_lines_colored lines, :red
  end

  it 'colors non matching lines magenta' do
    setup_schema
    lines = log_lines_matching!(/CREATE TABLE/)
    assert_lines_colored lines, :magenta
  end


end
