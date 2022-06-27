class Comment < ApplicationRecord
  validates :author, presence: true
  validates :article, presence: true

  # assosication
  belongs_to :author
  belongs_to :article
end
