class NuancesController < ApplicationController
  before_action :set_nuance, only: %i[ show edit update destroy ]

  # GET /nuances or /nuances.json
  def index
    @nuances = Nuance.all
  end

  # GET /nuances/1 or /nuances/1.json
  def show
  end

  # GET /nuances/new
  def new
    @nuance = Nuance.new
  end

  # GET /nuances/1/edit
  def edit
  end

  # POST /nuances or /nuances.json
  def create
    @nuance = Nuance.new(nuance_params)

    respond_to do |format|
      if @nuance.save
        format.html { redirect_to nuance_url(@nuance), notice: "Nuance was successfully created." }
        format.json { render :show, status: :created, location: @nuance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nuance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nuances/1 or /nuances/1.json
  def update
    respond_to do |format|
      if @nuance.update(nuance_params)
        format.html { redirect_to nuance_url(@nuance), notice: "Nuance was successfully updated." }
        format.json { render :show, status: :ok, location: @nuance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nuance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nuances/1 or /nuances/1.json
  def destroy
    @nuance.destroy

    respond_to do |format|
      format.html { redirect_to nuances_url, notice: "Nuance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nuance
      @nuance = Nuance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nuance_params
      params.require(:nuance).permit(:name, :image)
    end
end
