class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.boolean :paid?
      t.float :amount_due, null: false
      t.datetime :due_date, null: false
      t.float :late_fee
      t.float :interest
      t.float :min_due
      t.references :payee, index: true

      t.timestamps
    end
  end
end
