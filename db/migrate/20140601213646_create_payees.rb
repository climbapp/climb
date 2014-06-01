class CreatePayees < ActiveRecord::Migration
  def change
    create_table :payees do |t|
      t.string :name
      t.string :recurring
      t.references :user, index: true

      t.timestamps
    end
  end
end
