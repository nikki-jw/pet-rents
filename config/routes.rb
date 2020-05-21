Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "pages#home", as: "root"
  get "/profile", to:"pages#profile", as: "profile"
  get "/donate", to:"pages#donate", as: "donate"
  get "/pages/donated", to:"pages#donated", as: "donated"

  get "/petlistings", to: "petlistings#index", as: "petlistings"
  get "/petlistings/new", to: "petlistings#new", as: "new_petlisting"
  get "petlistings/mypets", to:"petlistings#userpets"
  post "/petlistings", to: "petlistings#create"
  get "/petlistings/:id/edit", to:"petlistings#edit", as: "editpetlisting"
  get "/petlistings/:id", to: "petlistings#show", as: "petlisting"

  
  put "/petlistings/:id", to: "petlistings#update"
  patch "/petlistings/:id", to: "petlistings#update"
  delete "/petlistings/:id", to: "petlistings#destroy"

end
