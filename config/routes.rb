Rails.application.routes.draw do
  root 'welcome#hom'
  get 'baby/salt',to:'baby#salt'
  get 'letsgo/home',to:'letsgo#home'

  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout' , to: 'sessions#destroy'

  resources :categories,except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
