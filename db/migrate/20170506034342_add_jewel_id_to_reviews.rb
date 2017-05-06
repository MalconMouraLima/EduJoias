class AddJewelIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :jewel_id, :integer
  end
end
