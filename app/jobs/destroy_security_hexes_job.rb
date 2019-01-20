class DestroySecurityHexesJob < ApplicationJob
  queue_as :default

  def perform
    # destroy all yesterday's hexes
  end
end
