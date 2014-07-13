Socbook::Application.routes.draw do
  resources :likes

  resources :soc_books

  resources :topics

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  get "pages/index"
  get "pages/about"

  root to: 'pages#index'
end