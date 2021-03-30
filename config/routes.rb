Rails.application.routes.draw do
  resources :users

  get 'main', to: 'main#main'
  get 'not-following', to: 'not_following#not_following'

  root :to => 'main#main'

end
