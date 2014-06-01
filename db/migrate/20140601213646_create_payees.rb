class CreatePayees < ActiveRecord::Migration
  def change
    create_table :payees do |t|
      t.string :name, null: false, unique: true
      t.string :recurring, null: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
