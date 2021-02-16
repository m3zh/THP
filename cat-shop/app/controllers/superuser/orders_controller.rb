class Superuser::OrdersController < Superuser::BaseController
    before_action :check_if_superuser

    def index
      @orders = Order.all
      respond_to do |format|
        format.html { redirect_to superuser_orders_path }
        format.js { }
      end   
    end

    def show
      @order = Order.find(params[:id])
      @order.update(read: true)
      puts @order
      respond_to do |format|
        format.html { redirect_to superuser_order_path(@order.id) }
        format.js { }
        puts @order
      end   
    end

    private

    def order_params
      params.require(:order)
    end
  
end