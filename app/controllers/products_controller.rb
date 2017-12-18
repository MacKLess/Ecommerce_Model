class ProductsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :admin, except: [:index, :show]

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    @order_item = OrderItem.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product created!"
      redirect_to '/'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @order_item = OrderItem.new
    if @product.update(product_params)
      respond_to do |format|
        format.html {
          flash[:notice] = "Product updated successfully."
          redirect_to product_path(@product)
        }
        format.js
      end
    else
      flash[:alert] = @product.errors.full_messages
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html {
        flash[:notice] = "Product has been destroyed."
        redirect_to products_path
      }
      format.js
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
