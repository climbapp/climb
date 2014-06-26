class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :sms_remind?
      t.boolean :email_remind?
      t.string :phone

      t.timestamps
    end
  end
end
