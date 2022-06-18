Rails.application.routes.draw do
  root 'users#index'
  get 'users/:user_id/posts(.:format)',to: 'posts#index'
  get 'users/:user_id/posts/:id(.:format)',to: 'posts#show'
  get 'users(.:format)',to: 'users#index'
  get 'users/:id(.:format)',to: 'users#show', as: :show_user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
