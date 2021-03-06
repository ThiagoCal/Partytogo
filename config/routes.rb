Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show] do
    resources :parties, except:[:delete, :patch]
  end
  resources :parties, only:[:delete, :patch] do
    resources :bookmarks, except:[:delete, :patch]
  end
  resources :bookmarks, only:[:delete]
  resources :parties_display, only:[:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
