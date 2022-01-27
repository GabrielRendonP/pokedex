class Services::V1::PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all
    render json: @pokemons
  end

  def show
    @pokemon = Pokemon.find_by_id(params[:id])
    render json: @pokemon
  end
end
