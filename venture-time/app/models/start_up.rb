class StartUp < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_secure_password
  

  has_many :start_up_investors
  has_many :investors, through: :start_up_investors
end
