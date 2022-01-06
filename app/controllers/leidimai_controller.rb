# frozen_string_literal: true

# Controller for leidimai screen
class LeidimaiController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    @leidimai = Leidimas.paginate(page: params[:page], per_page: 30)
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
