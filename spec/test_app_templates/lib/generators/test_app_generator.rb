require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root File.join(WorkFiles::GEM_PATH, "spec/test_app_templates")

  # if you need to generate any additional configuration
  # into the test app, this generator will be run immediately
  # after setting up the application

  def install_hyrax
    generate 'hyrax:install', '-f'
  end

  def install_engine
    generate 'work_files:install'
  end

  def inject_work_type
    copy_file 'app/models/work.rb'
  end

  def db_migrations
    rake 'db:migrate'
  end

  def configure_browse_everything
    generate 'browse_everything:config'
  end
end
