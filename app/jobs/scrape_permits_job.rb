# frozen_string_literal: true

# Class used for housing the job for scraping permits
class ScrapePermitsJob < ApplicationJob
  queue_as :low_priority

  def perform
    Permit::ParseXlsx.run
  end
end
