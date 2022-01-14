class PokeDataController < ApplicationController
  before_action :set_poke_datum, only: %i[show edit update destroy]

  # GET /poke_data or /poke_data.json
  def index
    @poke_data = PokeDatum.all
  end

  # GET /poke_data/1 or /poke_data/1.json
  def show; end

  # GET /poke_data/new
  def new
    @poke_datum = PokeDatum.new
  end

  # GET /poke_data/1/edit
  def edit; end

  # POST /poke_data or /poke_data.json
  def create
    @poke_datum = PokeDatum.new(poke_datum_params)

    respond_to do |format|
      if @poke_datum.save
        format.html { redirect_to poke_datum_url(@poke_datum), notice: 'Poke datum was successfully created.' }
        format.json { render :show, status: :created, location: @poke_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poke_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poke_data/1 or /poke_data/1.json
  def update
    respond_to do |format|
      if @poke_datum.update(poke_datum_params)
        format.html { redirect_to poke_datum_url(@poke_datum), notice: 'Poke datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @poke_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poke_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poke_data/1 or /poke_data/1.json
  def destroy
    @poke_datum.destroy

    respond_to do |format|
      format.html { redirect_to poke_data_url, notice: 'Poke datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_poke_datum
    @poke_datum = PokeDatum.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def poke_datum_params
    params.require(:poke_datum).permit(:name, :picture)
  end
end
