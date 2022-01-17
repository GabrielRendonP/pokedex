class Pokemons::SearchController < ApplicationController
  def index
    @pokemons = if params[:show_all]
                  Pokemon.sortify params[:sort]
                else
                  Pokemon.search(params[:search_this])
                end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(:pokemonListing, partial: 'pokemons/search/listing')
      end
    end
  end
end
