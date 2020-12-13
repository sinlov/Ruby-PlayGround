# https://github.com/simplecov-ruby/simplecov#getting-started
require 'optimist'
opts = Optimist::options do
  opt :sleep, "is start sleep" # flag --sleep, default false
  # opt :name, "Monkey name", :type => :string        # string --name <s>, default nil
  # opt :num_limbs, "Number of limbs", :default => 4  # integer --num-limbs <i>, default to 4
end

if opts[:sleep]
  puts 'monkey want sleep'
else
  puts 'monkey not want sleep'
end