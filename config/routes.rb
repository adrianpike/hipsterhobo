Hipsterhobo::Application.routes.draw do
  resources :entries do
    collection do
      get :submissions
    end
    
    member do
      post :approve
    end
    
    resource :votes
  end
  root :to => "entries#index"
end
