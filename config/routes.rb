Rails.application.routes.draw do
  root 'users#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: :index
  resources :skillsheets, except: :destroy do
    get :print, :member
  end
  resources :worksheets, except: :index
end
