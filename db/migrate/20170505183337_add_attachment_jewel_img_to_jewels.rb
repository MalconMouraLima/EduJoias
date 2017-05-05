class AddAttachmentJewelImgToJewels < ActiveRecord::Migration
  def self.up
    change_table :jewels do |t|
      t.attachment :jewel_img
    end
  end

  def self.down
    remove_attachment :jewels, :jewel_img
  end
end
