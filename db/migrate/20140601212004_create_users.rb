class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :sms_remind?
      t.boolean :email_remind?
      t.integer :phone

      t.timestamps
    end
  end
end
