# require 'minitest/autorun'
require_relative '../helper_test'

class SimpleTimeTest < TestBase::Mini
  def setup
    super
    @simple_time = SimpleTime
  end

  def teardown
    super
    # Do nothing
  end

  def test_01_unix_timestamp
    unix_timestamp = @simple_time.unix_timestamp
    # puts "test #{self.__method__.to_s}: unix_timestamp #{unix_timestamp}"
    log_f self.class, self.__method__, "unix_timestamp #{unix_timestamp}"
    refute_nil unix_timestamp, 'unix_timestamp is empty'
  end

  def test_02_time_format_s
    time_format_s = @simple_time.time_format_s
    log_f self.class, self.__method__, "time_format_s #{time_format_s}"
    refute_nil time_format_s, 'time_format_s is empty'
    simple_time_time_format_date = @simple_time.time_format_s(format: "%Y-%m-%d")
    log_f self.class, self.__method__, "simple_time_time_format_date #{simple_time_time_format_date}"
    refute_nil simple_time_time_format_date, 'simple_time_time_format_date is empty'
  end
end