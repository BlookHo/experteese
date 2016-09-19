class AddThemeIdToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :theme_id, :integer
  end
end
