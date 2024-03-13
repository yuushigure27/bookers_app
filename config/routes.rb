Rails.application.routes.draw do
  root 'homes#top'
  resources :books do
  member do
    delete :destroy_book 
  end
end
end