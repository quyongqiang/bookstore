class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  belongs_to :publisher 


  validates :coverpath, presence: true
end
