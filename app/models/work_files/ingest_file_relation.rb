module WorkFiles
  class IngestFileRelation < ApplicationRecord
    # namespaced, explicit table name:
    self.table_name = 'work_files_ingest_file_relations'

    validates :file_path, presence: true
    validates :derivative_path, presence: true

    # Query by file path for all derivatives, as de-duplicated array of
    #   derivative paths.
    # @param path [String] Path to primary file
    # @return [Array<String>] de-duplicated array of derivative paths.
    def self.derivatives_for_file(path)
      where(file_path: path).pluck(:derivative_path).uniq
    end
  end
end
