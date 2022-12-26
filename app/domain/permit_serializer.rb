# frozen_string_literal: true

# Class used to serialize permits from html elements and adds them to the database
class PermitSerializer
  include Interactor::Initializer

  initialize_with :permit_elements

  def run
    permit_elements.each do |permit_element|
      permit_data = permit_element.children

      create_permit(permit_attributes(permit_data))
    end
  end

  private

  def create_permit(attributes)
    corrected_attributes = PermitParser.for(attributes)

    Leidimas.find_or_create_by(corrected_attributes)
  end

  def permit_attributes(permit_data)
    Constants::PERMIT_ATTRIBUTE_POSITIONS.transform_values do |value|
      extract_text(permit_data, value)
    end
  end

  def extract_text(permit_data, attribute_number)
    permit_data[attribute_number].children.children.first.text
  end
end
