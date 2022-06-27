class Author < ApplicationRecord
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  # associations
  has_many :articles
end
