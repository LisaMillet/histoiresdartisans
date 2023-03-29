Rails.application.routes.draw do
  root to: "pages#home"
  resources :articles, only: %i[index show]
  resources :contacts, only: %i[new create]
  get 'contacts/sent', to: 'contacts#sent', as: 'sent_contact'
  get '/qui_sommes_nous', to: 'pages#about', as: 'about'
  get '/soutenir', to: 'pages#support', as: 'support'
  get '/actualites', to: 'pages#news', as: 'news'
  get '/contact', to: 'pages#contact', as: 'contact'
  get '/repertoire_artisans', to: 'pages#directory_artisans', as: 'directory_artisans'
  get '/podcast', to: 'pages#podcast', as: 'podcast'
end
