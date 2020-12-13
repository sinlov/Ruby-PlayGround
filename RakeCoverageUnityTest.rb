require 'rake/testtask'

Rake::TestTask.new(:AllCoverageUnitTest) do |t|
  puts "=> task #{t.name} start"
  ENV['RUBY_SIMPLE_COV'] = 'on'
  t.libs << 'test' << 'lib'
  t.warning = true
  t.pattern = "test/**/test_*.rb"
end

task :default => :AllCoverageUnitTest # change to default

desc "clean out folder: outputs"
task :cleanOut do
  rm_rf "coverage"
end