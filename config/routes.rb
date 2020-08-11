Rails.application.routes.draw do
<<<<<<< HEAD
  #   get 'categories/index'
  #   get 'categories/new'
  #   get 'categories/create'
  #   get 'categories/edit'
  #   get 'categories/update'
  #   get 'categories/show'
  #   get 'categories/destroy'
  get "categories/index"

=======
<<<<<<< HEAD
#   get 'categories/index'
#   get 'categories/new'
#   get 'categories/create'
#   get 'categories/edit'
#   get 'categories/update'
#   get 'categories/show'
#   get 'categories/destroy'
get 'categories/index'

  get "comments/index"
  get "comments/create"
  get "comments/new"
  get "comments/update"
  get "comments/destroy"
  get "comments/edit"
  get "comments/show"
=======
>>>>>>> included edit button
  # get "comments/index"
  # get "comments/create"
  # get "comments/new"
  # get "comments/update"
  # get "comments/destroy"
  # get "comments/edit"
  # get "comments/show"
<<<<<<< HEAD
=======
>>>>>>> included edit button
>>>>>>> included edit button
  # get 'questions/index'
  # get 'questions/new'
  # get 'questions/create'
  # get 'questions/edit'
  # get 'questions/update'
  # get 'questions/show'
  # get 'questions/destroy'

  post "options/addvote"

  post "questions/flag"

  post "questions/toggle"

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :categories

  resources :users

  resources :users do
    resources :questions
  end

  resources :users do
    resources :comments
  end

  resources :questions do
    resources :options
  end

  resources :category do
    resources :questions
  end

  # post '/questions/:id', to: 'questions#updateVote'

  resources :questions do
    resources :comments do
      patch :edit
    end
  end


  root "questions#index"
end
