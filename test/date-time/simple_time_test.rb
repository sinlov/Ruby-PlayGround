# require 'minitest/autorun'
require_relative '../helper_test'

class SimpleTimeTest < TestBase::Mini
  def setup
    super
    @simple_time = SimpleTime
    @time_format_base = "%Y-%m-%d"
    @time_format_full = "%Y-%m-%d %H:%M:%S"
  end

  def teardown
    super
    # Do nothing
  end

  def test_00_new
    @simple_time.new(2021, 1, 1, 12, 34, 61)
  rescue => err
    assert_equal 'ArgumentError', err.class.to_s, 'time error unknown'
    date_new = @simple_time.new(2021, 1, 1, 12, 34, 59)
    refute_nil date_new, 'date_new is empty'
    date_strftime = date_new.strftime(@time_format_base)
    assert_equal '2021-01-01', date_strftime, 'format error'
  end

  def test_01_unix_timestamp
    unix_timestamp = @simple_time.unix_timestamps
    # puts "test #{self.__method__.to_s}: unix_timestamp #{unix_timestamp}"
    log_f self.class, self.__method__, "unix_timestamp #{unix_timestamp}"
    refute_nil unix_timestamp, 'unix_timestamp is empty'
  end

  def test_02_time_format_s
    time_format_s = @simple_time.time_format_s
    log_f self.class, self.__method__, "time_format_s #{time_format_s}"
    refute_nil time_format_s, 'time_format_s is empty'

    simple_time_time_format_date = @simple_time.time_format_s(format: @time_format_base)
    log_f self.class, self.__method__, "simple_time_time_format_date #{simple_time_time_format_date}"
    refute_nil simple_time_time_format_date, 'simple_time_time_format_date is empty'

    simple_time_format_full = @simple_time.time_format_s(format: @time_format_full)
    log_f self.class, self.__method__, "simple_time_format_full #{simple_time_format_full}"
    refute_nil simple_time_format_full, 'simple_time_format_full is empty'
  end
end