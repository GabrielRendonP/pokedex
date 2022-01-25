class PokeAbilitiesController < ApplicationController
  before_action :authenticate_trainer!, except: %i[index]
  before_action :set_poke_ability, only: %i[show edit update destroy]

  # GET /poke_abilities or /poke_abilities.json
  def index
    @poke_abilities = PokeAbility.all
  end

  # GET /poke_abilities/1 or /poke_abilities/1.json
  def show; end

  # GET /poke_abilities/new
  def new
    @poke_ability = PokeAbility.new
  end

  # GET /poke_abilities/1/edit
  def edit; end

  # POST /poke_abilities or /poke_abilities.json
  def create
    @poke_ability = PokeAbility.new(poke_ability_params)

    respond_to do |format|
      if @poke_ability.save
        format.html { redirect_to poke_ability_url(@poke_ability), notice: 'Poke ability was successfully created.' }
        format.json { render :show, status: :created, location: @poke_ability }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poke_ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poke_abilities/1 or /poke_abilities/1.json
  def update
    respond_to do |format|
      if @poke_ability.update(poke_ability_params)
        format.html { redirect_to poke_ability_url(@poke_ability), notice: 'Poke ability was successfully updated.' }
        format.json { render :show, status: :ok, location: @poke_ability }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poke_ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poke_abilities/1 or /poke_abilities/1.json
  def destroy
    @poke_ability.destroy

    respond_to do |format|
      format.html { redirect_to poke_abilities_url, notice: 'Poke ability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_ability_asoc
    pokemon = Pokemon.find_by_id(params[:poke_id])
    authorize! :edit, pokemon
    pokemon.poke_abilities.delete(PokeAbility.find(params[:id]))
    redirect_to pokemon, notice: 'Ability removed!'
  end

  def link_ability
    pokemon = Pokemon.find_by(id: params[:poke_id])
    ability = PokeAbility.find_by(name: params[:name])
    authorize! :edit, pokemon
    pokemon.poke_abilities << ability
    redirect_to pokemon, notice: 'Ability added!'
  end

    # GET /abilities/1/edit
    def edit; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_poke_ability
    @poke_ability = PokeAbility.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def poke_ability_params
    params.require(:poke_ability).permit(:name, :description)
  end
end
