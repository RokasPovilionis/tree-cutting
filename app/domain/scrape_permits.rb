# frozen_string_literal: true

# Class used to collect all scraped permits
class ScrapePermits
  include Interactor::Initializer

  PERMIT_SITE_URL = 'https://kirtleidimai.amvmt.lt/Default.aspx'

  REGIONS_WITH_PERMITS = [
    'Alytaus TP',
    'Kauno TP',
    'Klaipėdos TP',
    'Marijampolės TP',
    'Miškų kontrolės skyrius',
    'Panevėžio TP',
    'Šiaulių TP',
    'Utenos TP',
    'Vilniaus TP'
  ].freeze

  def run
    load_cookies

    scrape_permits
  end

  private

  def scrape_permits
    REGIONS_WITH_PERMITS.each do |region|
      reset_permit_page_count
      CollectRegionPermits.run(region, agent, view_state)
    end
  end

  def reset_permit_page_count
    agent.get(PERMIT_SITE_URL)
  end

  def load_cookies
    initial_page
  end

  def initial_page
    @initial_page ||= agent.post(PERMIT_SITE_URL)
  end

  def view_state
    @view_state ||= initial_page.form.fields.find { |field| field.name == '__VIEWSTATE' }.value
  end

  def agent
    @agent ||= Mechanize.new
  end
end
