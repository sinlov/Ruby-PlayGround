module TestBase
  class Mini < MiniTest::Test
    def setup
      super
    end

    def teardown
      super
    end

    def log_f(o_class, o_method, msg = "")
      pp "test [ #{o_class.to_s}:#{o_method.to_s} ] ->  #{msg}"
    end
  end
end