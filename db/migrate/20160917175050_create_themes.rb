class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.string :name
      t.integer :qty_items

      t.timestamps
    end
  end
end
