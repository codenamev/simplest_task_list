EnhancedTasks::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  root :to => "users#new"
  resources :sessions
  resources :users do
    resources :tasks do
      post :sort, on: :collection
    end
  end
end
