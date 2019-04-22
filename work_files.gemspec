$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "work_files/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "work_files"
  spec.version     = WorkFiles::VERSION
  spec.authors     = ["Sean Upton"]
  spec.email       = ["sdupton@gmail.com"]
  spec.homepage    = "https://github.com/marriott-library/work_files"
  spec.summary     = "File CRUD/attachment adapters for Hyrax"
  spec.description = "File CRUD/attachment adapters for Hyrax"
  spec.license     = "Apache-2.0"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.0"
  spec.add_dependency "hyrax", "~> 2.5"

  spec.add_development_dependency 'engine_cart', '~> 2.2'
  spec.add_development_dependency 'fcrepo_wrapper', '~> 0.5', '>= 0.5.1'
  spec.add_development_dependency 'rspec-rails', '~> 3.1'
  spec.add_development_dependency 'solr_wrapper', '>= 1.1', '< 3.0'
  spec.add_development_dependency "sqlite3"
end
