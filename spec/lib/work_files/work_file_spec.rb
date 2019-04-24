require 'spec_helper'
require 'misc_shared'

RSpec.describe WorkFiles::WorkFile do
  include_context "shared setup"

  # sample objects:
  let(:work) { work_with_file }

  describe "adapter composition" do
    it "adapts work with nil fileset" do
      adapter = described_class.new(work)
      expect(adapter.work).to be work
      expect(adapter.fileset).to be_nil
    end

    it "adapts work with 'of' alt constructor" do
      adapter = described_class.of(work)
      expect(adapter.work).to be work
    end

    it "adapts work and explicitly provided fileset" do
      fileset = work.members.select { |m| m.class == FileSet }[0]
      adapter = described_class.of(work, fileset)
      expect(adapter.work).to be work
      expect(adapter.fileset).to be fileset
    end

    it "constructs with a parent object, if provided" do
      fileset = work.members.select { |m| m.class == FileSet }[0]
      parent = double('parent')
      adapter = described_class.of(work, fileset, parent)
      expect(adapter.parent).to be parent
    end
  end

  describe "read file metadata" do
    it "gets original filename" do
      fileset = work.members.select { |m| m.class == FileSet }[0]
      adapter = described_class.of(work, fileset)
      expect(adapter.name).to eq fileset.original_file.original_name
      expect(adapter.name).to eq 'credits.md'
    end

    it "gets miscellaneous metadata field values" do
      fileset = work.members.select { |m| m.class == FileSet }[0]
      adapter = described_class.of(work, fileset)
      # expectations for accessors of size, date_*, mime_type
      expect(adapter.size).to eq File.size(txt_path)
      expect(adapter.name).to eq 'credits.md'
      expect(adapter.mime_type).to eq 'text/plain'
      # getting actual value for date fields requires digging through
      #   multiple layers of ActiveTuples indirection...
      expect(adapter.date_created.to_a[0].to_s).to eq static_date.to_s
      expect(adapter.date_modified.to_a[0].to_s).to eq static_date.to_s
    end
  end

  describe "read binary via transparent repository checkout" do
    it "gets path (from checkout)" do
      fileset = work.members.select { |m| m.class == FileSet }[0]
      adapter = described_class.of(work, fileset)
      # Get a path to a working copy
      path = adapter.path
      expect(path).to be_a String
      expect(File.exist?(path)).to be true
      # size of working copy binary checkout matches size in computed metadata
      expect(File.size(path)).to eq fileset.original_file.size
    end

    it "gets data as bytes" do
      fileset = work.members.select { |m| m.class == FileSet }[0]
      adapter = described_class.of(work, fileset)
      # Get a data from the working copy
      data = adapter.data
      expect(data).to be_a String
      # size of working copy binary checkout matches size in computed metadata
      expect(data.size).to eq fileset.original_file.size
    end

    it "runs block on data as IO" do
      fileset = work.members.select { |m| m.class == FileSet }[0]
      adapter = described_class.of(work, fileset)
      adapter.with_io { |io| expect(io.read.size).to eq File.size(txt_path) }
    end
  end

  describe "derivative access" do
    it "gets derivatives for file" do
      fileset = work.members.select { |m| m.class == FileSet }[0]
      adapter = described_class.of(work, fileset)
      expect(adapter.derivatives.class).to eq \
        WorkFiles::WorkDerivatives
      expect(adapter.derivatives.fileset).to be fileset
      expect(adapter.derivatives.work).to be work
      expect(adapter.derivatives.parent).to be adapter
    end
  end
end
