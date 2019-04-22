require 'rspec/core/rake_task'
require 'bundler/gem_tasks'
require 'engine_cart/rake_task'

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

task :setup_test_server do
  require 'engine_cart'
  EngineCart.load_application!
end

Dir.glob('tasks/*.rake').each { |r| import r }
Dir.glob('lib/tasks/*.rake').each { |r| import r }

task default: :ci
task default: :spec
