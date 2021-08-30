Rails.application.routes.draw do
  root :to => "clients#new"
  resources :clients do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :accounts do
      resources :transactions
    end
  end
  
end
