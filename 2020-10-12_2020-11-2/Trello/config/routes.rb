Rails.application.routes.draw do
  resources :tasklists do
    resources :tasks
  end

  root 'tasklists#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end