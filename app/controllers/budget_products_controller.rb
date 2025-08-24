class BudgetProductsController < ApplicationController
  before_action :set_budget_product, only: %i[ show edit update destroy ]

  # GET /budget_products or /budget_products.json
  def index
    @budget_products = BudgetProduct.all
  end

  # GET /budget_products/1 or /budget_products/1.json
  def show
  end

  # GET /budget_products/new
  def new
    @budget_product = BudgetProduct.new
  end

  # GET /budget_products/1/edit
  def edit
  end

  # POST /budget_products or /budget_products.json
  def create
    @budget_product = BudgetProduct.new(budget_product_params)

    respond_to do |format|
      if @budget_product.save
        format.html { redirect_to @budget_product, notice: "Budget product was successfully created." }
        format.json { render :show, status: :created, location: @budget_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @budget_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budget_products/1 or /budget_products/1.json
  def update
    respond_to do |format|
      if @budget_product.update(budget_product_params)
        format.html { redirect_to @budget_product, notice: "Budget product was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @budget_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @budget_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budget_products/1 or /budget_products/1.json
  def destroy
    @budget_product.destroy!

    respond_to do |format|
      format.html { redirect_to budget_products_path, notice: "Budget product was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_product
      @budget_product = BudgetProduct.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def budget_product_params
      params.expect(budget_product: [ :value, :quantity, :product_id, :budget_id ])
    end
end
