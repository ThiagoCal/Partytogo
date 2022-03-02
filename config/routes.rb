Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    resources :bookmarks, except:[:delete, :patch]
    resources :parties, except:[:delete, :patch]
  end
  resources :parties, only:[:delete, :patch] do
    resources :reviews, except:[:delete, :patch]
  end
  resources :bookmarks, only:[:delete]
  resources :reviews, only:[:delete, :patch]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
