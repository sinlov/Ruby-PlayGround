# require 'minitest/autorun'
require_relative '../helper_test'

class SimpleDateTest < TestBase::Mini
  def setup
    @simple_date = SimpleDate
  end

  def teardown
    # Do nothing
  end

  def test_date
    # skip 'Not implemented'
    now_date = @simple_date.now_date_s
    log_f self.class, self.__method__, "now_date=#{now_date}"
    refute_nil now_date, 'now_date is empty'
  end

  def test_date_time
    now_date_time = @simple_date.now_date_time_s
    log_f self.class, self.__method__, "now_date_time=#{now_date_time}"
    refute_nil now_date_time, 'now_date_time is empty'
    date_now_date_time = @simple_date.now_date_time_s(format: "%Y-%m-%d")
    log_f self.class, self.__method__, "date_now_date_time=#{date_now_date_time}"
    refute_nil date_now_date_time, 'date_now_date_time is empty'

    @simple_date.now_date_time_s(format: "%Y-%m-%d")
  end
end