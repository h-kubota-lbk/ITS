Rails.application.routes.draw do
  root 'home#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
  resources :skillsheets, except: :destroy do
    get :print, :member
  end
  resources :work_contents, except: %i[index show]
end
