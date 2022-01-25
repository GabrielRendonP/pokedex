class PokeTypesController < ApplicationController
  before_action :authenticate_trainer!, except: %i[index]
  before_action :set_poke_type, only: %i[show edit update destroy]

  # GET /poke_types or /poke_types.json
  def index
    @poke_types = PokeType.all
  end

  # GET /poke_types/1 or /poke_types/1.json
  def show; end

  # GET /poke_types/new
  def new
    @poke_type = PokeType.new
  end

  # GET /poke_types/1/edit
  def edit; end

  def add_poke_type
    pokemon = Pokemon.find_by_id(params[:poke_id])
    poke_type = PokeType.find_by(name: params[:name])
    pokemon.poke_types << poke_type
    redirect_to pokemon, notice: 'Type added!'
  end

  def delete_type_asoc
    pokemon = Pokemon.find_by_id(params[:poke_id])
    pokemon.poke_types.delete(PokeType.find_by_id(params[:id]))
    redirect_to pokemon, notice: 'Type removed!'
  end

  # POST /poke_types or /poke_types.json
  def create
    @poke_type = PokeType.new(poke_type_params)

    respond_to do |format|
      if @poke_type.save
        format.html { redirect_to poke_type_url(@poke_type), notice: 'Poke type was successfully created.' }
        format.json { render :show, status: :created, location: @poke_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poke_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poke_types/1 or /poke_types/1.json
  def update
    respond_to do |format|
      if @poke_type.update(poke_type_params)
        format.html { redirect_to poke_type_url(@poke_type), notice: 'Poke type was successfully updated.' }
        format.json { render :show, status: :ok, location: @poke_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poke_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poke_types/1 or /poke_types/1.json
  def destroy
    @poke_type.destroy

    respond_to do |format|
      format.html { redirect_to poke_types_url, notice: 'Poke type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_poke_type
    @poke_type = PokeType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def poke_type_params
    params.require(:poke_type).permit(:name)
  end
end
