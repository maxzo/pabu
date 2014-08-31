class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.datetime :date
      t.text :description
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
