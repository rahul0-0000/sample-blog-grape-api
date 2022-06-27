class Article < ApplicationRecord
  validates :author, presence: true

  # associations
  belongs_to :author
end
