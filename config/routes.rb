Nadiatutor::Application.routes.draw do
  resources :ledgers

  resources :questions
  match 'questions/new/:id' => 'questions#new'
  

  resources :difficulties

  resources :games 


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end