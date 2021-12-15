class OrdersController < ApplicationController
  before_action :set_order, only: [:show]



  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # POST /orders
  # POST /orders.json
  def create
    input = params[:input_string]
    parsed = Order.parse_input(input)
    if parsed[:result]
      params[:order_number] = parsed[:order_number]
      params[:delivery_date] = parsed[:delivery_date]
      @order = Order.new(order_params)
    end

    respond_to do |format|
      if parsed[:result]
        if @order.save
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
          format.json { render :show, status: :ok }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      else  # parsing encountered error
        format.json { render json: {error: "bad input"}, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
       params.permit(:order_number, :delivery_date)
    end
end
