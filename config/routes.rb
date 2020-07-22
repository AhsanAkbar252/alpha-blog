Rails.application.routes.draw do
  get 'welcome/hom',to:'welcome#hom'
  get 'baby/salt',to:'baby#salt'
  get 'letsgo/home',to:'letsgo#home'

  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
