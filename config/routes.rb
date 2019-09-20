Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # APIコントローラへのルーティング
  root to: 'home#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :employees, only: [:index, :show]
    end
  end
end
