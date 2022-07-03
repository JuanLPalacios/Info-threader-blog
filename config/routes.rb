Rails.application.routes.draw do
  devise_for :users
  devise_for :users,
              path: 'api',
              controllers: {
                  sessions: 'users/sessions'
              }, as: :api_users
  root 'users#index'
  get 'users/:user_id/posts(.:format)',to: 'posts#index', as: :posts
  get 'users/:user_id/posts/:id(.:format)',to: 'posts#show', as: :show_post
  delete 'posts/:id(.:format)',to: 'posts#delete', as: :delete_post
  get 'users(.:format)',to: 'users#index'
  get 'users/:id(.:format)',to: 'users#show', as: :show_user
  post 'posts/:id/likes(.:format)',to: 'posts#like', as: :like
  post 'posts/:id/comments(.:format)',to: 'comments#create', as: :comment
  delete 'comments/:id(.:format)',to: 'comments#delete', as: :delete_comment
  get 'posts/new'
  post 'posts/create'
  get 'api/users/:author_id/posts(.:format)',to: 'api/posts#index'
  get 'api/users/:author_id/posts/:id/comments(.:format)',to: 'api/comments#index'
  post 'api/users/:author_id/posts/:id/comments(.:format)',to: 'api/comments#create'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
