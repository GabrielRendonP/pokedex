Rails.application.routes.draw do
  resources :poke_abilities
  root 'home#index'
  devise_for :trainers

  resources :poke_types
  resources :pokemons
  resources :trainers
  resources :pokes
  
  get 'add_ability', to: 'poke_abilities#link_ability'
  get 'add_type', to: 'poke_types#add_poke_type'
  delete 'delete_ability', to: 'poke_abilities#delete_ability_asoc'
  delete 'delete_type', to: 'poke_types#delete_type_asoc'

  get '/menu', to: 'mobile_menu#index'
  post '/poke_search', to: 'pokemons/search#index'
end
