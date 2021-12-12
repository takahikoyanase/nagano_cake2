class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :public
  attachment :image
end
