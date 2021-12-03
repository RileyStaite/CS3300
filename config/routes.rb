Rails.application.routes.draw do
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resources :projects
  get 'projects/about', to: 'projects#about'
end