# frozen_string_literal: true

# Class which parses bad inputs for the given permit
class PermitParser
  include Interactor::Initializer

  initialize_with :permit_attributes

  def run
    parse_bad_plots

    remove_gir_suffix_from_forestry

    permit_attributes
  end

  private

  def parse_bad_plots
    corrected_plot_numbers = permit_attributes[:sklypai].split(',').map do |plot_number|
      correct_plot_number(plot_number)
    end.join(',')

    permit_attributes[:sklypai] = corrected_plot_numbers
  end

  def correct_plot_number(plot_number)
    return (plot_number.split('-').first.to_i..plot_number.split('-').last.to_i).to_a if plot_number.include?('-')
    return [plot_number[0..1], plot_number[2...]] if plot_number.to_i.digits.length > 3

    plot_number
  end

  def remove_gir_suffix_from_forestry
    permit_attributes[:girininkija] = permit_attributes[:girininkija].remove(' gir')
  end
end
