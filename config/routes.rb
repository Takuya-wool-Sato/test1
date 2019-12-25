Rails.application.routes.draw do
  get 'home/index'
  get 'home/authentication'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks, only: [:index, :show, :create, :edit, :new, :destroy] do
    resources :comments, only: [:create]
  end
  post "tasks/:id/completed" => "tasks#completed"
  post "tasks/:id/incomplete" => "tasks#incomplete"

  root 'tasks#index'
end
