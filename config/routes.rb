Rails.application.routes.draw do
  namespace :api do
    #/api/todo_lists/
    resources :todo_lists, only: [:index], path: :todolists do
      #/api/todo_lists/todo_listsID/items
      resources :items
    end
  end

  #/todo_lists/
  resources :todo_lists, only: [:index, :new, :create], path: :todolists do
    resources :items
  end
  
end
