Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end
  namespace :api do
    namespace :v1 do
      get '/users/search', to: 'users#search'
      resources :users
    end
  end

  get '/public', to: 'public#public'
  get '/private', to: 'private#private'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
