Rails.application.routes.draw do
  resources :projects do
    resources :issues
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  match '*unmatched', to: 'application#route_not_found', via: :all

end
