Rails.application.routes.draw do
  resources :projects do
    resources :issues do
      member do
        patch :mark_done
      end
    end
  end
  resources :reports, only: [:index] do
    collection do
      get :export_excel
      get :export_pdf
    end
  end
  root "projects#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  match '*unmatched', to: 'application#route_not_found', via: :all

end
