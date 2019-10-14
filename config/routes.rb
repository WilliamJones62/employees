Rails.application.routes.draw do
  resources :user_loads do
    collection { post :import}
  end
  namespace :api do
    namespace :v1 do
      resources :employees
    end
  end
  resources :mailboxes do
    collection { post :import }
  end
  get 'employees/missing'
  resources :employees do
    collection { post :import }
  end
  devise_for :users, controllers: { registrations: "users/registrations" }
  root 'employees#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
