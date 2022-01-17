Rails.application.routes.draw do
  get 'mobile_menu/index'
  resources :poke_data
  resources :poke_types
  resources :abilities
  resources :pokemons
  resources :trainers
  resources :pokes

  get 'add_ability', to: 'abilities#link_ability'
  get 'add_type', to: 'poke_types#add_poke_type'
  root 'trainers#index'

  get '/menu', to: 'mobile_menu#index'
  post '/poke_search', to: 'pokemons/search#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
