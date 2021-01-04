# require 'minitest/autorun'
require_relative '../helper_test'

class SimpleDateTest < TestBase::Mini
  def setup
    super
    @simple_date = SimpleDate
    @time_format_base = "%Y-%m-%d"
    @time_str = "2021-01-01 12:34:59"
  end

  def teardown
    super
    # Do nothing
  end

  def test_00_new
    @simple_date.new(2021, 1, 1, 12, 34, 61)
  rescue => err
    assert_equal 'ArgumentError', err.class.to_s, 'time error unknown'
    date_new = @simple_date.new(2021, 1, 1)
    refute_nil date_new, 'date_new is empty'
    date_strftime = date_new.strftime(@time_format_base)
    assert_equal '2021-01-01', date_strftime, 'format error'
  end

  def test_01_date
    # skip 'Not implemented'
    now_date = @simple_date.now_date_s
    log_f self.class, self.__method__, "now_date=#{now_date}"
    refute_nil now_date, 'now_date is empty'
  end

  def test_02_date_time
    now_date_time = @simple_date.now_date_time_s
    log_f self.class, self.__method__, "now_date_time=#{now_date_time}"
    refute_nil now_date_time, 'now_date_time is empty'
    date_now_date_time = @simple_date.now_date_time_s(format: @time_format_base)
    log_f self.class, self.__method__, "date_now_date_time=#{date_now_date_time}"
    refute_nil date_now_date_time, 'date_now_date_time is empty'
    @simple_date.now_date_time_s(format: @time_format_base)
  end

  def test_03_parse
    @simple_date.parse("")
  rescue => err
    assert_equal 'date_str is empty', err.message, 'parse message not empty'
    simple_date_parse = @simple_date.parse(@time_str)
    refute_nil simple_date_parse, "simple_date.parse #{@time_str} out nil"
    date_str = simple_date_parse.to_s
    log_f self.class, self.__method__, "time_str #{@time_str} , date_str #{date_str}"
    refute_nil date_str, "simple_date.parse out is nil"
  end
end