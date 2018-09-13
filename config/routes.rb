Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'dbmap', to: 'static_pages#dbmap'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users
  
  resources :spots do
    member do
      get :reviews
      resources :reviews
    end
  end
  
  resources :categories
  
  get 'search', to: 'spots#search'
  get 'ajax_select', to: 'spots#ajax_select', as: 'ajax_select'
  get 'ajax_search_form', to: 'spots#ajax_search_form', as: 'ajax_search_form'
end
