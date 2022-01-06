# frozen_string_literal: true

# Controller for leidimai screen
class LeidimaiController < ApplicationController
  skip_before_action :authorized

  def index
    @leidimai = Leidimas.paginate(page: params[:page], per_page: 30)
  end
end
