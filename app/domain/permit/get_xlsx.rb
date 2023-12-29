# frozen_string_literal: true

# Class used for getting xlsx files
class Permit::GetXlsx
  include Interactor::Initializer

  def run
    page = agent.get('https://kirtleidimai.amvmt.lt/')
    page_form = page.forms.first

    filtruoti = agent.submit(page_form, page_form.buttons.first)
    filtruoti_form = filtruoti.forms.first
    xlsx = agent.submit(filtruoti_form, filtruoti_form.buttons.last).body

    StringIO.new(xlsx)
  end

  private

  def agent
    @agent ||= Mechanize.new
  end
end
