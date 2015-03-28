Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/user_count/all', to: "user_count#all"
    end
  end

  devise_for :users

  # post '/users/update_minutes' => 'users#update_minutes'

  resources :users, only: [:show] do
    post :update_minutes, on: :collection
  end

  root 'welcome#home'

end
