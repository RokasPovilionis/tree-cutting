# frozen_string_literal: true

# Controller for cutting permit violation reports
class CuttingViolationReportsController < ApplicationController
  def new
    @cutting_permit_violation = CuttingViolationReport.new
  end

  def create
    @cutting_permit_violation = CuttingViolationReport.new(cutting_permit_violation_params)

    @cutting_permit_violation.violation_image.attach(cutting_permit_violation_image_params[:violation_image])

    if @cutting_permit_violation.save
      redirect_to leidimai_index_path
    else
      render 'new'
    end
  end

  private

  def cutting_permit_violation_params
    params.require(:cutting_violation_report).permit(:leidimas_id, :description).merge(user_id: current_user.id)
  end

  def cutting_permit_violation_image_params
    params.require(:cutting_violation_report).permit(:violation_image)
  end
end
