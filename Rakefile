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
    t.pattern = "test/**/*_test.rb"
    t.options = '--flog'
  end

  Rake::TestTask.new(:RequireUnitTest) do |t|
    # puts "=> task #{t.name} start"
    t.libs << 'test' << 'lib'
    t.pattern = "test/**/*_test.rb"
    t.options = '--flog'
    t.ruby_opts << "-r test_helper" # add ruby options，require to unit file to test
  end
end

desc "clean coverage out"
task :cleanCoverage do
  def clean_folder_when_exists(folder: "coverage")
    if File.directory?(folder)
      puts "-> start clean folder: #{folder}"
      rm_rf folder
    end
  end
  clean_folder_when_exists
  clean_folder_when_exists(folder: "foo")

  puts "=> clean coverage finish"
end

desc "clean all, more info see: rake -P"
task :cleanAll => ["cleanCoverage"]