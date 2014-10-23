Rails.application.routes.draw do
  devise_for :users

  resources :requests, only: [:new, :create, :index] do
    post 'add', as: 'add'
    get 'lookup' => 'requests#lookup_form', on: :collection, as: 'lookup'
    post 'lookup', on: :collection
  end
  get '/thanks' => 'requests#thanks', as: 'thanks'
  get '/admin' => 'requests#index', as: 'admin'

  root to: "requests#new"
end
