class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update destroy ]
  load_and_authorize_resource


  # GET /products or /products.json
  def index
    @products =  Product.filter(params.slice(:category, :brand, :price_lte, :price_gte))
    @products = @products.public_send("search_by_title_or_description", params.fetch(:q)) if params.slice(:q).present?
    @categories = Category.all
    @brands = Brand.all
    if current_user
      @in_cart =  current_user.cart.product_adapters.pluck(:product_id)
    end
  end

  def home
    render "products/home"
  end

  # GET /products/1 or /products/1.json
  def show
    if current_user
      @in_cart =  current_user.cart.product_adapters.pluck(:product_id)
    end
  end

  # GET /products/new
  def new
    @user = current_user
    @brands = Brand.all
    @categories = Category.all
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @product_brand = @product.brand.name
    @product_category = @product.category.name
    @brands = Brand.all
    @categories = Category.all
  end

  # POST /products or /products.json
  def create
    @brands = Brand.all
    @categories = Category.all
    # render plain: params[:product].inspect
    @product = Product.new(product_params)
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      if Product.where(id: params[:id]).exists?
        @product = Product.find(params[:id])
      else
        render "Not Found"
      end
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :in_stock, :brand_id, :category_id, :store_id, images: [])
    end
end
