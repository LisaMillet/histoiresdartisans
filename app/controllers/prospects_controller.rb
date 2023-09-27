class ProspectsController < ApplicationController
  def create
    @prospect = Prospect.new(prospect_params)

    if @prospect.save
      send_email_white_book
      flash.now[:notice] = 'Le livre vous a été envoyé par email'
    else
      render 'pages/white_book', status: :unprocessable_entity
    end
  end

  private

  def prospect_params
    all_params.slice(:first_name, :last_name, :email, :position, :company, :newsletter)
  end

  def all_params
    params.require(:prospect)
          .permit(:first_name, :last_name, :email, :position, :company, :newsletter, :template, :title)
  end

  def send_email_white_book
    SendEmailWhiteBookService.new(@prospect, params[:prospect].slice(:title, :template)).call
  end
end
