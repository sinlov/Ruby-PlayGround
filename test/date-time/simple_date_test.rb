# require 'minitest/autorun'
require_relative '../helper_test'

class SimpleDateTest < MiniTest::Test
  def setup
    @simple_date = SimpleDate
  end

  def teardown
    # Do nothing
  end

  def test_date
    # skip 'Not implemented'
    now_date = @simple_date.now_date
    puts "now_date=#{now_date}"
    refute_nil now_date, 'now_date is empty'
  end

  def test_date_time
    now_date_time = @simple_date.now_date_time
    puts "now_date_time=#{now_date_time}"
    refute_nil now_date_time, 'now_date_time is empty'
    date_now_date_time = @simple_date.now_date_time(format: "%Y-%m-%d")
    puts "date_now_date_time=#{date_now_date_time}"
    refute_nil date_now_date_time, 'date_now_date_time is empty'
  end
end