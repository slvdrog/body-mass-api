class BodyMassesController < ApplicationController
  before_action :authenticate_user!
  before_action :calculate_body_mass_index, only: [:create]

  def create
    json_response(@bmi)
  end

  private

  def calculate_body_mass_index
    @service = BodyMassService.new(params[:weight], params[:height])
    @bmi = @service.report
  end
end
