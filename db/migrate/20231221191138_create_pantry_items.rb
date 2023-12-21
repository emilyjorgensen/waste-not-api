class CreatePantryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :pantry_items do |t|
      t.integer :user_id
      t.integer :ingredient_id
      t.string :amount
      t.string :category
      t.string :use_by_date

      t.timestamps
    end
  end
end
