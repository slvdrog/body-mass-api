class BodyMassesController < ApplicationController
  before_action :authenticate_user!
  before_action :calculate_body_mass_index, only: [:create]

  def create
    json_response(@bmi_report)
  end

  private

  def body_mass_params
    params.permit(:height, :weight)
  end

  def calculate_body_mass_index
    @service = BodyMassService.new(body_mass_params)
    @bmi_report = @service.report
  end
end
