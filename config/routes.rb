Rails.application.routes.draw do

  get 'users/new' => "messages#new", as: :new_user
  post 'users' => 'messages#log'
  get 'messages' => "messages#index", as: :messages
  
  
  post 'messages'  => 'messages#message'
  post 'comments' => 'messages#comment'
  post 'users/:id' => 'messages#clear'
end
