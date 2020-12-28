# from minitest https://github.com/seattlerb/minitest
require 'minitest/autorun'
# from minitest https://github.com/chriskottom/minitest-flog
require 'minitest/flog'

# https://stackoverflow.com/questions/15389107/minitest-testing-and-code-coverage?answertab=votes
# puts "ENV['RUBY_SIMPLE_COV']: #{ENV['RUBY_SIMPLE_COV']}"
if ENV['RUBY_SIMPLE_COV'] == 'on'
  require 'simplecov'
  # https://github.com/simplecov-ruby/simplecov
  puts '=> start SimpleCov'
  SimpleCov.start do
    # coverage (ruby "~> 2.5")
    enable_coverage :branch
    add_filter %r{^/test/}
    SimpleCov.command_name 'test:units'
    add_group "full-cover" do |src_file|
      src_file.lines.count > 100
    end
    add_group "more-cover" do |src_file|
      src_file.lines.count > 60
    end
    add_group "less-cover" do |src_file|
      src_file.lines.count < 61
    end
    # e RubyMine IDE has built-in support for SimpleCov's coverage reports but has bug to add add_filter
    # SimpleCov.root('foo/bar/baz')
  end
  # if env CODECOV_TOKEN not nil will send to https://codecov.io/
  if ENV['CODECOV_TOKEN'] != nil
    puts '=> send codecov by ENV CODECOV_TOKEN'
    require 'codecov'
    SimpleCov.formatter = SimpleCov::Formatter::Codecov
  end
  puts '=> end SimpleCov'
end

# require 'minitest/ci'
# Minitest::Ci.report_dir = '.' if ENV['CIRCLECI']

# $LOAD_PATH << "./lib" # load path of local lib
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__) # load path of local lib

# load module can define after this line

require_relative '../lib/date-time/simple_date'
