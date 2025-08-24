class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.turbo_stream { render turbo_stream: turbo_stream.append("products", partial: "products/product", locals: { product: @product }) }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("products_form", partial: "products/form", locals: { product: @product })
        end
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("product_#{@product.id}", partial: "products/product", locals: { product: @product })
        end
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("product_#{@product.id}") }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.expect(product: [ :name ])
    end
end
