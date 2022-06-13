Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'landing#forecast'
      get '/backgrounds', to: 'landing#backgrounds'
      post '/users', to: 'users#create'
      get '/book-search', to: 'books#results'
    end
  end
end
