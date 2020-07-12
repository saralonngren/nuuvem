Rails.application.routes.draw do
  root 'sales#index'

  resources :sales, only: [:index]
  post 'sales/import_file'
end
