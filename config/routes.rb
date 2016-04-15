Rails.application.routes.draw do
  get 'game/index'

  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  root 'welcome#index'

  
end
