Rails.application.routes.draw do
  root to: "pages#home"
  get '/qrcode/:slug', to: 'scanner#qr_code', as: 'qr_code'
end
