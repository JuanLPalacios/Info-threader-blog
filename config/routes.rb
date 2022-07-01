Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get 'users/:user_id/posts(.:format)',to: 'posts#index', as: :posts
  get 'users/:user_id/posts/:id(.:format)',to: 'posts#show', as: :show_post
  get 'users(.:format)',to: 'users#index'
  get 'users/:id(.:format)',to: 'users#show', as: :show_user
  post 'posts/:id/likes(.:format)',to: 'posts#like', as: :like
  post 'posts/:id/comments(.:format)',to: 'posts#comment', as: :comment
  get 'posts/new'
  post 'posts/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
