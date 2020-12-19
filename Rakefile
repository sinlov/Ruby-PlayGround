#  from the CommandLine within your RubyOnRails application folder
#  $ rake -T
#
require 'rake/testtask'

# open trace rules faster than cli --trace
# Rake.application.options.trace_rules = true

namespace :test do
  Rake::TestTask.new(:testAll) do |t|
    # puts "=> task #{t.name} start"
    # ENV['RUBY_SIMPLE_COV'] = 'off'
    t.libs << 'test' << 'lib'
    t.warning = true
    t.pattern = "test/**/test_*.rb"
  end

  Rake::TestTask.new(:RequireUnitTest) do |t|
    # puts "=> task #{t.name} start"
    t.libs << 'test' << 'lib'
    t.pattern = "test/**/test_*.rb"
    t.ruby_opts << "-r test_helper" # 添加 ruby 运行参数，require 指定的文件
  end
end

# task :default => :test # change to default