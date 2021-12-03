Rails.application.routes.draw do
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resources :projects
  get '/about', to: 'projects#about'

  devise_scope :user do
    get "register", to: "devise/registrations#new"
    get 'login', to: 'devise/sessions#new'
    get "logout", to: "devise/sessions#destroy"
  end

end

