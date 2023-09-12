class Users::RegistrationsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @resource = User.new
  end

  def create
    # Créez un nouvel utilisateur en utilisant les paramètres du formulaire
    @resource = User.new(user_params)

    if @resource.save
      flash[:notice] = 'Compte utilisateur créé avec succès.'
      redirect_to root_path # Redirigez vers la page souhaitée après l'inscription
    else
      render 'new' # Réaffichez le formulaire en cas d'erreur de validation
    end
  end

  private

  def authenticate_admin!
    unless current_user && current_user.admin?
      flash[:alert] = 'Seuls les administrateurs peuvent accéder à cette page.'
      redirect_to root_path
    end
  end

  def user_params
    # Définissez ici les paramètres que vous souhaitez autoriser pour l'inscription,
    # par exemple :email, :password, :password_confirmation, etc.
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end
