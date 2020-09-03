class Review < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :rating, :inclusion => {:in => 1..5}
end
