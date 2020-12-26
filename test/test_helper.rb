# https://stackoverflow.com/questions/15389107/minitest-testing-and-code-coverage?answertab=votes
require 'simplecov'

# puts "ENV['RUBY_SIMPLE_COV']: #{ENV['RUBY_SIMPLE_COV']}"
if ENV['RUBY_SIMPLE_COV'] == 'on'
  SimpleCov.start
  if ENV['CODECOV_TOKEN'] != nil
    require 'codecov'
    SimpleCov.formatter = SimpleCov::Formatter::Codecov
  end
end

$LOAD_PATH << "./lib" # 把lib添加到load path

require 'minitest/autorun' # import minitest https://github.com/seattlerb/minitest
require "minitest/flog" # import https://github.com/chriskottom/minitest-flog

# load module
# require ''
