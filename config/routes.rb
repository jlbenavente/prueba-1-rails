Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'todos#index'
  resources :todos
  get 'todos/:id/complete', to: 'todos#complete', as: 'complete'
  #get 'todos/list' to: 'todos#list',
end
