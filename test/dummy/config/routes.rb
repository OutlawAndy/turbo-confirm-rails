Rails.application.routes.draw do
  mount Turbo::Confirm::Engine => "/turbo-confirm"
end
