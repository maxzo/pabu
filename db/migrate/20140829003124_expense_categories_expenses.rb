class ExpenseCategoriesExpenses < ActiveRecord::Migration
  def change
  	create_table :expense_categories_expenses, id: false do |t|
      t.belongs_to :expense_category
      t.belongs_to :expense
    end
  end
end
