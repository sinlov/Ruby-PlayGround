# import minitest https://github.com/seattlerb/minitest
require 'minitest/autorun'

# require 'minitest/ci'
# Minitest::Ci.report_dir = '.' if ENV['CIRCLECI']
require "minitest/flog" # import https://github.com/chriskottom/minitest-flog

# https://stackoverflow.com/questions/15389107/minitest-testing-and-code-coverage?answertab=votes
require 'simplecov'

# puts "ENV['RUBY_SIMPLE_COV']: #{ENV['RUBY_SIMPLE_COV']}"
if ENV['RUBY_SIMPLE_COV'] == 'on'
  SimpleCov.start do
    # coverage (ruby "~> 2.5")
    enable_coverage :branch
    add_filter '/test/**'
  end
  if ENV['CODECOV_TOKEN'] != nil
    require 'codecov'
    SimpleCov.formatter = SimpleCov::Formatter::Codecov
  end
end

$LOAD_PATH << "./lib" # 把lib添加到load path

# load module
# require ''
#
require_relative '../lib/date-time/simple_date'
