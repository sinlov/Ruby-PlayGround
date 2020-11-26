require 'rake/testtask'


Rake::TestTask.new(:AllUnitTest) do |t|
  t.libs << 'test' << 'lib'
  t.pattern = "test/**/test_*.rb"
end

desc 'run all specs'
task testAll: :AllUnitTest

Rake::TestTask.new(:RequireUnitTest) do |t|
  t.libs << 'test' << 'lib'
  t.pattern = "test/**/test_*.rb"
  t.ruby_opts << "-r test_helper" # 添加 ruby 运行参数，require 指定的文件
end

# task :default => :test # change to default