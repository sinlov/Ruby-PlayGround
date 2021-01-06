# require 'minitest/autorun'
require_relative '../helper_test'
# require "minitest/spec"
require 'faker'


class BaseSampleTest < MiniTest::Test
  def setup
    super
    @t_zzz = "zzZ"
    @t_name = Faker::Name.name
    @t_arr = ['', 'a', 'abc']
  end

  def test_sleep
    # assert_equal exp, act, msg
    assert_equal "zzZ", @t_zzz, "I don't sleep well "
    puts "@t_name '#{@t_name}'"
    refute_nil @t_name ,'faker name is empty'
    # assert_not_nil is just an alias for refute_nil, but it's Rails-only, not part of standard Minitest.
    assert @t_name != nil, 'faker name is empty'
    assert_equal true , @t_arr.any?('') , "arr #{@t_arr} not hash check at ''"
    assert_equal true , @t_arr.any?('a') , "arr #{@t_arr} not hash check at 'a'"
    assert_equal false , @t_arr.any?('ac') , "arr #{@t_arr} not hash check at 'ac'"
  end
end