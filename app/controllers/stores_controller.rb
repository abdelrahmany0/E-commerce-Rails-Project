class StoresController < InheritedResources::Base
  before_action :authenticate_user!
  load_and_authorize_resource


  # GET /orders or /orders.json
  def index
    @stores = current_user.stores
  end

  # GET /orders/1 or /orders/1.json
  def show
    @store = current_user.stores.first
    @orders = @store.orders.distinct
  end

  # GET /orders/new
  def new
    # @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    # cart = current_user.cart
    # total = cart.calculate_total
    # order = Order.create({:user_id => current_user.id })
    # cart.product_adapters.map{|item| item.purchasable = order; item.item_price = item.product.price; item.save; order.store << item.product.store}
    # order.total = total
    # order.save
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    # respond_to do |format|
    #   if @order.update(order_params)
    #     format.html { redirect_to @order, notice: "Order was successfully updated." }
    #     format.json { render :show, status: :ok, location: @order }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    # @order.destroy
    # respond_to do |format|
    #   format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private

    def store_params
      params.require(:store).permit(:name, :summary, :user_id)
    end

end
