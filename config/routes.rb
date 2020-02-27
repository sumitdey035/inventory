Rails.application.routes.draw do

  namespace :admin do
    resources :pictures,            only: [:destroy]
    resources :image_sliders,       except: [:show]
    resources :price_requests,      except: [:edit, :show]
    resources :brands,              except: [:new, :show]
    resources :catelogs,            except: [:new, :show] do
      post :save_catelog_items,     :on => :member
      get :catelog_items,           :on => :member
    end
    resources :categories,          except: [:new, :show]
    resources :products             do
      post :upload,      :on => :member
      post :update_stock,:on => :collection
    end
    resources :posts                 do
      post :upload,      :on => :member
    end
    resources :pages,               except: [:show]
    resources :admin,               only: [:index]
  end

  resources :cart_items,          except: [:edit, :update]
  resources :orders,              only: [:create, :show, :index] do
    get :checkout,      :on => :collection
  end
  resources :products,            only: [:show]
  resources :posts,               only: [:index, :show]
  resources :pages,               only: [:show]
  resources :catelogs,            only: [:index, :show]
  resources :addresses,           except: [:show]

  root 'welcome#index'

  devise_for :users, controllers: {
    sessions:       'users/sessions',
    registrations:  'users/registrations',
    passwords:      'users/passwords',
  }

  

  get 'admin' => 'admin/admin#index'
end
