class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "Calling Clearbit API for #{user.email}..."
    sleep 2
    puts "Done! Enriched #{user.email} with Clearbit"
  end
end
