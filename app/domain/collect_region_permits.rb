# frozen_string_literal: true

# Class used to collect permits for given region
class CollectRegionPermits
  include Interactor::Initializer

  PERMIT_SITE_URL = 'https://kirtleidimai.amvmt.lt/Default.aspx'

  initialize_with :region, :agent, :view_state

  def run
    puts "page count #{page_count} for region - #{region}"
    (1..page_count).each do |page_number|
      puts "scraping page number #{page_number} for region - #{region}"

      elements = parsed_page(page_number).search('tr').select { |tr| tr.attributes['bgcolor']&.value == '#DEDFDE' }

      PermitSerializer.for(elements)
    end
  end

  private

  def parsed_page(page_number)
    agent.get(PERMIT_SITE_URL)

    new_page = agent.post(PERMIT_SITE_URL, post_request_body(page_number))

    Nokogiri::HTML(new_page.body)
  end

  def page_count
    @page_count ||= parsed_page(1).search('span')
                                  .find { |span| span.attributes['id']&.value == 'Label1' }
                                  .children.last.text.to_i
  end

  def post_request_body(page_number)
    {
      '__EVENTTARGET' => 'GridView2',
      '__EVENTARGUMENT' => "Page$#{page_number}",
      '__VIEWSTATE' => view_state,
      'metai' => 'RadioButton1',
      'padaliniai' => 'RadioButton3',
      'DropDownList1' => region
    }
  end
end
