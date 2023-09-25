Rails.application.routes.draw do
  # allow to personalize the routes for connection & registration
  # access at http://localhost:3000/users/#{replace by the value of the key sign in}
  devise_for :users, path_names: {
    sign_in: 'admin'
  }, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"
  resources :contacts, only: %i[new create]
  get 'contacts/sent', to: 'contacts#sent', as: 'sent_contact'
  get '/qui_sommes_nous', to: 'pages#about', as: 'about'
  get '/soutenir', to: 'pages#support', as: 'support'
  get '/actualites', to: 'pages#news', as: 'news'
  get '/contact', to: 'pages#contact', as: 'contact'
  get '/repertoire_artisans', to: 'pages#directory_artisans', as: 'directory_artisans'
  get '/podcast', to: 'pages#podcast', as: 'podcast'
  get '/newsletter', to: 'pages#newsletter', as: 'newsletter'
  get '/visite', to: 'pages#visite', as: 'visite'

  # Partenariats
  get '/partenariat', to: 'pages#partnership', as: 'partnership'
  get 'partenariat/civ', to: 'partnership#civ', as: 'civ'
  get 'partenariat/loem', to: 'partnership#loem', as: 'loem'

  # Articles
  resources :articles, only: %i[index]
  get 'articles/civ', to: 'articles#civ', as: 'articleciv'

  # Posts with SAAS
  resources :posts, only: %i[index new create show destroy edit update]
end
