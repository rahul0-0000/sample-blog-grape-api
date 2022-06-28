class Article < ApplicationRecord
  validates :author, presence: true

  # associations
  belongs_to :author
  has_many :comments
end
