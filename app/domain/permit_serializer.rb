# frozen_string_literal: true

# Class used to serialize permits from html elements and adds them to the database
class PermitSerializer
  include Interactor::Initializer

  PERMIT_ATTRIBUTE_POSITIONS = {
    serija_ir_nr: 1,
    regionas: 2,
    rajonas: 3,
    nuosavybes_forma: 4,
    uredija: 5,
    girininkija: 6,
    kvartalas: 7,
    sklypai: 8,
    plotas: 9,
    kad_vietove: 10,
    kad_blokas: 11,
    kad_nr: 12,
    kirtimo_rusis: 13,
    galiojimo_pradzia: 14,
    galiojimo_pabaiga: 15
  }.freeze

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
    PERMIT_ATTRIBUTE_POSITIONS.transform_values do |value|
      extract_text(permit_data, value)
    end
  end

  def extract_text(permit_data, attribute_number)
    permit_data[attribute_number].children.children.first.text
  end
end
