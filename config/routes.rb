Rails.application.routes.draw do
  devise_for :teachers
  devise_for :users
  devise_for :admins
  mount RailsAdmin::Engine => '/admin/dashboard', as: 'rails_admin'
  resources :courses do
    resources :lessons
  end
end
