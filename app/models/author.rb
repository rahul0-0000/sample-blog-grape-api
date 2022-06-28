class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  # associations
  has_many :articles
  has_one :user_access_token, -> { where("status = 1") }

  # callbacks
  after_save :save_access_token

  def save_access_token
    token = Devise.friendly_token
    save_access_token if UserAccessToken.exists?(access_token: token)
    UserAccessToken.create!(access_token: Devise.friendly_token, author_id: self.id)
  end
end
