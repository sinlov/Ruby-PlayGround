source 'https://rubygems.org'
# source 'https://gems.ruby-china.com'

group :gem_build_deps do
  gem 'rake', '13.0.6'
end

group :development do

  # https://github.com/faker-ruby/faker
  gem 'faker', '3.2.0', require: false

  # for task https://github.com/jmettraux/rufus-scheduler
  gem 'rufus-scheduler', '3.9.0', require: false
end

group :test do
  # https://github.com/seattlerb/minitest
  gem 'minitest', '5.18.0'
  group :minitest_plugins do
    # https://github.com/chriskottom/minitest-flog
    gem 'minitest-flog', '0.1.0', require: false
  end
  # https://github.com/simplecov-ruby/simplecov
  gem 'simplecov', '0.19.1', require: false
  # https://github.com/codecov/codecov-ruby
  gem 'codecov', '0.4.3', require: false
  # https://github.com/ManageIQ/optimist
  gem 'optimist', '3.0.1', require: false

end
