Rails.application.routes.draw do
  root 'products#index'

  resources :products do
    member do
      post :add_to_cart
    end
  end

  get 'shopping_cart', to: 'shopping_carts#show'
  post 'shopping_cart/add', to: 'shopping_carts#add_item', as: 'shopping_cart_add'
  delete 'shopping_cart/remove/:item_id', to: 'shopping_carts#remove_item', as: 'remove_item'
  post 'shopping_cart/checkout', to: 'shopping_carts#checkout', as: 'shopping_cart_checkout'
end
