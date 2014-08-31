class IncomeCategoriesController < ApplicationController
  before_action :set_income_category, only: [:show, :edit, :update, :destroy]

  # GET /income_categories
  # GET /income_categories.json
  def index
    @income_categories = IncomeCategory.all
  end

  # GET /income_categories/1
  # GET /income_categories/1.json
  def show
  end

  # GET /income_categories/new
  def new
    @income_category = IncomeCategory.new
  end

  # GET /income_categories/1/edit
  def edit
  end

  # POST /income_categories
  # POST /income_categories.json
  def create
    @income_category = IncomeCategory.new(income_category_params)

    respond_to do |format|
      if @income_category.save
        format.html { redirect_to @income_category, notice: 'Income category was successfully created.' }
        format.json { render :show, status: :created, location: @income_category }
      else
        format.html { render :new }
        format.json { render json: @income_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /income_categories/1
  # PATCH/PUT /income_categories/1.json
  def update
    respond_to do |format|
      if @income_category.update(income_category_params)
        format.html { redirect_to @income_category, notice: 'Income category was successfully updated.' }
        format.json { render :show, status: :ok, location: @income_category }
      else
        format.html { render :edit }
        format.json { render json: @income_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_categories/1
  # DELETE /income_categories/1.json
  def destroy
    @income_category.destroy
    respond_to do |format|
      format.html { redirect_to income_categories_url, notice: 'Income category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income_category
      @income_category = IncomeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_category_params
      params.require(:income_category).permit(:name)
    end
end
