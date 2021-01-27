Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"

  namespace :api, constraints: { format: 'json' } do
    resources :articles, except: [:edit, :new] 
  end

end
