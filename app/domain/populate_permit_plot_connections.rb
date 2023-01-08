# frozen_string_literal: true

# Class used to add all of the possible connections between cutting permit and forest plot
class PopulatePermitPlotConnections
  include Interactor::Initializer

  initialize_with :permit

  def run
    populate_permit_plots
  end

  private

  def populate_permit_plots
    permit.sklypai.split(',').each do |plot_number|
      next unless plot(plot_number)

      PermitPlot.create(permit_id: permit.id, plot_id: plot(plot_number).attributes['id'])
    end
  end

  def plot(plot_number)
    @plot ||= {}

    @plot[plot_number] ||=
      Sklypas.find_by(
        gir_kod: forestry&.gir_kod,
        mu_kod: forestry&.mu_kod,
        kv_nr: permit.kvartalas,
        skl_nr: plot_number
      )
  end

  def forestry
    @forestry ||= Girininkija.find_by(pavadinimas: permit.girininkija)
  end
end
