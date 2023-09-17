Rails.application.routes.draw do
  resources :myfiles
  resources :stuffs
  resources :memos
  get "category/:name", to: "cats#show", as: :mycat
  get ":title", to: "posts#show", as: :getpost
  resources :posts do
    member do
      get "addmemo"
      get "addfile"
    end
  end


  resources :cats, path: "category" do
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
