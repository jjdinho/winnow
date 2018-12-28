class SendWeeklyMailJob < ApplicationJob
  queue_as :default

  def perform
    # Get all search queries...
    # Execute them
    # Send emails
  end
end
