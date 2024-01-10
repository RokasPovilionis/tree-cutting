# frozen_string_literal: true

# Controller for leidimai screen
class LeidimaiController < ApplicationController
  skip_before_action :authorized, only: %i[index show]

  def index
    @leidimai = Leidimas.order(:created_at).paginate(page: params[:page], per_page: 25)
  end

  def show
    @leidimas = Leidimas.find(params[:id])
    @geo_json = GeoJson::Generate.for([@leidimas], 'public/geo_jsons/lalal.json', nil, true)
  end

  def new
    @leidimas = Leidimas.new
  end

  def create
    @leidimas = Leidimas.new(leidimas_params)

    if @leidimas.save
      redirect_to leidimai_index_path
    else
      render 'new'
    end
  end

  private

  def leidimas_params
    params.require(:leidimas).permit(:serija_ir_nr, :regionas, :rajonas, :nuosavybes_forma, :uredija,
                                     :girininkija, :kvartalas, :sklypai, :plotas, :kad_vietove,
                                     :kad_blokas, :kad_nr, :kirtimo_rusis, :galiojimo_pradzia,
                                     :galiojimo_pabaiga)
  end
end
