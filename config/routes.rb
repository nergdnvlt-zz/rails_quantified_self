Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals do
        post "foods/:id", to: 'meal_foods#create'
        delete "foods/:id", to: 'meal_foods#destroy'
      end

      get "/meals/:id/foods", to: 'meals#show', as: 'api_v1_meal'
    end
  end
end
