Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dictionaries, only: [] do
    get "search", on: :collection
  end
end
