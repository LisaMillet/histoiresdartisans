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

  # Carnets des innovations w/ prospects
  get 'carnets_des_innovations', to: 'pages#notebooks', as: 'notebooks'

  resources :prospects, only: :create

  # Articles
  resources :articles, only: %i[index]
  get 'articles/civ', to: 'articles#civ', as: 'articleciv'

  # Posts with SAAS
  # resources :posts, only: %i[index new create show destroy edit update]
  get 'blog', to: 'posts#index', as: 'posts'
  get 'blog/nouvel-article', to: 'posts#new', as: 'new_post'
  post 'blog', to: 'posts#create'
  get 'blog/:id', to: 'posts#show', as: 'post'
  get 'blog/:id/modifier-article', to: 'posts#edit', as: 'edit_post'
  patch 'blog/:id', to: 'posts#update'
  delete 'blog/:id', to: 'posts#destroy'

  # Legal
  get '/mentionslegales', to: 'pages#legal', as: 'legal'
end
