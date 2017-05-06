class Review < ApplicationRecord
  belongs_to :jewel
  belongs_to :user
end
