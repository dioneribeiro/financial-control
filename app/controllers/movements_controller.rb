class MovementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movement, only: %i[ destroy ]

  # GET /movements or /movements.json
  def index
    @movements = collection.order(date: :desc, created_at: :desc)
    @saldo = collection.saldo_atual
    @saldo_saida = collection.saldo_saida
    @saldo_entrada = collection.saldo_entrada

  end

  # GET /movements/new
  def new
    @movement = collection.new
  end

  # POST /movements or /movements.json
  def create
    @movement = collection.new(movement_params)

    respond_to do |format|
      if @movement.save
        format.html { redirect_to movements_url, notice: "A movimentação foi criada com sucesso." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movements/1 or /movements/1.json
  def destroy
    @movement.destroy

    redirect_to movements_url, notice: "A movimentação foi removida com sucesso."
    # respond_to do |format|
    #   format.html { redirect_to movements_url, notice: "A movimentação foi removida com sucesso." }
    #   format.json { head :no_content }
    # end
  end

  private

  def collection
    current_user.movements
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_movement
    @movement = collection.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movement_params
    params.require(:movement).permit(:date, :description, :value, :category)
  end
end
