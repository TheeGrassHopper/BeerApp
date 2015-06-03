class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :brewer, :index => true
      t.string :name, :null => false
      t.string :beer_type, :index => true, :null => false
      t.float :abv
    end
  end
end
