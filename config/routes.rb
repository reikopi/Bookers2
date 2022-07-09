Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/edit'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  root to: "homes#top"
  get '/top' => 'homes#top'
  get '/about' => 'homes#about'
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :update, :destroy, :edit]
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
