Rails.application.routes.draw do
  root 'products#index'

  resources :products

  get 'shopping_cart', to: 'shopping_carts#show'
  post 'shopping_cart/add', to: 'shopping_carts#add_item'
  delete 'shopping_cart/remove/:item_id', to: 'shopping_carts#remove_item', as: 'remove_item'
  post 'shopping_cart/checkout', to: 'shopping_carts#checkout'
end
