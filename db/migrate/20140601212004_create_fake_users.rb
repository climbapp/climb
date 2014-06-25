class CreateFakeUsers < ActiveRecord::Migration
  def change
    create_table :fakeusers do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.boolean :sms_remind?
      t.boolean :email_remind?
      t.string :phone

      t.timestamps
    end
  end
end
