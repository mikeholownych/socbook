Socbook::Application.routes.draw do
  resources :likes

  resources :soc_books

  resources :topics

  devise_for :users
  get "pages/index"
  get "pages/about"

  root :to => "pages#index"
end
