class AddCategoryIdToJewels < ActiveRecord::Migration[5.0]
  def change
    add_column :jewels, :category_id, :integer
  end
end
