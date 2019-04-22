module WorkFiles
  # module constants:
  GEM_PATH = Gem::Specification.find_by_name("work_files").gem_dir

  class Engine < ::Rails::Engine
  end
end
