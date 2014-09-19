class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all.sort_by { |e| e.date }.reverse
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @categories = ExpenseCategory.all.sort_by { |c| c.name }
  end

  # GET /expenses/1/edit
  def edit
    @categories = ExpenseCategory.all.sort_by { |c| c.name }
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(date: expense_params[:date],
      description: expense_params[:description], amount: expense_params[:amount])

    expense_params[:expense_categories].reject(&:blank?).each do |id|
      @expense.expense_categories << ExpenseCategory.find(id)
    end

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_path, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: expenses_path }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    @expense.date = expense_params[:date]
    @expense.description = expense_params[:description]
    @expense.amount = expense_params[:amount].to_f
    @expense.expense_categories.clear

    expense_params[:expense_categories].reject(&:blank?).each do |id|
      @expense.expense_categories << ExpenseCategory.find(id)
    end

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_path, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: expenses_path }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:date, :description, :amount, expense_categories: [])
    end
end
