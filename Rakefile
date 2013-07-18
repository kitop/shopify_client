require 'rake/testtask'
require "bundler/gem_tasks"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_spec.rb', 'test/**/*_test.rb']
  t.ruby_opts = ['-r./test/test_helper.rb']
  t.verbose = true
end

task :default => :test
