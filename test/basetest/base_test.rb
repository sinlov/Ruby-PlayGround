require 'minitest/autorun'
# require "minitest/spec"
require 'faker'


class BaseTest < MiniTest::Test
  def setup
    super
    @t_zzz = "zzZ"
    @t_name = Faker::Name.name
  end

  def test_sleep
    # assert_equal exp, act, msg
    assert_equal "zzZ", @t_zzz, "I don't sleep well "
    puts "@t_name '#{@t_name}'"
    refute_nil @t_name ,'faker name is empty'
    # assert_not_nil is just an alias for refute_nil, but it's Rails-only, not part of standard Minitest.
    assert @t_name != nil, 'faker name is empty'
  end
end