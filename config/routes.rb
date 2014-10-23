Rails.application.routes.draw do
    resources :requests, only: [:new, :create]
    get '/thanks' => 'requests#thanks', as: 'thanks'

    root to: "requests#new"
end
