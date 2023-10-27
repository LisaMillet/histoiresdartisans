class ProspectsController < ApplicationController
  def create
    @prospect = Prospect.new(prospect_params)
    @prospect.position = params[:prospect][:position].to_i

    if @prospect.save
      # send_email_notebooks
      # flash.now[:notice] = 'Le carnet vous a été envoyé par email'
      # render turbo_stream: turbo_stream.append(
      #   :flash,
      #   partial: 'shared/flash_message'
      # )
      head :ok
    else
      render 'pages/notebooks', status: :unprocessable_entity
    end
  end

  private

  def prospect_params
    all_params.slice(:first_name, :last_name, :email, :company, :newsletter)
  end

  def all_params
    params.require(:prospect)
          .permit(:first_name, :last_name, :email, :position, :company, :newsletter, :template, :title)
  end

  def send_email_notebooks
    SendEmailNotebooksService.new(@prospect, params[:prospect].slice(:title, :template)).call
  end
end
