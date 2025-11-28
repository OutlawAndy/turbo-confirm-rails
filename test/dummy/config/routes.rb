Rails.application.routes.draw do
  resources :todos
  mount Turbo::Confirm::Engine => "/turbo-confirm"
end
