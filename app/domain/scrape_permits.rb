# frozen_string_literal: true

# Class used to collect all scraped permits
class ScrapePermits
  include Interactor::Initializer

  PERMIT_SITE_URL = 'https://kirtleidimai.amvmt.lt/Default.aspx'

  def run
    load_cookies

    parsed_page = parsed_page_with_permits

    page_count = parsed_page.search('span')[2].children.last.text.to_i

    columns = parsed_page.search('tr').select { |tr| tr.attributes['bgcolor']&.value == '#DEDFDE' }
  end

  private

  def parsed_page_with_permits
    new_page = agent.post(PERMIT_SITE_URL, post_request_body(page))

    Nokogiri::HTML(new_page.body)
  end

  def load_cookies
    agent.post(PERMIT_SITE_URL)
  end

  def post_request_body(page)
    {
      '__EVENTTARGET' => 'GridView2',
      '__EVENTARGUMENT' => 'Page$1',
      '__VIEWSTATE' => page.form.fields.find { |field| field.name == '__VIEWSTATE' }.value,
      'metai' => 'RadioButton1',
      'padaliniai' => 'RadioButton3',
      'DropDownList1' => 'Alytaus TP'
    }
  end

  def agent
    @agent ||= Mechanize.new
  end
end
