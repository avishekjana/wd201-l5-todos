Rails.application.routes.draw do
  # root to: "/"
  get "/" => "todos#index"
  resources :todos
  resources :users
  get "/signin" => "sessions#new", as: :new_session
  post "/signin" => "sessions#create", as: :session
end
