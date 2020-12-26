#  from the CommandLine within your RubyOnRails application folder
#  $ rake -T
#
require 'rake/testtask'

# open trace rules faster than cli --trace
# Rake.application.options.trace_rules = true

desc "default task please see: rake -P"
task :default => ["test:testAll"] # change to default

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

desc "clean coverage out"
task :cleanCoverage do
  if File.directory?("coverage")
    rm_rf "coverage"
  end
end

desc "clean all, more info see: rake -P"
task :cleanAll => ["cleanCoverage"]