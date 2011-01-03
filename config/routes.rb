Hipsterhobo::Application.routes.draw do
  resources :entries do
    resource :votes
  end
  root :to => "entries#index"
end
