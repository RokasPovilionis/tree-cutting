# frozen_string_literal: true

# Controller for cutting permit violation reports
class CuttingViolationReportsController < ApplicationController
  def index
    @cutting_violation_reports = CuttingViolationReport.order(:created_at).paginate(page: params[:page], per_page: 25)
  end

  def show
    @cutting_violation_report = CuttingViolationReport.find(params[:id])
  end

  def new
    @cutting_violation_report = CuttingViolationReport.new
  end

  def create
    @cutting_violation_report = CuttingViolationReport.new(cutting_violation_report_params)

    @cutting_violation_report.violation_image.attach(cutting_permit_violation_image_params[:violation_image])

    if @cutting_violation_report.save
      redirect_to leidimai_index_path
    else
      render :action => "new", :leidimas_id => cutting_violation_report_params[:ledimas_id]
    end
  end

  private

  def cutting_violation_report_params
    params.require(:cutting_violation_report).permit(:leidimas_id, :description).merge(user_id: current_user.id)
  end

  def cutting_permit_violation_image_params
    params.require(:cutting_violation_report).permit(:violation_image)
  end
end
