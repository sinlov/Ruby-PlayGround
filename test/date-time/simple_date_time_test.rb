# require 'minitest/autorun'
require_relative '../helper_test'

class SimpleDateTimeTest < TestBase::Mini
  def setup
    @simple_date_time = SimpleDateTime
    @time_format_base = "%Y-%m-%d"
    @date_time_str = "2021-01-01 12:34:59"
    @date_str = "2021-01-01"
    @date_time_zone_str = "2021-01-01 12:34:59 +8"
  end

  def teardown
    # Do nothing
  end

  def test_01_name
    now_date_s = @simple_date_time.now_date_s
    log_f self.class, self.__method__, "now_date_s=#{now_date_s}"
    refute_nil now_date_s, 'now_date_s is empty'
  end

  def test_02_now_date_time_s
    now_date_time_s = @simple_date_time.now_date_time_s
    log_f self.class, self.__method__, "now_date_time_s=#{now_date_time_s}"
    refute_nil now_date_time_s, 'now_date_time_s is empty'
    time_now_date_time_s = @simple_date_time.now_date_time_s(format: "%Y-%m-%d")
    log_f self.class, self.__method__, "time_now_date_time_s=#{time_now_date_time_s}"
    refute_nil time_now_date_time_s, 'time_now_date_time_s is empty'
  end

  def test_03_strptime
    @simple_date_time.strptime("")
  rescue => err
    assert_equal 'date_str is empty', err.message, 'parse message not empty'
    date_time_strptime = @simple_date_time.strptime(@date_time_str, format: @time_format_base)
    refute_nil date_time_strptime, "@simple_date_time.strptime #{@date_time_str} out nil"
    date_time_str = date_time_strptime.to_s
    log_f self.class, self.__method__, "time_str #{@time_str} , date_time_str #{date_time_str}"
    assert_equal '2021-01-01T00:00:00+00:00', date_time_str, "date_time_str by @time_str #{@time_str}"
  end

  def test_04_parse
    @simple_date_time.parse("")
  rescue => err
    assert_equal 'date_str is empty', err.message, 'parse message not empty'
    date_time_parse = @simple_date_time.parse(@date_time_zone_str)
    refute_nil date_time_parse, "@simple_date_time.parse #{@date_time_zone_str} out nil"
    date_time_s = date_time_parse.to_s
    log_f self.class, self.__method__, "date_time_s #{date_time_s}"
    assert_equal '2021-01-01T12:34:59+08:00', date_time_s, "date_time_str by @time_str #{@date_time_zone_str}"
  end

end