class IncomeCategoriesIncomes < ActiveRecord::Migration
  def change
  	create_table :income_categories_incomes, id: false do |t|
      t.belongs_to :income_category
      t.belongs_to :income
    end
  end
end
