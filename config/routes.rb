Rails.application.routes.draw do
  devise_for :authors
  mount API => '/'
end
