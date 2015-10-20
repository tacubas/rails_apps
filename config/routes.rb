Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users, :skip => [:registrations]
  scope "/admin" do
    resources :users do
      resources :pets
    end
    get '/doctors', to: 'users#doctors'
    get '/new_doctor' => 'users#new_doctor'
    get '/customers', to: 'users#customers'
    get '/new_customer' => 'users#new_customer'

  end
  resources :appointments
end
