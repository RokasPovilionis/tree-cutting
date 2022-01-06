# frozen_string_literal: true

# Controller for home screen
class PagesController < ApplicationController
  skip_before_action :authorized

  def index
  end
end
