Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'admin/words/import', to: 'admin/words#import'

  root 'dashboard#index'

  resources :tests, only: [:new, :create, :show, :update]
  post '/words' => 'words#index', constraints: { format: :json }
end
