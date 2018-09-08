Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'dbmap', to: 'static_pages#dbmap'
end
