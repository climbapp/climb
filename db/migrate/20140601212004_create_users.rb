class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.boolean :sms_remind?
      t.boolean :email_remind?
      t.integer :phone

      t.timestamps
    end
  end
end
