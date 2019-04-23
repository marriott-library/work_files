class CreateWorkFilesDerivativeAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :work_files_derivative_attachments do |t|
      t.string :fileset_id
      t.string :path
      t.string :destination_name

      t.timestamps
    end
    add_index :work_files_derivative_attachments, :fileset_id
  end
end
