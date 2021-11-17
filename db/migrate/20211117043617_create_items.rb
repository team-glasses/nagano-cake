class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :category_id
      t.string :name
      t.text :explanation
      t.integer :price
      t.string :image_id
      t.boolean :is_active

      t.timestamps
    end
  end
end
