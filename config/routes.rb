Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/characters', to: 'chacters#get_characters'
      resources :chacters
    end
  end
end
