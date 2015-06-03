class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password, :index => true, :null => false, :unique => true
      t.string :user, :index => true, :null => false, :unique => true

      t.timestamps null: false
    end
  end
end
