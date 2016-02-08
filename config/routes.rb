Rails.application.routes.draw do
  devise_for :travellers
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :home
    resources :to_dos do 
      member do 
        get 'photos'
        post 'create_like'
        delete 'delete_like'
      end

      collection do
        get 'unsynced_changes'
        get 'latest_timestamps'
        get 'search'
      end

    end

end
