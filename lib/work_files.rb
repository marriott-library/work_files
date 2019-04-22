require 'work_files/engine'
require 'fileset_helper'
require 'path_helper'
require 'work_files'
require 'work_derivatives'

# WorkFiles namespace...
module WorkFiles
  # Handler for after_create_fileset, to be called by a block subscribing to
  #   and overriding default Hyrax `:after_create_fileset` handler, via
  #   app integrating newspaper_works.
  def self.handle_after_create_fileset(file_set, user)
    handle_queued_derivative_attachments(file_set)
    # Hyrax queues this job by default, and since work_files
    #   overrides the single subscriber Hyrax uses to do so, we
    #   must, for sake of completeness, call this here:
    FileSetAttachedEventJob.perform_later(file_set, user)
    work = file_set.member_of[0]
    # Hyrax CreateWithRemoteFilesActor has glaring omission re: this job,
    #   so we call it here, once we have a fileset to copy permissions to.
    InheritPermissionsJob.perform_later(work) unless work.nil?
  end

  def self.handle_queued_derivative_attachments(file_set)
    return if file_set.import_url.nil?
    work = file_set.member_of.select(&:work?)[0]
    derivatives = WorkFiles::WorkDerivatives.of(work)
    # For now, because derivative attachment in Hyrax is IO-bound operation,
    #   it makes sense to have to run inline without any async job:
    derivatives.commit_queued!(file_set)
  end
end
