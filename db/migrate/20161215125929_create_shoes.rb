class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :product
      t.decimal :amount
      t.references :seller, index: true
      t.references :buyer, index: true

      t.timestamps
    end
  end
end
