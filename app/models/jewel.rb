class Jewel < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews

  has_attached_file :jewel_img,
                    styles: { jewel_index: "250x250>",
                              jewel_show: "325x475>" }

  validates_attachment_content_type :jewel_img, content_type: /\Aimage\/.*\z/

end
