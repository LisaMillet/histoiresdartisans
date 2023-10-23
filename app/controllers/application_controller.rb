class ApplicationController < ActionController::Base
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
  # TO BE CHECKED / A VERIFIER 
  skip_before_action :verify_authenticity_token, only: :destroy
end
