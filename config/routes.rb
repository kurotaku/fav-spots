Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'dbmap', to: 'static_pages#dbmap'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  get 'mypage', to: 'users#mypage'
  resources :users
  
  resources :spots do
    member do
      get :reviews
      resources :reviews, param: :review_id
    end
  end

  resources :categories
  
  get '/prefs/', to: 'spots#prefs'
  get '/prefs/:pref', to: 'spots#pref', as: 'pref'
  
  get 'search', to: 'spots#search'
  get 'ajax_select', to: 'spots#ajax_select', as: 'ajax_select'
  get 'ajax_location', to: 'spots#ajax_location', as: 'ajax_location'
  get 'ajax_search', to: 'spots#ajax_search', as: 'ajax_search'
  get 'ajax_category_select', to: 'spots#ajax_category_select', as: 'ajax_category_select'
  get 'ajax_keyword', to: 'spots#ajax_keyword', as: 'ajax_keyword'
end
