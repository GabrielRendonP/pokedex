class Pokemons::SearchController < ApplicationController
  def index
    @canyouseethis = 'helo helo'
    @pokemons = Pokemon.all
    # @results = if params['show_all']
    #             Pokemon.includes(:name).where(user_id: current_user.id).sortify params['sort']
    #           else
    #             Pokemon.includes(:name).where(user_id: current_user.id).search(params[:search_this])
    #           end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(:pokemonListing, partial: 'pokemons/search/listing')
      end
    end
  end
end
