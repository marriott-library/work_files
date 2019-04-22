require 'rails/generators'

module WorkFiles
  # Install generator for engine
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def reconfigure_hyrax_callbacks
      inject_into_file 'config/initializers/hyrax.rb',
                       after: "Hyrax.config do |config|\n" do
        "  # == START GENERATED work_files CONFIG\n" \
        "  config.callback.set(:after_create_fileset) do |file_set, user|\n" \
        "    WorkFiles.handle_after_create_fileset(file_set, user)\n" \
        "  end\n" \
        "  # == END GENERATED work_files CONFIG\n\n"
        # ==
      end
    end
  end
end
