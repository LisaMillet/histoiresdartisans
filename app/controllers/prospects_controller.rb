class ProspectsController < ApplicationController
  def create
    @prospect = Prospect.new(prospect_params)
    @prospect.save
  end

  private

  def prospect_params
    params.require(:prospect).permit(:first_name, :last_name, :email, :position, :company, :newsletter)
  end
end
