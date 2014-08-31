class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.datetime :date
      t.text :description
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
