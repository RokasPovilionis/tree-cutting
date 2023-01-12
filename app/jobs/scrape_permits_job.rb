# frozen_string_literal: true

# Class used for housing the job for scraping permits
class ScrapePermitsJob < ApplicationJob
  queue_as :default

  def perform
    Leidimas.delete_all

    ScrapePermits.run
  end
end
