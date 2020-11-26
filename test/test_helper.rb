# https://stackoverflow.com/questions/15389107/minitest-testing-and-code-coverage?answertab=votes
require 'simplecov'
# https://github.com/simplecov-ruby/simplecov#getting-started
require 'optimist'
opts = Optimist::options do
  opt :coverage, "is start coverage" # flag --coverage, default false
  # opt :name, "Monkey name", :type => :string        # string --name <s>, default nil
  # opt :num_limbs, "Number of limbs", :default => 4  # integer --num-limbs <i>, default to 4
end

puts "now opts.coverage #{opts}"
if opts[:coverage]
  puts "start cov"
  SimpleCov.start
else
  puts "not start cov"
end


$LOAD_PATH << "./lib" # 把lib添加到load path

require 'minitest/autorun' # import minitest https://github.com/seattlerb/minitest
require "minitest/flog" # import https://github.com/chriskottom/minitest-flog

# load module
# require ''
