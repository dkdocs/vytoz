Rails.application.routes.draw do
  resources :reviews
  
  resources :reservations do
    member do
      get 'cancel'
    end
  end
end
